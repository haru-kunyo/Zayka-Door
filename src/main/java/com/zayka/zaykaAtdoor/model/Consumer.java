package com.zayka.zaykaAtdoor.model;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Consumer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String number;
	private String username;
	
	//address details
	private String addLine;
	private String city;
	private String State;
	private String Pincode;
	
	private boolean Verified;
	
	@OneToMany(mappedBy = "consumer", cascade = CascadeType.ALL)
	private List<Orders> orders;
	
	@OneToMany(mappedBy = "consumer", cascade = CascadeType.ALL)
	private List<Review> reviews;
	
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAddLine() {
		return addLine;
	}
	public void setAddLine(String addLine) {
		this.addLine = addLine;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getPincode() {
		return Pincode;
	}
	public void setPincode(String pincode) {
		Pincode = pincode;
	}
	public int getId() {
		return id;
	}
	public List<Orders> getOrders() {
		return orders;
	}
	public void setOrders(List<Orders> orders) {
		this.orders = orders;
	}
	public List<Review> getReviews() {
		return reviews;
	}
	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}
	public boolean getVerified() {
		return Verified;
	}
	public void setVerified(boolean verified) {
		Verified = verified;
	}
	
	
	
}
