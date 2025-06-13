package com.zayka.zaykaAtdoor.controller;

import java.awt.MenuItem;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zayka.zaykaAtdoor.dao.MenuItemRepository;
import com.zayka.zaykaAtdoor.dao.ResturantRepository;
import com.zayka.zaykaAtdoor.model.Resturant;

@Controller
@RequestMapping("/resturant")
public class MenuController {
	@Autowired
    private MenuItemRepository menuItemRepository;
	
	@Autowired
    private ResturantRepository restaurantRepository;
	
	@GetMapping("/menu/{phoneNumber}")
    @ResponseBody
    public ResponseEntity<List<MenuItem>> getMenuItems(@PathVariable String phoneNumber) {
        try {
            Resturant resturant = restaurantRepository.findByPhoneNumber(phoneNumber);
            if (resturant == null) {
                return ResponseEntity.notFound().build();
            }
            
            List<MenuItem> menuItems = menuItemRepository.findByRestaurantId(resturant.getId());
            return ResponseEntity.ok(menuItems);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
	
	
}
