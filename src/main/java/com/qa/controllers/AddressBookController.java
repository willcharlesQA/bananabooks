package com.qa.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.qa.models.Address;
import com.qa.models.Customer;
import com.qa.services.AddressService;

@SessionAttributes(names={"logged_in_customer"})
@Controller
public class AddressBookController {

	@Autowired
	private AddressService addressService;

	@RequestMapping("/updateAddress")
	public ModelAndView updateAddress(@ModelAttribute("logged_in_customer") Customer loggedInCustomer, @ModelAttribute("Address") Address address)
	{
		
		ModelAndView modelAndView  = null;

		System.out.println("Before update ");
		System.out.println("ID "+loggedInCustomer.getCustomerId());
		System.out.println("Name "+loggedInCustomer.getFirstName());
		System.out.println("Email "+loggedInCustomer.getEmail());
		
		Address findAddress = addressService.findAddress(loggedInCustomer.getCustomerId());
        System.out.println("AAA");

        if (findAddress != null){
            int recordsUpdated = addressService.updateAddress(address.getAddressLine1(),
                    address.getAddressLine2(),
                    address.getCity(),
                    address.getPostcode(),
                    address.getState(),
                    address.getCountry(),
                    address.getPhoneNumber(),
                    loggedInCustomer.getCustomerId());

		    if(recordsUpdated>0){
            System.out.println("BBB");
            address  = addressService.findAddress(loggedInCustomer.getCustomerId());
			System.out.println("After update ");
			modelAndView = new ModelAndView("address_book","address", address);
		    }
		    else{
            System.out.println("CCC");
            modelAndView = new ModelAndView("address_book","address",address);
		    }
		}
        return modelAndView;
	}
	
}
