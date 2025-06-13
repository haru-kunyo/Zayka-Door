package com.zayka.zaykaAtdoor.controller;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zayka.zaykaAtdoor.dao.ConsumerRepository;
import com.zayka.zaykaAtdoor.dao.ResturantRepository;
import com.zayka.zaykaAtdoor.model.Consumer;
import com.zayka.zaykaAtdoor.model.Resturant;
import com.zayka.zaykaAtdoor.service.TwilioService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ResturantController {
	
	@Autowired
	private ResturantRepository rr;
	
	@Autowired
	private ConsumerRepository cc;
	
	@Autowired
    private TwilioService twilioService;
	
	private Resturant tempRes;
	
	private Consumer tempCon;
	
	@GetMapping("/")
	public String login() {
		return "Login";
	}
	
	@GetMapping("/register")
	public String register() {
		return "Register";
	}
	@PostMapping("/register")
	public String register(@RequestParam("userType") String userType,@RequestParam("countryCode") String countryCode,@RequestParam("number") String number,ModelMap model) {
		String formattedNumber = countryCode+number;
		model.put("userType", userType);
		model.put("a", formattedNumber);
		String otp = String.valueOf(new Random().nextInt(900000) + 100000);
		twilioService.saveOtp(formattedNumber, otp);
		twilioService.sendOtp(formattedNumber, otp);
		Resturant r = new Resturant();
		Consumer c = new Consumer();
		if(userType.equals("restaurant")) {
			r.setPhoneNumber(formattedNumber);
			r.setSetVerified(false);
			tempRes = r;
			return "verify";
		}else {
			c.setNumber(formattedNumber);
			c.setVerified(false);
			tempCon = c;
			return "verify";
		}
	}
	@GetMapping("/verify")
	public String otp() {
		return "verify";
	}
	@PostMapping("/verify")
	public String otp(@RequestParam String userType,@RequestParam String formattedNumber, @RequestParam String otp, ModelMap model, HttpSession session) {
		if(userType.equals("restaurant")) {
			if (twilioService.verifyOtp(formattedNumber, otp)) {
            session.setAttribute("verifiedPhone", formattedNumber);
            tempRes.setSetVerified(true);
            rr.save(tempRes);
            twilioService.clearOtp(formattedNumber);
            return "redirect:/register/resDetails";
        } else {
            model.put("msg", "Invalid or expired OTP");
            return "verify";
        }
		}else {
			if (twilioService.verifyOtp(formattedNumber, otp)) {
	            // Set verified true and save
	            tempCon.setVerified(true);
	            cc.save(tempCon);
	            twilioService.clearOtp(formattedNumber);
	            return "resDetails";
	        } else {
	            model.put("msg", "Invalid or expired OTP");
	            return "verify";
		}
		
		}
	}
	
	@GetMapping("/register/resDetails")
	public String details(HttpSession session, ModelMap model) {
	    String phone = (String) session.getAttribute("verifiedPhone");
	    
	    // Add null check for phone
	    if (phone == null) {
	        return "redirect:/login"; // or appropriate login page
	    }
	    
	    Resturant restaurant = rr.findByPhoneNumber(phone);
	    model.addAttribute("restaurant", restaurant);
	    return "resDetails";
	}

	@PostMapping("/register/resDetails")
	public String details(HttpSession session, ModelMap model, 
	                     @RequestParam String resName, 
	                     @RequestParam String ownerName, 
	                     @RequestParam String fssaiNo) {
	    
	    String phone = (String) session.getAttribute("verifiedPhone");
	    
	    // Add null check for phone
	    if (phone == null) {
	        return "redirect:/login"; // or appropriate login page
	    }
	    
	    Resturant existing = rr.findByPhoneNumber(phone);
	    
	    // Add null check for existing restaurant
	    if (existing == null) {
	        // Handle case where restaurant doesn't exist
	        return "redirect:/register"; // or appropriate registration page
	    }
	    
	    existing.setResName(resName);
	    existing.setOwnername(ownerName); // Fixed method name
	    existing.setFSSAI_NO(fssaiNo);
	    rr.save(existing);
	    
	    return "redirect:/register/addressDetails";
	}

	@GetMapping("/register/addressDetails")
	public String addressDetails(HttpSession session, ModelMap model) {
	    String phone = (String) session.getAttribute("verifiedPhone");
	    
	    // Add null check for phone
	    if (phone == null) {
	        return "redirect:/login"; // or appropriate login page
	    }
	    
	    // Get restaurant details to display on address form if needed
	    Resturant restaurant = rr.findByPhoneNumber(phone);
	    model.addAttribute("restaurant", restaurant);
	    
	    return "addressDetails";
	}

	@PostMapping("/register/addressDetails")
	public String saveAddressDetails(HttpSession session, ModelMap model,
	                               @RequestParam String addLine,
	                               @RequestParam String city,
	                               @RequestParam String state,
	                               @RequestParam String pincode) {
	    
	    String phone = (String) session.getAttribute("verifiedPhone");
	    
	    // Add null check for phone
	    if (phone == null) {
	        return "redirect:/login"; // or appropriate login page
	    }
	    
	    Resturant existing = rr.findByPhoneNumber(phone);
	    if (existing == null) {
	        return "redirect:/register";
	    }
	    existing.setAddLine(addLine);
	    existing.setCity(city);
	    existing.setState(state);
	    existing.setPincode(pincode);
	    rr.save(existing);
	    return "redirect:/resturant/dashboard/" + phone;
	}
	
	@GetMapping("/resturant/dashboard/{phoneNumber}")
	public String dash(@PathVariable String phoneNumber, HttpSession session, ModelMap model) {
		Resturant resturant = rr.findByPhoneNumber(phoneNumber);
		if (resturant == null) {
            return "/";
        }
		session.setAttribute("verifiedPhone", phoneNumber);
		model.addAttribute("resName", resturant.getResName());
		model.addAttribute("ownername", resturant.getOwnername());
		model.addAttribute("phoneNumber", resturant.getPhoneNumber());
		model.addAttribute("fssaiNo", resturant.getFSSAI_NO());
		model.addAttribute("addLine", resturant.getAddLine());
		model.addAttribute("city", resturant.getCity());
		model.addAttribute("state", resturant.getState());
		model.addAttribute("pincode", resturant.getPincode());
		model.addAttribute("profileImageUrl", resturant.getProfileImageUrl());
		model.addAttribute("openingTime", resturant.getOpeningTime().format(DateTimeFormatter.ofPattern("HH:mm")));
		model.addAttribute("closingTime", resturant.getClosingTime().format(DateTimeFormatter.ofPattern("HH:mm")));
		model.addAttribute("resturant", resturant);
		return "ResturantDashboard";
	}
	
	@PostMapping("/resturant/dashboard/{phoneNumber}")
	public String dash(@PathVariable String phoneNumber,
            @RequestParam String resName,
            @RequestParam String ownername,
            @RequestParam String fssaiNo,
            @RequestParam String addLine,
            @RequestParam String city,
            @RequestParam String state,
            @RequestParam String pincode,
            @RequestParam(required = false) String profileImageUrl,
            @RequestParam(required = false) String openingTime,
            @RequestParam(required = false) String closingTime,
            HttpSession session,
            ModelMap model) {
		Resturant resturant = rr.findByPhoneNumber(phoneNumber);
		if (resturant == null) {
            return "redirect:/register";
        }
		resturant.setResName(resName);
        resturant.setOwnername(ownername);
        resturant.setFSSAI_NO(fssaiNo);
        resturant.setAddLine(addLine);
        resturant.setCity(city);
        resturant.setState(state);
        resturant.setPincode(pincode);
        if (profileImageUrl != null && !profileImageUrl.trim().isEmpty()) {
            resturant.setProfileImageUrl(profileImageUrl);
        }
        
        if (openingTime != null && !openingTime.trim().isEmpty()) {
            try {
                LocalTime parsedOpeningTime = LocalTime.parse(openingTime, DateTimeFormatter.ofPattern("HH:mm"));
                resturant.setOpeningTime(parsedOpeningTime);
            } catch (DateTimeParseException e) {
                model.addAttribute("errorMessage", "Invalid opening time format. Please use HH:mm format.");
                return "redirect:/restaurant/dashboard/" + phoneNumber + "?error=invalidOpeningTime";
            }
        }
        
        if (closingTime != null && !closingTime.trim().isEmpty()) {
            try {
                LocalTime parsedClosingTime = LocalTime.parse(closingTime, DateTimeFormatter.ofPattern("HH:mm"));
                resturant.setClosingTime(parsedClosingTime);
            } catch (DateTimeParseException e) {
                model.addAttribute("errorMessage", "Invalid closing time format. Please use HH:mm format.");
                return "redirect:/restaurant/dashboard/" + phoneNumber + "?error=invalidClosingTime";
            }
        }
        rr.save(resturant);
        model.addAttribute("successMessage", "Restaurant information updated successfully!");
        return "redirect:/resturant/dashboard/" + phoneNumber + "?success=true";
        
	}
}
