package com.java.foruforme.repositories;

import org.springframework.data.repository.CrudRepository;

import com.java.foruforme.models.User;



public interface UserRepository extends CrudRepository  <User, Long>{
	 User findByEmail(String email);

}
