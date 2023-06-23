package com.car.security;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.crypto.password.PasswordEncoder;

import com.car.entity.Role;
import com.car.entity.User;
import com.car.repository.UserRepository;

@Transactional
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;
	
//	@Autowired
//	private PasswordEncoder passwordEncoder;

	public UserDetailsServiceImpl() {
		
	}
	
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		User user = userRepository.findByUserName(userName);
		if(user == null) {
			throw new UsernameNotFoundException("User "+ userName + "does not exist. Please re-enter.");
		}
		org.springframework.security.core.userdetails.User.UserBuilder userBuilder = org.springframework.security.core.userdetails.User.builder();
		String[] roleNames = user.getRoles().stream().map(Role::getName).toArray(String[]::new);
		System.out.println("Your role name is " + roleNames);
		
		return userBuilder.username(user.getUserName())
				.password(user.getPassword())
				.roles(roleNames)
				.build();
	}
	
}
