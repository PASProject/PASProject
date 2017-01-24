package com.app.pas.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminQnaController {

	
	@RequestMapping("/anaList")
	public String QnaList(HttpSession session, Model model){
		String url="";
		return url;
	}
	
	@RequestMapping("/qnaWrite")
	public String QnaWrite(HttpSession session, Model model){
		String url="";
		return url;
	}
	
	@RequestMapping("/qnaDelete")
	public String deleteQna(HttpSession session,Model model){
		String url="";
		return url;
	}
	
}
