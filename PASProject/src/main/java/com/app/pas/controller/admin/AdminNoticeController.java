package com.app.pas.controller.admin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	public String selectTotalNoticeList(HttpSession session, Model model,HttpServletRequest request) throws SQLException {
		String url = "admin/adminNoticeList";
		List<TotalNoticeVo> noticeList = new ArrayList<TotalNoticeVo>();
		
		noticeList = totalNoticeService.selectTotalNoticeList();
		
		model.addAttribute("noticeList", noticeList);
		return url;

	}
//전체 공지사항 Detail
	@RequestMapping("/adminNoticeDetail")
	public String detailTotalNotice(HttpSession session, Model model,String ttnotice_Num) throws NumberFormatException, SQLException {
		String url = "admin/adminNoticeDetail";
		
		TotalNoticeVo totalNoticeVo = totalNoticeService.selectTotalNoticeBoard(Integer.parseInt(ttnotice_Num));
		System.out.println("totalNoticeVo 디텔디텔: " + totalNoticeVo  );
		model.addAttribute("totalNoticeVo",totalNoticeVo);
		return url;
	}
	
//글쓰기 폼 
	@RequestMapping(value = "/adminNoticeForm" , method=RequestMethod.GET)
	public String insertNoticeForm(HttpSession session, Model model, TotalNoticeVo totalNoticeVo) throws SQLException {
		String url = "admin/adminNoticeWrite";
	
		return url;
	}
//글쓰기	
	@RequestMapping(value = "/adminNoticeInsert", method=RequestMethod.POST)
	public String insertTotalNotice(HttpSession session, Model model, TotalNoticeVo totalNoticeVo) throws SQLException {
		//String url = "redirect:adminNoticeList";
		String url = "redirect:totalNoticeList";
		totalNoticeVo.setAdmin_Email("admin");
		totalNoticeService.insertTotalNotice(totalNoticeVo);
	
		return url;
	}

//삭제 	
	@RequestMapping(value = "/adminNoticeDelete",method=RequestMethod.POST)
	public String deleteNotice(HttpSession session, Model model,String ttnotice_Num) throws NumberFormatException, SQLException{
		String url = "redirect:totalNoticeList";
		totalNoticeService.deleteTotalNotice(Integer.parseInt(ttnotice_Num));
		
		return url;
	}
//수정 폼	
	@RequestMapping("/adminNoticeUpdateForm")
	public String totalNoticeUpdateForm(HttpSession session, Model model,String ttnotice_Num) throws NumberFormatException, SQLException {
		String url = "admin/adminNoticeUpdateForm";
		TotalNoticeVo totalNoticeVo = null;
		
		totalNoticeVo = totalNoticeService.selectTotalNoticeBoard(Integer.parseInt(ttnotice_Num));
		model.addAttribute("totalNoticeVo", totalNoticeVo);
		return url;
	}
//진짜 수정	
	@RequestMapping(value = "/adminNoticeUpdate", method=RequestMethod.POST)
	public String updateTotalNotice(HttpSession session, Model model, TotalNoticeVo totalNoticeVo) throws SQLException {
		String url = "redirect:totalNoticeList";
		totalNoticeService.updateTotaTotalNotice(totalNoticeVo);
		
		return url;
	}


}
