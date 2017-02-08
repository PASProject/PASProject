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
		
		noticeList = totalNoticeService.selectTotalNoticeList();
		
		model.addAttribute("noticeList", noticeList);
	
		String url = "notice/totalNoticeList";
		return url;
		
		/*int proj_Num = (Integer) session.getAttribute("joinProj");
		int totalCount = 0;
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");

		List<NoticeVo> list = null;
		MemPositionViewVo memPositionView = new MemPositionViewVo();
		HashMap map = new HashMap();
		map.put("proj_Num", proj_Num);
		map.put("mem_Email", memberVo.getMem_Email());

		try {
			list = noticeService.getNoticeList(proj_Num);
			model.addAttribute("NoticeList", list);
			memPositionView = noticeService.getNoticePosition(map);
			session.setAttribute("memPositionView", memPositionView);
			totalCount = noticeService.selectNoticeCount(proj_Num);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (page.equals(null) || page == "") {
			page = "" + 1;
		}

		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(page));
		paging.setPageSize(10);
		paging.setTotalCount(totalCount);

		model.addAttribute("paging", paging);*/

	}
	@RequestMapping("/totalNoticeDetail")
	public String detailTotalNotice(HttpSession session, Model model,String ttnotice_Num) throws NumberFormatException, SQLException {
		String url = "notice/totalNoticeDetail";
		
		TotalNoticeVo totalNoticeVo = totalNoticeService.selectTotalNoticeBoard(Integer.parseInt(ttnotice_Num));
		
		model.addAttribute("totalNoticeVo",totalNoticeVo);
		return url;
	}



}