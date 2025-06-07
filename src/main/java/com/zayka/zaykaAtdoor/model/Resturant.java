package com.zayka.zaykaAtdoor.model;

import java.time.LocalTime;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Resturant {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	//register or login page 
	@Column(unique = true)
	private String phoneNumber;
	
	//details of resturant
	private String ResName;
	private String Ownername;
	private String FSSAI_NO;
	private Boolean setVerified;
	
	//address details
	private String addLine;
	private String city;
	private String State;
	private String Pincode;
	
	//operational details
	private Boolean isOpen;
	private LocalTime openingTime;
    private LocalTime closingTime; 
    
    //images
    private String profileImageUrl;
    
    
    private Double averageRating;
    private Integer totalReviews;
    
    
    @OneToMany(mappedBy = "resturant", cascade = CascadeType.ALL)
    private List<MenuItems> menuItems;
    
    @OneToMany(mappedBy = "resturant", cascade = CascadeType.ALL)
    private List<Orders> orders;
    
    @OneToMany(mappedBy = "resturant", cascade = CascadeType.ALL)
    private List<Review> reviews;

	public int getId() {
		return id;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getResName() {
		return ResName;
	}

	public void setResName(String resName) {
		ResName = resName;
	}

	public String getOwnername() {
		return Ownername;
	}

	public void setOwnername(String ownername) {
		Ownername = ownername;
	}

	public String getFSSAI_NO() {
		return FSSAI_NO;
	}

	public void setFSSAI_NO(String fSSAI_NO) {
		FSSAI_NO = fSSAI_NO;
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

	public Boolean getIsOpen() {
		return isOpen;
	}

	public void setIsOpen(Boolean isOpen) {
		this.isOpen = isOpen;
	}

	public LocalTime getOpeningTime() {
		return openingTime;
	}

	public void setOpeningTime(LocalTime openingTime) {
		this.openingTime = openingTime;
	}

	public LocalTime getClosingTime() {
		return closingTime;
	}

	public void setClosingTime(LocalTime closingTime) {
		this.closingTime = closingTime;
	}

	public String getProfileImageUrl() {
		return profileImageUrl;
	}

	public void setProfileImageUrl(String profileImageUrl) {
		this.profileImageUrl = profileImageUrl;
	}

	public Double getAverageRating() {
		return averageRating;
	}

	public void setAverageRating(Double averageRating) {
		this.averageRating = averageRating;
	}

	public Integer getTotalReviews() {
		return totalReviews;
	}

	public void setTotalReviews(Integer totalReviews) {
		this.totalReviews = totalReviews;
	}

	public List<MenuItems> getMenuItems() {
		return menuItems;
	}

	public void setMenuItems(List<MenuItems> menuItems) {
		this.menuItems = menuItems;
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

	public Boolean getSetVerified() {
		return setVerified;
	}

	public void setSetVerified(Boolean setVerified) {
		this.setVerified = setVerified;
	}
	
}
