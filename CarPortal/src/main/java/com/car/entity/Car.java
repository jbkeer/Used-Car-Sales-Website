package com.car.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;

import org.springframework.data.annotation.CreatedDate;

@Entity
public class Car {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = true, length = 64)
	private String photos;
	
	@Column(nullable = true, length = 64)
	private String imagePath;
	
	@OneToMany(mappedBy = "car")
	private Set<CarBidding> biddings = new HashSet<CarBidding>();
	
	private String name;
	private String make;
	private String model;
	private String registration;
	private String price;
	private Long sellerId;
	private String sellStatus;
	
	@CreatedDate
	private String postDate;
	
	@PrePersist
	private void onCreate() {
		DateFormat dateOnly = new SimpleDateFormat("EEEEE dd MMMMM yyyy");
		postDate = dateOnly.format(new Date());
	}
	
	public Car() {

	}

	public Car(Long id, String photos, String imagePath, String name, String make, String model, String registration,
			String price, Long sellerId) {
		super();
		this.id = id;
		this.photos = photos;
		this.imagePath = imagePath;
		this.name = name;
		this.make = make;
		this.model = model;
		this.registration = registration;
		this.price = price;
		this.sellerId = sellerId;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPhotos() {
		return photos;
	}

	public void setPhotos(String photos) {
		this.photos = photos;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public Set<CarBidding> getBiddings() {
		return biddings;
	}

	public void setBiddings(Set<CarBidding> biddings) {
		this.biddings = biddings;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getRegistration() {
		return registration;
	}

	public void setRegistration(String registration) {
		this.registration = registration;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Long getSellerId() {
		return sellerId;
	}

	public void setSellerId(Long sellerId) {
		this.sellerId = sellerId;
	}

	public String getSellStatus() {
		return sellStatus;
	}

	public void setSellStatus(String sellStatus) {
		this.sellStatus = sellStatus;
	}

	public String getPostDate() {
		return postDate;
	}

	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}

	@Override
	public String toString() {
		return "Car [id=" + id + ", photos=" + photos + ", photoImagePath=" + imagePath + ", name=" + name
				+ ", make=" + make + ", model=" + model + ", registration=" + registration + ", price=" + price
				+ ", sellerId=" + sellerId + ", postDate=" + postDate + "]";
	}
	
}
