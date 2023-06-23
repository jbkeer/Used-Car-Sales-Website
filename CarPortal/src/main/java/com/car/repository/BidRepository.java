package com.car.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.car.entity.Car;
import com.car.entity.CarBidding;
import com.car.entity.User;

public interface BidRepository extends JpaRepository<CarBidding, Long> {

	List<CarBidding> findByUserAndCar(User user, Car car);
	List<CarBidding> findByUser(User user);
}
