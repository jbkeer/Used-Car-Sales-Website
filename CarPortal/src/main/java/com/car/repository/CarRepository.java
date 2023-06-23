package com.car.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.car.entity.Car;

@Repository
public interface CarRepository extends JpaRepository<Car, Long> {

	List<Car> findBySellerId(Long uid);
	
	@Query(value = "SELeCT c FROM Car c WHERE c.make LIKE '%' || :keyword || '%'"
			+ " OR c.name LIKE '%' || :keyword || '%'"
			+ " OR c.model LIKE '%' || :keyword || '%'"
			+ " OR c.make LIKE '%' || :keyword || '%'"
			+ " OR c.price LIKE '%' || :keyword || '%'"
			+ " OR c.registration LIKE '%' || :keyword || '%'")
	public List<Car> search(@Param("keyword") String keyword);
}
