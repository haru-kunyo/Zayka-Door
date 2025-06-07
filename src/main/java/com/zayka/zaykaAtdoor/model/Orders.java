package com.zayka.zaykaAtdoor.model;

import java.time.LocalTime;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;

@Entity
public class Orders {
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private int id;
	 
	 private LocalTime ordertime;
	 private String Status;
	 private Double TotalAmount;
	 
	 @ManyToOne
	 @JoinColumn(name = "resturant_id")
	 private Resturant resturant;
	 
	 @ManyToOne
	 @JoinColumn(name = "consumer_id")
	 private Consumer consumer;
	 
	 @OneToMany(mappedBy = "orders", cascade = CascadeType.ALL)
	 private List<OrderItem> items;
	 
	 @OneToOne(mappedBy = "orders", cascade = CascadeType.ALL)
	 private Payment payment;

	public LocalTime getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(LocalTime ordertime) {
		this.ordertime = ordertime;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public Double getTotalAmount() {
		return TotalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		TotalAmount = totalAmount;
	}

	public Resturant getResturant() {
		return resturant;
	}

	public void setResturant(Resturant resturant) {
		this.resturant = resturant;
	}

	public Consumer getConsumer() {
		return consumer;
	}

	public void setConsumer(Consumer consumer) {
		this.consumer = consumer;
	}

	public List<OrderItem> getItems() {
		return items;
	}

	public void setItems(List<OrderItem> items) {
		this.items = items;
	}

	public int getId() {
		return id;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}
	 
	 
}
