package com.car.service;

import java.util.HashSet;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.car.entity.User;
import com.car.repository.RoleRepository;
import com.car.repository.UserRepository;

@RunWith(MockitoJUnitRunner.class)
public class UserServiceTest {
	
	@InjectMocks
	UserService userService;
	
	@Mock
	RoleRepository roleRepository;
	
	@Mock
	PasswordEncoder passwordEncoder;
	
	@Mock
	UserRepository userRepository;
	
	@SuppressWarnings("deprecation")
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}
	
	@Test
	public void saveRegisterUserData() {
		User user = new User();
		user.setId((long) 6);
		user.setName("Owl Woo");
		user.setUserName("owl");
		user.setEmail("owl@gmail.com");
		String encodedPassword = passwordEncoder.encode("owl");
		user.setPassword(encodedPassword);
		user.setRoles(new HashSet<>(roleRepository.findBySpecificRoles("Users")));
		Mockito.when(userRepository.save(user)).thenReturn(user);
		String userResponse = userService.saveUser(user);
		Assert.assertEquals("User saved successfully", userResponse);
	}
	
	@Test public void proveUsername() { 
		User user = new User(); 
		String username = "owl"; 
		user.setUserName(username);
		Mockito.when(userRepository
				.findByUserName(username))
				.thenReturn(user); 
		User loginUser = userService.findLoginUser(username); 
		Assert.assertEquals(user, loginUser); 
	}
}
