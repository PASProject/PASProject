package com.app.pas.controller.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.pas.commons.Paging;
import com.app.pas.dto.MemberVo;
import com.app.pas.dto.board.SkillSharingBoardVo;
import com.app.pas.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminMemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/memberList")
	public String MemberList(Model model,
			@RequestParam(value = "page", defaultValue = "1") String page) throws SQLException {
		String url = "admin/adminMemberList";
		int totalCount = 0;
		List<MemberVo> memberList = new ArrayList<MemberVo>();
		
		memberList = memberService.selectMemberList();
		totalCount = memberService.selectMemberTotalCount();

		if (page.equals(null) || page == "") {
			page = "" + 1;
		}

		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(page));
		paging.setPageSize(10);
		paging.setTotalCount(totalCount);

		model.addAttribute("paging", paging);
		model.addAttribute("memberList", memberList);
		return url;

	}
	
	@RequestMapping("/memberDetail")
	public String MemberDetail(HttpSession session, Model model)
			throws ServletException, IOException {

		String url = "admin/adminMemberDetail";
		return url;

	}
	

	@RequestMapping("/memberUpdate")
	public String updateMember(HttpSession session, Model model)
			throws ServletException, IOException {

		String url = "admin/adminMemberList";
		return url;

	}

	@RequestMapping("/memberDelete")
	public String deleteMember(@RequestParam(value="mem_Email")String mem_Email,HttpSession session) 
			throws NumberFormatException, SQLException  {
		String url = "redirect:memberList";
		
		memberService.deleteMember(mem_Email);
		
		return url;
	}
	
}
