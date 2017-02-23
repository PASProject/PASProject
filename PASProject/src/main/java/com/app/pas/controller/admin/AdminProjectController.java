package com.app.pas.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminProjectController {
	
	@RequestMapping("/projectList")
	public String ProjectList(HttpSession session,Model model){
		String url="";
		return url;
	}
	
	@RequestMapping("/projectDelete")
	public String deleteProejct(HttpSession session,Model model){
		String url="";
		return url;
	}
	
	

}
