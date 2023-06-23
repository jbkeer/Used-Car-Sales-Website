package com.car.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;

import com.car.entity.Car;
import com.car.entity.CarBidding;
import com.car.entity.User;
import com.car.repository.BidRepository;
import com.car.repository.CarRepository;

@RunWith(MockitoJUnitRunner.class)
public class CarServiceTest {
	
	@InjectMocks
	CarService carService;
	
	@Mock
	CarRepository carRepository;
	
	@Mock
	BidRepository bidRepository;
	
	@SuppressWarnings("deprecation")
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}
	
	@Test
	public void testSaveCar() {
		Car car = new Car();
		car.setId((long) 5);
		car.setName("Toyota FJ Cruiser 4x4 AT");
		car.setModel("4x4");
		car.setPrice("1858000");
		car.setMake("2018");
		car.setRegistration("2020");
		Mockito.when(carRepository.save(car)).thenReturn(car);
		Car savedCar = carService.save(car);
		Assert.assertEquals(car, savedCar);
	}
	
	@Test
	public void testSearchCar() {
		Car car = new Car();
		car.setName("Toyota FJ Cruiser 4x4 AT");
		String searchInput = "4x4";
		car.setModel(searchInput);
		
		List<Car> searchCar = new ArrayList<Car>();
		searchCar.add(car);
		
		Mockito.when(carRepository.search(searchInput)).thenReturn(searchCar);
		List<Car> search = carService.search(searchInput);
		Assert.assertEquals(searchCar, search);
	}
	
	@Test
	public void testSaveCarBidding() {
		Car car = new Car();
		car.setName("Toyota FJ Cruiser 4x4 AT");
		User user = new User();
		user.setName("Owl Woo");
		CarBidding bid = new CarBidding();
		bid.setCar(car);
		bid.setUser(user);
		bid.setBidderPrice(1900000);
		Mockito.when(bidRepository.save(bid)).thenReturn(bid);
		CarBidding saveBid = carService.saveBid(bid);
		Assert.assertEquals(bid, saveBid);
	}
}
