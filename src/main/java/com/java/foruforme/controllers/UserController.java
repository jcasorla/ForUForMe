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
	@RequestMapping("/index")
    public String home(HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("userId");
        User u = userService.findUserById(userId); 
        List<ServiceExc> services = serviceExcService.allServiceExc();
		model.addAttribute("services", services);
        model.addAttribute("user",u);
		
    	return "index.jsp";
    }
	
//	@RequestMapping("/index")
//    public String home() {
//    	return "index.jsp";
//    }




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
		@RequestMapping("/")
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
        return "redirect:/index";
    }
    //login
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {

    	boolean isAuthenticated = userService.authenticateUser(email, password);
    	
    	if(isAuthenticated) {
    		User u = userService.findByEmail(email);
    		session.setAttribute("userId", u.getId());
    		 return "redirect:/index";
    	}else {
    	model.addAttribute("error", "Invalid Credentials. Please try again.");
    	return "logAndReg.jsp";
    	}
    }
    
//  //index view
//  	@RequestMapping("/index")
//      public String home(HttpSession session, Model model) {
//  		Long  userId = (Long) session.getAttribute("userId");
//  		System.out.println(userId);
//  		model.addAttribute("user", userId);
//      	return "index.jsp";
//      }
  	
    //render profile
    @RequestMapping("/about")
    public String profile(@Valid @ModelAttribute("user")User user) {
    	return "profile.jsp";
    }
    
    //shows user Id profile
    @RequestMapping("/about/{id}")
    public String profile(@Valid @PathVariable("id") Long id,@ModelAttribute("user")User user, Model model,HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		System.out.println("userId");
   		return "redirect:";

	   	}else {
	   		User user2 = userService.findUserById(id);
	   		model.addAttribute("user", user2);

	        List<ServiceExc> services = serviceExcService.allServiceExc();
			model.addAttribute("services", services);
	   		return "profile.jsp";
	   	}
    	
    

	//   	}else {
	//   		User user2 = userService.findUserById(id);
	//   		model.addAttribute("user", user2);
	//   		System.out.println("userId");
	//   		return "profile.jsp";
	//   	}	
    }

    
  //display of profile edit page
    @RequestMapping("/about/{id}/edit")
    public String editProfile(@Valid @PathVariable("id") Long id,@ModelAttribute("user")User user, Model model,HttpSession session) {

    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:";
    	}else {
    	User user2 = userService.findUserById(id);
    	model.addAttribute("user",user2);
    	return "editProfile.jsp";
    	}
    }
  
    

//    @RequestMapping("/about/{id}")
//    public String profile(@Valid @PathVariable("id") Long id,@ModelAttribute("user")User user, Model model,HttpSession session) {
//    	if(session.getAttribute("userId") == null) {
////    		System.out.println("userId");
//   		return "redirect:";
//	   	}else {
//	   		User user2 = userService.findUserById(id);
//	   		model.addAttribute("user", user2);
//	//   		System.out.println("userId");
//	   		return "profile.jsp";
//	   	}
//    	
//    
//    	
//    }
    

   // update/editing profile
  @RequestMapping(value="/about/{id}/edit", method=RequestMethod.PUT)
  public String update(@Valid @ModelAttribute("user")User user, BindingResult result,@PathVariable("id") Long id) {
      
  	if (result.hasErrors()) {
      	return "redirect:/about/"+id+"/edit";
      } else {
      	User user2 = userService.findUserById(id);
      	user2.setDescription(user.getDescription());
      	user2.setProfilePic(user.getProfilePic());
      	userService.updateProfile(user2);
      	return "redirect:/about/"+ id;
      }
  }

    

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        // invalidate session
        // redirect to login page
    	session.invalidate();
    	return "redirect:";
    }
    
    //idea to avoid hacking profile form URL to work on it later
//  @RequestMapping("/about/{id}")
// 	public String displayEditPage(Model model, @ModelAttribute("user") User myUser, @PathVariable("id") Long uId,
// 			HttpSession session) {
//
// 		// To avoid hacking via URL /profile/{id}
//
// 		Long userId = (Long) session.getAttribute("userId");
// 		User u = userService.findUserById(userId);
//
// 		User profileUser = userService.findUserById(userId);
//
// 		if (u.getId() ==  profileUser.getUserName().getId()) {
//
//
// 			return "profile.jsp";
// 		} else {
// 			return "redirect:/";
// 		}
// 	}

}
