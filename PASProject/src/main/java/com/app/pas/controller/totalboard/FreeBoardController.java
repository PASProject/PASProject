package com.app.pas.controller.totalboard;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.pas.dto.board.FreeBoardVo;
import com.app.pas.service.board.FreeBoardService;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardController {

	@Autowired
	FreeBoardService freeBoardService;
	
	@RequestMapping("/freeBoardList")
	public String CommunityList(Model model) {
		String url = "/communityList";
		List<FreeBoardVo> freeBoardList = freeBoardService.selectFreeBoardList();
		model.addAttribute("freeBoardList", freeBoardList);
		return url;

	}

	@RequestMapping("/freeBoardInsert")
	public String insertCommunity(HttpSession session, Model model) {
		String url = "";
		return url;

	}
	
	@RequestMapping("/freeBoardUpdate")
	public String updateCommunity(HttpSession session,Model model){
		String url="";
		return url;
				
	}
	
	@RequestMapping("/freeBoardWrite")
	public String writeCommunity(HttpSession session,Model model){
		String url="";
		return url;
				
	}
	
	@RequestMapping("/freeBoardDelete")
	public String deleteCommunity(HttpSession session,Model model){
		String url="";
		return url;
	}
}
