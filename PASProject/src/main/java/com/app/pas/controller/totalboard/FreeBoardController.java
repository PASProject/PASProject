package com.app.pas.controller.totalboard;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.pas.dto.board.FreeBoardVo;
import com.app.pas.service.MemberService;
import com.app.pas.service.board.FreeBoardService;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardController {

	@Autowired
	FreeBoardService freeBoardService;
	
	
	@RequestMapping("/freeBoardList")
	public String CommunityList(Model model) {
		String url = "freeBoard/freeBoardList";
		List<FreeBoardVo> freeBoardList = new ArrayList<FreeBoardVo>();
		try {
			freeBoardList = freeBoardService.selectFreeBoardList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("freeBoardList", freeBoardList);
		System.out.println(freeBoardList);
		return url;

	}

	@RequestMapping("/freeBoardDetail")
	public String detailFreeBoard(@RequestParam String frb_Article_Num,Model model){
		String url="freeBoard/freeBoardDetail";
		System.out.println(frb_Article_Num);
		FreeBoardVo freeBoardVo = null;
		try {
			freeBoardVo = freeBoardService.selectFreeBoardDetail(Integer.parseInt(frb_Article_Num));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("freeBoardVo",freeBoardVo);
		System.out.println("asdfsdf");
		return url;
	}
	@RequestMapping(value ="/freeBoardInsert")
	public String insertFreeBoardForm(HttpSession session, Model model) {
		String url = "freeBoard/freeBoardWrite";
		return url;

	}
	
	@RequestMapping(value="/freeBoardInsert",method=RequestMethod.POST)
	public String insertFreeBoard(HttpSession session,FreeBoardVo freeBoardVo){
		String url = "redirect:freeBoardList";
		
		/*MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		String mem_Email = memberVo.getMem_Email();
		freeBoardVo.setMem_Email(mem_Email);*/
		
		freeBoardVo.setMem_Email("abc@naver.com");
		freeBoardVo.setFrb_Kind("1");
			
		try {
			freeBoardService.insertFreeBoard(freeBoardVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return url;
	}
	
	@RequestMapping(value ="/freeBoardUpdate",method = RequestMethod.GET)
	public String updateFreeBoardForm(String frb_Article_Num, Model model){
		String url="freeBoard/freeBoardUpdate";
		FreeBoardVo freeBoardVo=null;
		try {
			freeBoardVo = freeBoardService.selectFreeBoardDetail(Integer.parseInt(frb_Article_Num));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("freeBoardVo", freeBoardVo);
		return url;
	}
	
	@RequestMapping(value="/freeBoardUpdate",method=RequestMethod.POST)
	public String updateFreeBoard(FreeBoardVo freeBoardVo){
		String url = "redirect:freeBoardList";
		freeBoardVo.setFrb_Kind("1");
		try {
			freeBoardService.updateFreeBoard(freeBoardVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url;
	}
	
	@RequestMapping(value ="/freeBoardWrite",method=RequestMethod.GET )
	public String writeCommunity(HttpSession session,Model model){
		String url = "freeBoard/freeBoardWrite";
		return url;
				
	}
	
	@RequestMapping(value="/freeBoardDelete",method = RequestMethod.POST)
	public String deleteCommunity(String frb_Article_Num){
		String url="redirect:freeBoardList";
		try {
			freeBoardService.deleteFreeBoard(Integer.parseInt(frb_Article_Num));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url;
	}
}
