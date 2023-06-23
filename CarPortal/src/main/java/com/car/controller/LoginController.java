package com.car.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.car.entity.Car;
import com.car.entity.CarBidding;
import com.car.entity.User;
import com.car.service.CarService;
import com.car.service.UserService;

@Controller
public class LoginController {

	@Autowired
	UserService userService;
	
	@Autowired 
	CarService carService;
	
	@GetMapping("login")
	public String onLogin() {
		return "login";
	}
	
	@GetMapping("login_error")
	public String onLoginError(Model model) {
		String error_msg = "Incorrect username or password. Please try again.";
		model.addAttribute("error_string", error_msg);
		return "login";
	}
	 
	@GetMapping("login_success")
	public String onLoginSuccess(Model model) {
		String success_login = "You have successfully logged in.";
		model.addAttribute("success_login", success_login);
		return "cars";
	}
	
	@GetMapping("logout")
	public String onLogoutSuccess(Model model) {
		String success_logout = "You have successfully logged out.";
		model.addAttribute("success_logout", success_logout);
		return "login";
	}
	
	@GetMapping("register_user")
	public String showRegistrationForm(@ModelAttribute("user") User user) {
		return "register-form";
	}
	
	@PostMapping("register")
	public String registerNewUser(@ModelAttribute("user") User user, Model model) {
		String response = userService.saveUser(user);
		System.out.println(response);
		String success_register = "You have successfully created your account.";
		model.addAttribute("success_register", success_register);
		return "register-form";		
	}
	
	@GetMapping("profile")
	public String showProfile(Model model, Principal principal) {
		// Get User name
		String username = principal.getName();
		System.out.println("Current profile is " + username);
		User userdata = userService.findLoginUser(username);
		long uid = userdata.getId();
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		model.addAttribute("user", user);
		System.out.println(user);
		
		// Get car posts of user
		List<Car> cars = carService.findCarPosts(uid);
		System.out.println(cars);
		model.addAttribute("cars" , cars);
		
		// Get bidding/booking
		List<CarBidding> bids = carService.getUserBids(userdata);
		System.out.println(bids);
		model.addAttribute("bids", bids);
		
		return "profile";
	}
	
	@PostMapping("update")
	public String updateUser(Principal principal, @ModelAttribute("user") User u) {
		// Get User Name
		String username = principal.getName();
		User user = userService.findLoginUser(username);
    	user.setName(u.getName());
    	user.setUserName(u.getUserName());
    	user.setEmail(u.getEmail());
    	user.setMobile(u.getMobile());
    	user.setAddress(u.getAddress());
		
		userService.update(user);
		System.out.println("Update User Successful");
		System.out.println(user);
		
		return "redirect:profile";
	}
	
	@GetMapping("users")
	public ModelAndView showAllUser() {
		List<User> user = userService.showAllUser();
		
		return new ModelAndView ("all-user", "user", user);
	}
	
	@GetMapping("view")
	public String userProfile(@RequestParam long uid, Model model) {
		Optional<User> user_info = userService.getUserInfo(uid);
		System.out.println(user_info);
		
		User userdata = user_info.get();
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		model.addAttribute("user", user);
		System.out.println(user);
		
		// Get User Car Posts
		List<Car> cars = carService.findCarPosts(uid);
		System.out.println(cars);
		model.addAttribute("cars", cars);
		
		return "profile";
	}
	
	@GetMapping("delete")
	public String deleteUser(@RequestParam long uid) {
		userService.deleteUser(uid);
		
		return "redirect:users";
	}
	
	@PostMapping("edit")
	public String editUser(@RequestParam long uid, @ModelAttribute("user") User u) {
		Optional<User> user_info = userService.getUserInfo(uid);
		System.out.println(user_info);
		
		User user = user_info.get();
    	user.setName(u.getName());
    	user.setUserName(u.getUserName());
    	user.setEmail(u.getEmail());
    	user.setMobile(u.getMobile());
    	user.setAddress(u.getAddress());
    	
    	userService.update(user);
    	System.out.println("Changes on User Saved Successfully");
    	System.out.println(user);
    	
    	return "redirect:users";
	}
	
    @PostMapping("assign_role")
    public String assignRole(@RequestParam long uid, @RequestParam("name") String role,
    		@ModelAttribute("user") User u) {
    	Optional<User> user_info = userService.getUserInfo(uid);
    	System.out.println(user_info);
    	
    	User user = user_info.get();
    	userService.assignNewRole(user, role);
    	System.out.println(user);
    	
    	return "redirect:users";
    }
    
    @GetMapping("about_us")
    public String showAboutUs() {
    	return "about-us";
    }
    
    @GetMapping("contact_us")
    public String showContactUs() {
    	return "contact-us";
    }
}
