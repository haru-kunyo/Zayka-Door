package com.zayka.zaykaAtdoor.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.zayka.zaykaAtdoor.model.Resturant;

public interface ResturantRepository extends JpaRepository<Resturant, Integer>{
	Resturant findByPhoneNumber(String phoneNumber);
}
