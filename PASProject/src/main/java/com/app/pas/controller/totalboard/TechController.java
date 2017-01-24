package com.app.pas.controller.totalboard;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tech")
public class TechController {

	@RequestMapping("/techList")
	public String TechList(HttpSession session, Model model) {
		String url = "";
		return url;

	}

	@RequestMapping("/techInsert")
	public String insertTech(HttpSession session, Model model) {
		String url = "";
		return url;

	}

	@RequestMapping("/techUpdate")
	public String updateTech(HttpSession session, Model model) {
		String url = "";
		return url;

	}
	
	@RequestMapping("/techWrite")
	public String writeTech(HttpSession session,Model model){
		String url="";
		return url;
				
	}

	@RequestMapping("/techDelete")
	public String deleteTech(HttpSession session, Model model) {
		String url = "";
		return url;
	}

}
