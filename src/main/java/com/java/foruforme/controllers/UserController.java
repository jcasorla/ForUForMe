package com.java.foruforme.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	//index view
	@RequestMapping("/")
    public String home() {
    	return "index.jsp";
    }

}
