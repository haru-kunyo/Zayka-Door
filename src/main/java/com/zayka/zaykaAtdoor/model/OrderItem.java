package com.zayka.zaykaAtdoor.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class OrderItem {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int quantity;

    @ManyToOne
    @JoinColumn(name = "menu_item_id")
    private MenuItems menuItems;

    @ManyToOne
    @JoinColumn(name = "orders_id")
    private Orders orders;

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public MenuItems getMenuItems() {
		return menuItems;
	}

	public void setMenuItems(MenuItems menuItems) {
		this.menuItems = menuItems;
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public int getId() {
		return id;
	}
    
    
}
