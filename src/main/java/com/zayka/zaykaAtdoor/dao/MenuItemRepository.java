package com.zayka.zaykaAtdoor.dao;


import java.awt.MenuItem;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zayka.zaykaAtdoor.model.MenuItems;

public interface MenuItemRepository extends JpaRepository<MenuItems, Integer>{
	List<MenuItem> findByRestaurantId(int restaurantId);
}
