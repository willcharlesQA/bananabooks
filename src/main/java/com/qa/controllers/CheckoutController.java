package com.qa.controllers;

import java.util.Map;

import com.qa.models.Address;
import com.qa.models.Customer;
import com.qa.services.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.qa.models.Shipping;

@SessionAttributes(names={"book_counts"})
@Controller
public class CheckoutController {

    /*
        need to ensure confirmation page gets shipping object

     */

    @Autowired
    AddressService addressService;

	@RequestMapping("/confirmation")
	public ModelAndView confirmation(@ModelAttribute("book_counts") Map<Integer,Integer> bookCounts,@RequestParam("order_total") double orderTotal,@ModelAttribute("logged_in_customer") Customer c, @RequestParam("addressLine1") String addressLine1, @RequestParam("addressLine2") String addressLine2, @RequestParam("city") String city, @RequestParam("postcode") String postcode, @RequestParam("country") String country )
	{
	    Address address = new Address();
	    address.setAddressLine1(addressLine1);
	    address.setAddressLine2(addressLine2);
	    address.setCity(city);
	    address.setCountry(country);
	    address.setPostcode(postcode);

		ModelAndView modelAndView = new ModelAndView("confirmation","order_total",orderTotal);
		modelAndView.addObject("logged_in_customer", c);
		modelAndView.addObject("order_total", orderTotal);
		modelAndView.addObject("book_counts", bookCounts);
        modelAndView.addObject("shipping", address);

        return modelAndView;
	}

	@RequestMapping("/checkoutProcess")
	public ModelAndView checkoutProcess(@ModelAttribute("Shipping") Shipping shipping,@ModelAttribute("book_counts") Map<Integer,Integer> bookCounts,@RequestParam("order_total") double orderTotal, @ModelAttribute("logged_in_customer") Customer c)
	{
		ModelAndView modelAndView = new ModelAndView("payment_form","order_total",orderTotal);
		modelAndView.addObject("shipping_address", shipping);
		modelAndView.addObject("order_total", orderTotal);
		modelAndView.addObject("book_counts", bookCounts);
        modelAndView.addObject("logged_in_customer", c);

		return modelAndView;
	}
	@RequestMapping("/loginThroughCheckout")
	public ModelAndView loginThroughCheckout(@ModelAttribute("book_counts") Map<Integer,Integer> bookCounts,@RequestParam("order_total") double orderTotal)
	{
		ModelAndView modelAndView = new ModelAndView("login_through_checkout","order_total",orderTotal);
		
		modelAndView.addObject("order_total", orderTotal);
		modelAndView.addObject("book_counts", bookCounts);
	    return modelAndView;
	}
	
	
	
	
	
}
