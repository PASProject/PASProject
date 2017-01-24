package com.app.pas.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminNoticeController {

	@RequestMapping("/noticeList")
	public String NoticeList(HttpSession session, Model model) {
		String url = "";
		return url;

	}

	@RequestMapping(value = "/noticeInsertForm", method = RequestMethod.GET)
	public String insertNoticeForm(HttpSession session, Model model) {
		String url = "";
		return url;
	}

	@RequestMapping(value = "/noticeInsert", method = RequestMethod.POST)
	public String insertNotice(HttpSession session, Model model) {
		String url = "";
		return url;
	}

	@RequestMapping("/noticeUpdate")
	public String updateNotice(HttpSession session, Model model) {
		String url = "";
		return url;
	}
	
	@RequestMapping("/noticeDelete")
	public String deleteNotice(HttpSession session, Model model){
		String url="";
		return url;
	}

}
