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
	public String searchLocation(@RequestParam("location") String location) {
		return "redirect:/searchDisplay"+location;
		//to add after "+location" after searchDisplay/
	}
	@PostMapping("/search2")
	public String searchService(@RequestParam("service") String service) {
		return "redirect:/searchDisplay"+ service;
		//to add after "+service" after searchDisplay/
	}
	
//	@RequestMapping("/search/{location}")
//	public String searchLocation(@PathVariable("location") String location, Model model) {
//		List<ServiceExc> locations = serviceExcService.getSearchLocations(location);
//		model.addAttribute("location", locations);
//		return "searchDisplay.jsp";
//	}
//	@RequestMapping("/search/{service}")
//	public String searchService(@PathVariable("service") String service, Model model) {
//		List<ServiceExc> services = serviceExcService.getSearchServices(service);
//		model.addAttribute("service", services);
//		return "searchDisplay.jsp";
//	}
	
	//Log and Reg view
//		@RequestMapping("/loginAndReg")
//	    public String logAndReg() {
//	    	return "logAndReg.jsp";
//	    }
	
	//registration 
    @RequestMapping(value="/registration", method=RequestMethod.POST)
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
        userValidator.validate(user, result);
        if(result.hasErrors()) {
            return "logAndReg.jsp";
        }
        User u = userService.registerUser(user);
        session.setAttribute("userId", u.getId());
        return "redirect:/service/details";
    }
    //login
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {

    	boolean isAuthenticated = userService.authenticateUser(email, password);
    	
    	if(isAuthenticated) {
    		User u = userService.findByEmail(email);
    		session.setAttribute("userId", u.getId());
    		return "redirect:/service/details";
    	}else {
    	model.addAttribute("error", "Invalid Credentials. Please try again.");
    	return "logAndReg.jsp";
    	}
    }

}
