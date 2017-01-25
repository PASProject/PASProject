package com.app.pas.controller.totalboard;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.app.pas.dto.MemberVo;
import com.app.pas.dto.board.NoticeVo;
import com.app.pas.service.board.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	
	@Autowired
	NoticeService noticeService;
	
	
	@RequestMapping("/noticeList")
	public String NoticeList(HttpServletRequest request,HttpSession session){
		int proj_Num=1;
		MemberVo memberVo= (MemberVo)session.getAttribute("loginUser");
		
		String url = "project/pmNoticeList";
		
		List<NoticeVo> list=null;
		
		
		try {
			list=noticeService.getNoticeList(proj_Num);
			request.setAttribute("NoticeList", list);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		
		
		
		
		
		return url;

	}

	@RequestMapping("/noticeInsert")
	public String insertNotice(HttpSession session, Model model) {
		String url = "";
		return url;

	}
	
	@RequestMapping(value="/noticeWriteForm",method=RequestMethod.GET)
	public String writeNoticeForm(HttpSession session,Model model){
		String url="project/pmNoticeList";
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
