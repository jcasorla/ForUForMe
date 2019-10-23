package com.java.foruforme.controllers;



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
	private UserService userService;
	
	public ServiceExcController(UserValidator userValidator, ServiceExcService serviceExcService, UserService userService) {
		this.userValidator = userValidator;
		this.serviceExcService = serviceExcService;
		this.userService=userService;
	}

	//view
	@RequestMapping("/service/details/{id}")
	public String view(@PathVariable("id")Long id, Model model, @ModelAttribute("sendMessage") ServiceExc serviceExc, @ModelAttribute("addRating") Rating rating) {
		ServiceExc oneService = serviceExcService.findServiceExc(id);
		model.addAttribute("serviceExcService", oneService);
		return "serviceDetails.jsp";
	}
	
	//new
    @RequestMapping("/services/new")
    public String newService(@ModelAttribute("serviceExc") ServiceExc serviceExc, Model model,HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
        User u = userService.findUserById(userId);
        model.addAttribute("user",u);  

        return "newservice.jsp";
    }
    
  //edit
    @RequestMapping("/services/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model, HttpSession session) {
    	ServiceExc oneService=serviceExcService.findServiceExc(id);
    	
    	User user = userService.findUserById((Long) session.getAttribute("userId"));
    	
    	
	      if(oneService.getUser().equals(user)){
	    	  model.addAttribute("oneservice", oneService);
	    	  model.addAttribute("user", user);
	    	  return "editservice.jsp";
	    	 
	      }
	      else {
	    	  return "redirect:/index";
	      }
        
        
    }
    
      
// //  CRUD
    
//	//view
//    @RequestMapping("/services/{id}")
//    public String view(@PathVariable("id") Long id, Model model, HttpSession session) {
//    	Service service=serviceService.findService(id);
//    	
//    	User user = userService.findUserById((Long) session.getAttribute("userId")); 
//    	model.addAttribute("service", service);
//    	model.addAttribute("user", user);
//        return "/views/viewService.jsp";
//    }
	
    
    //add service
	@PostMapping("/service")
	public String addService(@Valid @ModelAttribute("serviceExc") ServiceExc serviceExc, BindingResult result, HttpSession session, Model model) {
				
		if(result.hasErrors()) {
			System.out.println("has errors " +result.hasErrors());
			 Long userId = (Long) session.getAttribute("userId");
		        User u = userService.findUserById(userId);

		        
		        model.addAttribute("user",u);      

			return "newservice.jsp";
		}
		
		
		System.out.println("serviceExc"+ serviceExc);
		serviceExcService.addServiceExc(serviceExc);
		
		return "redirect:/index";
	}
    
	
	//update
    @RequestMapping(value="/services/{id}", method=RequestMethod.PUT) 
    public String update(@Valid @ModelAttribute("oneservice") ServiceExc serviceExc, BindingResult result) {
    		     
	     if (result.hasErrors()) {
             return "editService.jsp";
         } else {
         	
         	serviceExcService.submitEdit(serviceExc);
         	
             return "redirect:/index";
         }	 
    }
	
	//delete
	  @RequestMapping(value="/services/{id}/delete")
	  public String destroy(@PathVariable("id") Long id, HttpSession session) {
		  Long userId = (Long) session.getAttribute("userId");
	      User u = userService.findUserById(userId);
	      ServiceExc oneService = serviceExcService.findServiceExc(id);
	      
	      if(oneService.getUser().equals(u)){
	    	  serviceExcService.deleteServiceExc(id);
	    	  
		      return "redirect:/index";	    	  
	      }
	      else {
	    	  return "redirect:/index";
	      }
	      
	     
		 
	  }
}


