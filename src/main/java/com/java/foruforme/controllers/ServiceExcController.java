package com.java.foruforme.controllers;



import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.foruforme.models.Rating;
import com.java.foruforme.models.ServiceExc;
import com.java.foruforme.models.User;
import com.java.foruforme.services.ServiceExcService;
import com.java.foruforme.services.UserService;
import com.java.foruforme.validator.UserValidator;

@Controller
public class ServiceExcController {
	private UserValidator userValidator;
	private final ServiceExcService serviceExcService;
	
	public ServiceExcController(UserValidator userValidator, ServiceExcService serviceExcService) {
		this.userValidator = userValidator;
		this.serviceExcService = serviceExcService;
	}


	@RequestMapping("/service/details/{id}")
	public String view(@PathVariable("id")Long id, Model model, @ModelAttribute("sendMessage") ServiceExc serviceExc, @ModelAttribute("addRating") Rating rating) {
		ServiceExc oneService = serviceExcService.findServiceExc(id);
		model.addAttribute("serviceExcService", oneService);
		return "serviceDetails.jsp";
	}
	
	
	@PostMapping("/service/details/{id}")
	public String addRating(@PathVariable("id")Long id, Model model, @ModelAttribute("addRating") Rating rating, BindingResult result, HttpSession session) {	
	 	if(result.hasErrors()) {

	 		return "redirect:/";
	 	} else {
		model.addAttribute("user", session.getAttribute("userId"));
		ServiceExc oneService = serviceExcService.findServiceExc(id);
		model.addAttribute("serviceExcService", oneService);
		serviceExcService.addRating(rating);
		return "serviceDetails.jsp";
	}
}
}


