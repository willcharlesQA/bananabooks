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
		Address findAddress = addressService.findAddress(loggedInCustomer.getCustomerId());

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
            address  = addressService.findAddress(loggedInCustomer.getCustomerId());
			modelAndView = new ModelAndView("address_book","address", address);
		    }
		}
        else{
            modelAndView = new ModelAndView("address_book","address",address);
        }
        return modelAndView;
	}
	
}
