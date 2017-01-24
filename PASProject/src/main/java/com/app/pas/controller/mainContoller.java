package com.app.pas.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/main")
public class mainContoller {
	
	@RequestMapping(value="/loginForm",method=RequestMethod.GET)
	public String loginForm(HttpSession session, Model model){
		String url="main/loginForm2";
		return url;
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String loginMember(HttpSession session, Model model){
		String url="";
		return url;
	}
	
	@RequestMapping(value="/joinForm",method=RequestMethod.GET)
	public String joinForm(HttpSession session, Model model){
		String url="";
		return url;
	}
	
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String joinMember(HttpSession session, Model model){
		String url="";
		return url;
	}
	
	
	@RequestMapping("/projectList")
	public String ProjectList(HttpSession session, Model model){
		String url="";
		return url;
	}
	
	@RequestMapping("/mypageList")
	public String Mypage(HttpSession session,Model model){
		String url="";
		return url;
	}
	
	
	
	

	
}
