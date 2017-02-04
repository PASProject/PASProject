package com.app.pas.controller.totalboard;

import java.sql.SQLException;
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
import com.app.pas.service.board.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	NoticeService noticeService;

	@RequestMapping("/noticeList")
	public String NoticeList(Model model, HttpSession session,
			@RequestParam(value = "page", defaultValue = "1") String page) {
		int proj_Num = (Integer) session.getAttribute("joinProj");
		int totalCount = 0;
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");

		String url = "project/pmNoticeList";

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
			totalCount = noticeService.selectNoticeCount();

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

		model.addAttribute("paging", paging);

		return url;

	}

	@RequestMapping(value = "/noticeWrite", method = RequestMethod.POST)
	public String insertNotice(HttpSession session, NoticeVo noticeVo) {
		String url = "redirect:/notice/noticeList";
		int proj_Num = (Integer) session.getAttribute("joinProj");

		noticeVo.setProj_Num(proj_Num);

		try {
			noticeService.insertNotice(noticeVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return url;

	}

	@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
	public String NoticeDetailForm(HttpServletRequest request, String proj_Num,
			String notice_Num) {
		String url = "project/pmNoticeDetail";
		// int iproj_Num = Integer.parseInt(proj_Num);
		HashMap map = new HashMap();
		map.put("proj_Num", proj_Num);
		map.put("notice_Num", notice_Num);

		try {
			NoticeVo noticeVo = (NoticeVo) noticeService.getNoticeDetail(map);
			request.setAttribute("NoticeVo", noticeVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return url;
	}

	@RequestMapping(value = "/noticeWrite", method = RequestMethod.GET)
	public String writeNoticeForm(HttpServletRequest request, String proj_Num,
			String notice_Num) {
		String url = "project/pmNoticeWrite";

		return url;

	}

	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.GET)
	public String updateUpdateForm(HttpServletRequest request, String proj_Num,
			String notice_Num) {
		String url = "project/pmNoticeUpdate";
		HashMap map = new HashMap();
		map.put("proj_Num", proj_Num);
		map.put("notice_Num", notice_Num);

		try {
			NoticeVo noticeVo = (NoticeVo) noticeService.getNoticeDetail(map);
			request.setAttribute("NoticeVo", noticeVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return url;

	}

	@RequestMapping(value = "/noticeUpdate", method = RequestMethod.POST)
	public String updateUpdate(NoticeVo noticeVo) {
		String url = "redirect:/notice/noticeList";

		try {
			noticeService.updateNotice(noticeVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return url;
	}

	@RequestMapping("/noticeDelete")
	public String deleteNotice(HttpSession session, NoticeVo noticeVo) {
		String url = "redirect:/notice/noticeList";
		System.out.println(noticeVo.getProj_Num() + "이건프로젝트넘버@@@@");
		try {
			noticeService.deleteNotice(noticeVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return url;
	}

}