package com.app.pas.controller.admin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.pas.dto.board.TotalNoticeVo;
import com.app.pas.service.board.TotalNoticeService;

@Controller
@RequestMapping("/admin")
public class AdminNoticeController {
	
	@Autowired
	TotalNoticeService totalNoticeService;
	
//전체공지사항 List 
	@RequestMapping("/totalNoticeList")
	public String selectTotalNoticeList(HttpSession session, Model model) throws SQLException {
		String url = "admin/adminNoticeList";
		List<TotalNoticeVo> noticeList = new ArrayList<TotalNoticeVo>();
		
		noticeList = totalNoticeService.selectTotalNoticeList();
		
		model.addAttribute("noticeList", noticeList);
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
