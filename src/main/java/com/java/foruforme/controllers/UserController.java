package com.java.foruforme.controllers;


import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.foruforme.models.ServiceExc;
import com.java.foruforme.models.User;
import com.java.foruforme.services.ServiceExcService;
import com.java.foruforme.services.UserService;
import com.java.foruforme.validator.UserValidator;





import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@SuppressWarnings("unused")
@Controller
public class UserController {
	
	private UserValidator userValidator;
	private ServiceExcService serviceExcService;
	private UserService userService;
	
	public UserController (UserValidator userValidator, ServiceExcService serviceExcService, UserService userService) {
		this.userValidator = userValidator;
		this.serviceExcService = serviceExcService;
		this.userService = userService;
	}

	//index view
	@RequestMapping("/")
    public String home() {
    	return "index.jsp";
    }



	@PostMapping("/search")
	public String searchLocation(@RequestParam("location") String location, @RequestParam("service") String service, @RequestParam("formLocation") String formLocation) {
		if (formLocation.equals("location")) {
			return "redirect:/search/location/"+location;

		} else {
			return "redirect:/search/service/"+service;

		}
		
	}
//	@PostMapping("/search2")
//	public String searchService(@RequestParam("service") String service) {
//		return "redirect:/searchDisplay"+ service;
//	
//	}
	
	@RequestMapping("/search/location/{query}")
	public String searchLocation(@PathVariable("query") String query, Model model) {
		
		List<ServiceExc> locations = serviceExcService.getSearchLocations(query);
		model.addAttribute("location", locations);
		return "searchDisplayLocation.jsp";
	}
	@RequestMapping("/search/service/{query}")
	public String searchService(@PathVariable("query") String query, Model model) {
		List<ServiceExc> services = serviceExcService.getSearchServices(query);
		model.addAttribute("service", services);
		return "searchDisplayService.jsp";
	}
	
//	Login and Registration view
		@RequestMapping("/index")
	    public String logAndReg(@Valid @ModelAttribute("user") User user) {
	    	return "logAndReg.jsp";
	    }
	
	//registration 
    @RequestMapping(value="/registration", method=RequestMethod.POST)
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
        userValidator.validate(user, result);
        if(result.hasErrors()) {
            return "logAndReg.jsp";
        }
        User u = userService.registerUser(user);
        session.setAttribute("userId", u.getId());
        return "redirect:/service/details/"+u.getId();
    }
    //login
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {

    	boolean isAuthenticated = userService.authenticateUser(email, password);
    	
    	if(isAuthenticated) {
    		User u = userService.findByEmail(email);
    		session.setAttribute("userId", u.getId());
    		 return "redirect:/service/details/"+u.getId();
    	}else {
    	model.addAttribute("error", "Invalid Credentials. Please try again.");
    	return "logAndReg.jsp";
    	}
    }

}
