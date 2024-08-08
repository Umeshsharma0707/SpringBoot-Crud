package com.crud.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Service;

import com.crud.models.Address;
import com.crud.models.User;
import com.crud.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	UserRepository userRepository;
	
	public User saveUser(User user) {
		for(Address address : user.getAddresses()) {
			address.setUser(user);
		}
		return userRepository.save(user);
	}
	
	public List<User> getAllUsers(){
		return this.userRepository.findAll();
	}
	public User getUserById(int id) {
		User user = this.userRepository.getReferenceById(id);
		return user;
		
	}
	
	public void deleteUserById(User user) {
		this.userRepository.delete(user);
	}
	public User updateUser(User user) {
		 User save = this.userRepository.save(user);
		 return save;
	}
}
