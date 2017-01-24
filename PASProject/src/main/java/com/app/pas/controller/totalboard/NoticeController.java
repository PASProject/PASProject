package com.app.pas.controller.totalboard;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	
	@RequestMapping("/noticeList")
	public String NoticeList(HttpSession session, Model model) {
		String url = "";
		return url;

	}

	@RequestMapping("/noticeInsert")
	public String insertNotice(HttpSession session, Model model) {
		String url = "";
		return url;

	}
	
	@RequestMapping("/noticeWrite")
	public String writeNotice(HttpSession session,Model model){
		String url="";
		return url;
				
	}
	
	
	
	@RequestMapping("/noticeUpdate")
	public String updateNotice(HttpSession session,Model model){
		String url="";
		return url;
				
	}
	
	@RequestMapping("/noticeDelete")
	public String deleteNotice(HttpSession session,Model model){
		String url="";
		return url;
	}

}
