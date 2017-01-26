package com.app.pas.controller.totalboard;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.pas.commons.Paging;
import com.app.pas.dto.board.FreeBoardReplyVo;
import com.app.pas.dto.board.FreeBoardVo;
import com.app.pas.service.board.FreeBoardReplyService;
import com.app.pas.service.board.FreeBoardService;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardController {

	@Autowired
	FreeBoardService freeBoardService;
	@Autowired
	FreeBoardReplyService freeBoardReplyService;
	
	@RequestMapping("/freeBoardList")
	public String CommunityList(Model model,@RequestParam(value="page",defaultValue="1")String page) {
		String url = "freeBoard/freeBoardList";
		int totalCount = 0 ;
		/*Page<FreeBoardVo> postPage =freeBoardService.*/
		List<FreeBoardVo> freeBoardList = new ArrayList<FreeBoardVo>();
		try {
			freeBoardList = freeBoardService.selectFreeBoardList();
			totalCount = freeBoardService.selectTotalCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(page.equals(null)||page ==""){
			page = ""+1;
		}
		
		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(page));
		paging.setPageSize(5);
		paging.setTotalCount(totalCount);
		
		model.addAttribute("paging",paging);
		model.addAttribute("freeBoardList", freeBoardList);
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
	public String writeFreeBoard(HttpSession session,Model model){
		String url = "freeBoard/freeBoardWrite";
		return url;
				
	}
	
	@RequestMapping(value="/freeBoardDelete",method = RequestMethod.POST)
	public String deleteFreeBoard(String frb_Article_Num){
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
	
	
	@RequestMapping(value="/freeBoardReplyList")
	public @ResponseBody List<FreeBoardReplyVo> selectFreeBoardReplyList(@RequestBody Map<String,Object> jsonMap,Model model){
		
		List<FreeBoardReplyVo> freeBoardReplyList = new ArrayList<FreeBoardReplyVo>();
		String frb_Article_Num = (String) jsonMap.get("frb_Article_Num");
		System.out.println(frb_Article_Num);
		try {
			freeBoardReplyList = freeBoardReplyService.selectFreeBoardReply(Integer.parseInt(frb_Article_Num));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(freeBoardReplyList.toString());
		model.addAttribute("freeBoardReplyList",freeBoardReplyList);
		return freeBoardReplyList;
		
	}
	@RequestMapping(value="freeBoardReplyWrite", method=RequestMethod.POST)
	public  @ResponseBody List<FreeBoardReplyVo> writeFreeBoardReply(@RequestBody FreeBoardReplyVo freeBoardReplyVo, HttpSession session){
		/*MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		String mem_Email = memberVo.getMem_Email();
		freeBoardVo.setMem_Email(mem_Email);*/
		
		List<FreeBoardReplyVo> freeBoardReplyList = new ArrayList<FreeBoardReplyVo>();
		freeBoardReplyVo.setFrb_Reply_Mem("def@naver.com");
		try {
			freeBoardReplyService.insertFreeBoardReply(freeBoardReplyVo);
			freeBoardReplyList = freeBoardReplyService.selectFreeBoardReply(freeBoardReplyVo.getFrb_Article_Num());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return freeBoardReplyList;
	}
}
