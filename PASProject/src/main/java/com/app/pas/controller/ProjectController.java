package com.app.pas.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@RequestMapping("/pmBoard")
	public String PmBoard(HttpSession session, Model model) {
		String url = "";
		return url;
	}

	@RequestMapping("/pmChat")
	public String PmChat(HttpSession session, Model model) {
		String url = "";
		return url;
	}

	@RequestMapping("/pmNoticeList")
	public String PmNoticeList(HttpSession session, Model model) {
		String url = "";
		return url;
	}

	@RequestMapping("/pmNoticeWrite")
	public String WritePmNotice(HttpSession session, Model model) {
		String url = "";
		return url;

	}

	@RequestMapping("/pmNoticeUpdate")
	public String UpdatePmNotice(HttpSession session, Model model) {
		String url = "";
		return url;
	}

	@RequestMapping("/pmNoticeDelete")
	public String DeletePmNotice(HttpSession session, Model model) {
		String url = "";
		return url;
	}

	@RequestMapping("/pmOverView")
	public String PmOverView(HttpSession session, Model model) {
		String url = "";
		return url;
	}

	@RequestMapping("/teamMemberList")
	public String TeamMemberList(HttpSession session, Model model) {
		String url = "";
		return url;
	}

}
