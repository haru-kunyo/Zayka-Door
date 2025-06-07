package com.zayka.zaykaAtdoor.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class MenuItems {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	private Boolean Catergory;
	private String description;
	private int price;
	private String imgURL;
	
	@ManyToOne
    @JoinColumn(name = "resturant_id")
    private Resturant resturant;

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc() {
		return description;
	}

	public void setDesc(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImgURL() {
		return imgURL;
	}

	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}

	public Resturant getResturant() {
		return resturant;
	}

	public void setResturant(Resturant resturant) {
		this.resturant = resturant;
	}

	public Boolean getCatergory() {
		return Catergory;
	}

	public void setCatergory(Boolean catergory) {
		Catergory = catergory;
	}
	
	
	
}
