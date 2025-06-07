package com.zayka.zaykaAtdoor.model;

import java.time.LocalTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Review {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private int rating;
	private String comment;
	private LocalTime timestamp;
	
	@ManyToOne
    @JoinColumn(name = "consumer_id")
    private Consumer consumer;
	
	@ManyToOne
    @JoinColumn(name = "resturant_id")
    private Resturant resturant;
	
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public LocalTime getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(LocalTime timestamp) {
		this.timestamp = timestamp;
	}
	public int getId() {
		return id;
	}
	public Consumer getConsumer() {
		return consumer;
	}
	public void setConsumer(Consumer consumer) {
		this.consumer = consumer;
	}
	public Resturant getResturant() {
		return resturant;
	}
	public void setResturant(Resturant resturant) {
		this.resturant = resturant;
	}
	
	
}
