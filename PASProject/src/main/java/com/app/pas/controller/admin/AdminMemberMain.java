package com.app.pas.controller.admin;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.pas.service.AdminService;
import com.app.pas.service.MemberService;
import com.app.pas.service.ProjectService;

@Controller
@RequestMapping("/admin")
public class AdminMemberMain {

	@Autowired
	MemberService memberService;
	@Autowired
	AdminService adminService;
	@Autowired
	ProjectService projectService;

	@RequestMapping("/adminMain")
	public String MemberList(Model model,
			@RequestParam(value = "page", defaultValue = "1") String page,
			@RequestParam(defaultValue = "") String mem_Email)
			throws SQLException {
		
		int total_Mem = memberService.selectMemberTotalCount();
		int total_proj = projectService.selectProjectTotalCount();
		model.addAttribute("total_Mem",total_Mem);
		model.addAttribute("total_proj",total_proj);
		String url = "admin/adminMain";
		
		return url;

	}
}
