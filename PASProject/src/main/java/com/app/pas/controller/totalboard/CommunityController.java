package com.app.pas.controller.totalboard;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/commnunity")
public class CommunityController {

	@RequestMapping("/communityList")
	public String CommunityList(HttpSession session, Model model) {
		String url = "";
		return url;

	}

	@RequestMapping("/communityInsert")
	public String insertCommunity(HttpSession session, Model model) {
		String url = "";
		return url;

	}
	
	@RequestMapping("/communityUpdate")
	public String updateCommunity(HttpSession session,Model model){
		String url="";
		return url;
				
	}
	
	@RequestMapping("/communityWrite")
	public String writeCommunity(HttpSession session,Model model){
		String url="";
		return url;
				
	}
	
	@RequestMapping("/communityDelete")
	public String deleteCommunity(HttpSession session,Model model){
		String url="";
		return url;
	}
}
