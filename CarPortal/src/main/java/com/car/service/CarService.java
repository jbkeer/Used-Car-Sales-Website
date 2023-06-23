package com.car.service;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.car.entity.Car;
import com.car.entity.CarBidding;
import com.car.entity.User;
import com.car.repository.BidRepository;
import com.car.repository.CarRepository;

@Service
@Transactional
public class CarService {

	@Autowired
	private CarRepository carRepository;
	
	@Autowired
	private BidRepository bidRepository;
	
	public List<Car> getAllCars() {
		return carRepository.findAll();
	}
	
	public Car save(Car car) {
		return carRepository.save(car);
	}
	
	public Optional<Car> getCarInfo(long cid) {
		return carRepository.findById(cid);
	}
	
	public List<Car> findCarPosts(long uid) {
		return carRepository.findBySellerId(uid);
	}
	
	public void deleteCar(long cid) {
		carRepository.deleteById(cid);
	}
	
	public List<Car> search(String keyword) {
		return carRepository.search(keyword);
	}
	
	public CarBidding saveBid(CarBidding bid) {
		return bidRepository.save(bid);
	}
	
	public List<CarBidding> getAllBids() {
		List<CarBidding> allBid = bidRepository.findAll();
		List<CarBidding> sortedList = allBid.stream()
			.sorted(Comparator.comparingDouble(CarBidding::getBidderPrice).reversed())
			.collect(Collectors.toList());
		return sortedList;
	}
	
	public List<CarBidding> findUserBid(User user, Car car) {
		return bidRepository.findByUserAndCar(user, car);
	}
	
	public Optional<CarBidding> getBidInfo(long bid) {
		return bidRepository.findById(bid);
	}
	
	public List<CarBidding> getUserBids(User user) {
		return bidRepository.findByUser(user);
	}
	
	public void deleteBid(long bid) {
		bidRepository.deleteById(bid);
	}
}
