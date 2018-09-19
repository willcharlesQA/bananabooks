package com.qa.services;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.qa.models.Address;
import com.qa.repositories.AddressRepository;

@Service
public class AddressService {

	@Autowired
	private AddressRepository addressRespository;
	
	public int updateAddress(String addressLine1,
			String addressLine2,
			String city,
			String postcode,
			String state,
			String country,
			String phoneNumber,
			int customerId
			){
		return addressRespository.updateAddress(addressLine1, addressLine2, city, postcode, state, country, phoneNumber, customerId);
	}
	
	public Address findAddress(int customerId){
		return addressRespository.findAddress(customerId);
	}
	
	public Address saveAddress(Address address)
	{
		return addressRespository.save(address);
	}

	
	
	
	
	
	
	
}
