package com.qa.controllers;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.qa.models.Person;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("person")
public class HomeController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ModelAndView handleForm(	
		@RequestParam(value="firstname") String firstname, 
			@RequestParam(value="lastname") String lastname, 
			@RequestParam(value="age") String age, 
			@RequestParam(value="email") String email) {
				Person p = new Person(firstname, lastname, Integer.valueOf(age), email);
		return new ModelAndView("afterForm", "person", p);
	}

	@RequestMapping(value = "/nextPage")
	public ModelAndView handleNextPage(@ModelAttribute("person") Person person) {
		System.out.println(person.getFirstName());
		person.setFirstName("Bob");
		return new ModelAndView("nextPage");
	}
	
}
