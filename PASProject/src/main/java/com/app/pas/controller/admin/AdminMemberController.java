package com.app.pas.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {
	
	

	@RequestMapping("/memberList")
	public String MemberList(HttpSession session, Model model)
			throws ServletException, IOException {

		String url = "admin/adminMemberList";
		return url;

	}

	@RequestMapping("/memberUpdate")
	public String updateMember(HttpSession session, Model model)
			throws ServletException, IOException {

		String url = "admin/adminMemberList";
		return url;

	}

	@RequestMapping("/memberDelete")
	public String deleteMember(HttpSession session, Model model)
			throws ServletException, IOException {
		String url = "admin/adminMemberList";
		return url;
	}

}
