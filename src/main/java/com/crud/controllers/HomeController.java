package com.crud.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.crud.models.Address;
import com.crud.models.User;
import com.crud.services.UserService;


@Controller
public class HomeController {
	
	@Autowired
	UserService userService;

	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@PostMapping("/saveUser")
	public String saveUser(@ModelAttribute("user") User user, Model model) {
		
		try {
			this.userService.saveUser(user);
			model.addAttribute("successMsg", "new user registered successfully");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "index";
	}
	
	@GetMapping("/allusers")
	public String showAllUsers(Model model) {
		try {
			List<User> allUsers = this.userService.getAllUsers();
			model.addAttribute("allUsers", allUsers);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "all-users";
	}
	
	@GetMapping("/edit/{id}")
	public String getUserById(@PathVariable("id") int id, Model model) {
		try {
			User user = this.userService.getUserById(id);
			Address a1 = user.getAddresses().get(0);
			Address a2 = user.getAddresses().get(1);
			model.addAttribute("user", user);
			model.addAttribute("address1", a1);
			model.addAttribute("address2", a2);
			
		} catch (Exception e) {
			String msg = "user at id : " + id + " not found";
			model.addAttribute("idNotFound", msg);
			List<User> allUsers = this.userService.getAllUsers();
			model.addAttribute("allUsers", allUsers);
			return "all-users";
		}
		return "edit-user";
	}
	
	@GetMapping("/delete/{id}")
	public String deleteUser(@PathVariable("id") int id, Model model) {
		
		User user = this.userService.getUserById(id);
		this.userService.deleteUserById(user);
		String msg = "user at Id : " + user.getId() + " is deleted successfully";
		model.addAttribute("deleteMsg", msg);
		List<User> allUsers = this.userService.getAllUsers();
		model.addAttribute("allUsers", allUsers);
		return "all-users";
	}
	
	// update user
	@PostMapping("/edit/updateuser")
	public String updateUser(@ModelAttribute("user") User user, Model model) {
		
		User exitingUser = this.userService.getUserById(user.getId());
		
		exitingUser.setId(user.getId());
		exitingUser.setName(user.getName());
		exitingUser.setEmail(user.getEmail());
		exitingUser.setPhone(user.getPhone());
		exitingUser.setPassword(user.getPassword());
		
		Address add0 = user.getAddresses().get(0);
		add0.setUser(exitingUser);
		Address add1 = user.getAddresses().get(1);
		add1.setUser(exitingUser);
		
		List<Address> addresses = new ArrayList<Address>();
		addresses.add(add0);
		addresses.add(add1);
		
		exitingUser.setAddresses(addresses);
		
		User updatedUser = this.userService.updateUser(exitingUser);
		
		System.out.println("user updated");
		Address address1 = exitingUser.getAddresses().get(0);
		Address address2 = exitingUser.getAddresses().get(1);
		model.addAttribute("user", updatedUser);
		model.addAttribute("address1", address1);
		model.addAttribute("address2", address2);
		model.addAttribute("userUpdatedMsg", "user updated successfully");
		return "edit-user";
	}
	
}



