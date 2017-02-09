package com.app.pas.controller.totalboard;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.pas.commons.Paging;
import com.app.pas.dto.MemPositionViewVo;
import com.app.pas.dto.MemberVo;
import com.app.pas.dto.board.NoticeVo;
import com.app.pas.dto.board.TotalNoticeVo;
import com.app.pas.service.board.NoticeService;
import com.app.pas.service.board.TotalNoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	TotalNoticeService totalNoticeService;

	@RequestMapping("/totalNoticeList")
	public String NoticeList(Model model, HttpSession session,
			@RequestParam(value = "page", defaultValue = "1") String page) throws SQLException {
	List<TotalNoticeVo> noticeList = new ArrayList<TotalNoticeVo>();
		int totalCount = 0;
		
		noticeList = totalNoticeService.selectTotalNoticeList();
		
		totalCount = totalNoticeService.toTalNoticeTotalCount();
		
		if (page.equals(null) || page == "") {
			page = "" + 1;
		}
		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(page));
		paging.setPageSize(5);
		paging.setTotalCount(totalCount);
		
		model.addAttribute("paging", paging);
		model.addAttribute("noticeList", noticeList);
		
		String url = "notice/totalNoticeList";
		return url;
		
		
//통합공지사항 디테일
	}
	@RequestMapping("/totalNoticeDetail")
	public String detailTotalNotice(HttpSession session, Model model,String ttnotice_Num) throws NumberFormatException, SQLException {
		String url = "notice/totalNoticeDetail";	
		TotalNoticeVo totalNoticeVo = totalNoticeService.selectTotalNoticeBoard(Integer.parseInt(ttnotice_Num));
		model.addAttribute("totalNoticeVo",totalNoticeVo);
		
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		String session_Email = memberVo.getMem_Email();
		totalNoticeService.totalNoticeCount(Integer.parseInt(ttnotice_Num));
		return url;
	}



}