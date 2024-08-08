package com.crud.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.crud.models.Address;

public interface AddressRepository extends JpaRepository<Address, Integer>{

}
