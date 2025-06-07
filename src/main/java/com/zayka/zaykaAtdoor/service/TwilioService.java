package com.zayka.zaykaAtdoor.service;

import java.time.LocalDateTime;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zayka.zaykaAtdoor.config.TwilioConfiguration;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

import jakarta.annotation.PostConstruct;

@Service
public class TwilioService {

    private final TwilioConfiguration config;

    private Map<String, OtpEntry> otpMap = new HashMap<>();

    @Autowired
    public TwilioService(TwilioConfiguration config) {
        this.config = config;
    }

    // Initialize Twilio once when the service is created
    @PostConstruct
    public void init() {
        Twilio.init(config.getAccountSid(), config.getAuthToken());
    }

    public void saveOtp(String phone, String otp) {
        otpMap.put(phone, new OtpEntry(otp, LocalDateTime.now().plusMinutes(3)));
    }

    public void sendOtp(String to, String otp) {
        String message = "Your Zayka@Door OTP is: " + otp;
        Message.creator(
                new PhoneNumber(to),
                new PhoneNumber(config.getPhoneNumber()),
                message
        ).create();
    }

    public boolean verifyOtp(String phone, String otp) {
        OtpEntry entry = otpMap.get(phone);
        System.out.println("Verifying OTP for phone: " + phone);
        if (entry == null) {
            System.out.println("No OTP entry found for phone");
            return false;
        }
        System.out.println("Stored OTP: " + entry.otp + ", Expiry: " + entry.expiry);
        if (LocalDateTime.now().isAfter(entry.expiry)) {
            System.out.println("OTP expired");
            return false;
        }
        boolean matched = entry.otp.equals(otp);
        System.out.println("OTP match result: " + matched);
        return matched;
    }


    public void clearOtp(String phone) {
        otpMap.remove(phone);
    }

    private static class OtpEntry {
        String otp;
        LocalDateTime expiry;

        OtpEntry(String otp, LocalDateTime expiry) {
            this.otp = otp;
            this.expiry = expiry;
        }
    }
}
