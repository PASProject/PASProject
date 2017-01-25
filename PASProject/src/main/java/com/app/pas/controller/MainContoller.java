package com.app.pas.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.pas.dto.MemberVo;
import com.app.pas.service.MemberService;

@Controller
@RequestMapping("/main")
public class MainContoller {

	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(HttpSession session, Model model) {
		String url = "main/loginForm";
		return url;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginMember(HttpSession session, Model model, String id,
			String pwd) {

		String url = "";

		MemberVo memberVo = memberService.getMember(id);
		int result = memberService.getPwd(id);
		if (memberVo.equals(null)) {

		} else {
			if (result == 1) {
				url = "/redirect:project/projectList";

			} else {

			}
		}

		return url;
	}

	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(HttpSession session, Model model) {
		String url = "main/joinForm";
		return url;
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinMember(HttpSession session, Model model) {
		String url = "";
		return url;
	}

	@RequestMapping("/projectList")
	public String ProjectList(HttpSession session, Model model) {
		String url = "";
		return url;
	}

	@RequestMapping("/mypageList")
	public String Mypage(HttpSession session, Model model) {
		String url = "";
		return url;
	}

}
