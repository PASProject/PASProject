package com.app.pas.controller.totalboard;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.app.pas.dto.MemberVo;
import com.app.pas.dto.board.FreeBoardLikeVo;
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
	public String CommunityList(Model model,@RequestParam(value="page",defaultValue="1")String page
			,HttpServletRequest request) throws SQLException {
		String url = "freeBoard/freeBoardList";
		String delete = request.getParameter("delete");
		
		
		int totalCount = 0 ;
		/*Page<FreeBoardVo> postPage =freeBoardService.*/
		List<FreeBoardVo> freeBoardList = new ArrayList<FreeBoardVo>();
		
			freeBoardList = freeBoardService.selectFreeLikeCountViewList();
			totalCount = freeBoardService.selectTotalCount();
		
		if(page.equals(null)||page ==""){
			page = ""+1;
		}
		
		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(page));
		paging.setPageSize(5);
		paging.setTotalCount(totalCount);
		model.addAttribute("paging",paging);
		model.addAttribute("delete", delete);
		model.addAttribute("freeBoardList", freeBoardList);
		return url;
	}

	@RequestMapping("/freeBoardDetail")
	public String detailFreeBoard(@RequestParam String frb_Article_Num,
			HttpServletRequest request, Model model) throws NumberFormatException, SQLException{
		String url="freeBoard/freeBoardDetail";
		FreeBoardVo freeBoardVo = null;
		String like = request.getParameter("like");
		String message = request.getParameter("message");
		String delete = request.getParameter("delete");
		String modify = request.getParameter("modify");
		freeBoardVo = freeBoardService.selectFreeBoardDetail(Integer.parseInt(frb_Article_Num));
		if(message == null){
			freeBoardService.updateFreeBoardCount(freeBoardVo);
			}
		model.addAttribute("delete", delete);
		model.addAttribute("like", like);
		model.addAttribute("freeBoardVo",freeBoardVo);
		model.addAttribute("modify", modify);
		return url;
	}
	
	@RequestMapping("/FreeBoardLike")
	public String detailskillSharingBoardLike(
			@RequestParam String frb_Article_Num, Model model,
			HttpSession session,HttpServletRequest request, HttpServletResponse response
			,FreeBoardVo freeBoardVo ) throws SQLException, IOException {
		
		FreeBoardLikeVo freeBoardLikeVo = new FreeBoardLikeVo();
		FreeBoardLikeVo LikeMember = new FreeBoardLikeVo();
		String url = "redirect:freeBoardDetail?frb_Article_Num="+frb_Article_Num;
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		freeBoardVo.setFrb_Article_Num(Integer.parseInt(frb_Article_Num));
		freeBoardLikeVo.setFrb_Article_Num(Integer.parseInt(frb_Article_Num));
		freeBoardLikeVo.setMem_Email(memberVo.getMem_Email());
		
		
		LikeMember = freeBoardService.selectFreeBoardLikeList(freeBoardLikeVo);
		
		if(LikeMember == null){
			freeBoardService.insertFreeboardLike(freeBoardLikeVo);
			url = "redirect:freeBoardDetail?frb_Article_Num="+ frb_Article_Num+"&like=yes&message=1";
		}else{
			url = "redirect:freeBoardDetail?frb_Article_Num="+ frb_Article_Num+"&like=no&message=1";
		}
		return url;
	}
	
	@RequestMapping(value ="/freeBoardInsert")
	public String insertFreeBoardForm(HttpSession session, Model model) {
		String url = "freeBoard/freeBoardWrite";
		return url;

	}
	
	@RequestMapping(value="/freeBoardInsert",method=RequestMethod.POST)
	public String insertFreeBoard(HttpSession session,FreeBoardVo freeBoardVo) throws SQLException{
		String url = "redirect:freeBoardList";
		
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		String mem_Email = memberVo.getMem_Email();
		String mem_Name = memberVo.getMem_Name();
				
		freeBoardVo.setMem_Email(mem_Email);
		freeBoardVo.setMem_Name(mem_Name);
		freeBoardVo.setFrb_Kind("1");
			
		freeBoardService.insertFreeBoard(freeBoardVo);
		
		return url;
	}
	
	@RequestMapping(value ="/freeBoardUpdate",method = RequestMethod.GET)
	public String updateFreeBoardForm(String frb_Article_Num, Model model,HttpSession session) throws NumberFormatException, SQLException{
		
		String url="freeBoard/freeBoardUpdate";
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		String loginEmail = memberVo.getMem_Email();
		FreeBoardVo freeboardVo = freeBoardService.selectFreeBoardDetail(Integer.parseInt(frb_Article_Num));
		String writeEmail = freeboardVo.getMem_Email();
		if(loginEmail.equals(writeEmail)){
				url = "freeBoard/freeBoardUpdate";
				model.addAttribute("freeBoardVo", freeboardVo);
		  }else{
			url = "redirect:freeBoardDetail?frb_Article_Num="+ frb_Article_Num+"&modify=no&message=1";
		  }
		 
		
		return url;
	}
	
	@RequestMapping(value="/freeBoardUpdate",method=RequestMethod.POST)
	public String updateFreeBoard(FreeBoardVo freeBoardVo) throws NumberFormatException, SQLException{
		
		String url = "redirect:freeBoardList";
		
		freeBoardVo.setFrb_Kind("1");
		  
		freeBoardService.updateFreeBoard(freeBoardVo);
		
		return url;
	}
	
	@RequestMapping(value ="/freeBoardWrite",method=RequestMethod.GET )
	public String writeFreeBoard(HttpSession session,Model model){
		String url = "freeBoard/freeBoardWrite";
		return url;
				
	}
	
	@RequestMapping(value="/freeBoardDelete",method = RequestMethod.POST)
	public String deleteFreeBoard(String frb_Article_Num,HttpSession session) throws NumberFormatException, SQLException{
		String url="redirect:freeBoardList";
		
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		String loginEmail = memberVo.getMem_Email();
		FreeBoardVo freeboardVo = freeBoardService.selectFreeBoardDetail(Integer.parseInt(frb_Article_Num));
		  String writeEmail = freeboardVo.getMem_Email();
		  
		  if(loginEmail.equals(writeEmail)){
			freeBoardService.deleteFreeBoard(Integer.parseInt(frb_Article_Num));
			url = "redirect:freeBoardList?delete=yes";
		  }else{
			url = "redirect:freeBoardDetail?frb_Article_Num="+ frb_Article_Num+"&delete=no&message=1";
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
		model.addAttribute("freeBoardReplyList",freeBoardReplyList);
		return freeBoardReplyList;
	}
	
	@RequestMapping(value="freeBoardReplyWrite", method=RequestMethod.POST)
	public  @ResponseBody List<FreeBoardReplyVo> writeFreeBoardReply(@RequestBody FreeBoardReplyVo freeBoardReplyVo, HttpSession session){
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		String mem_Email = memberVo.getMem_Email();
		freeBoardReplyVo.setFrb_Reply_Mem(mem_Email);
		freeBoardReplyVo.setFrb_Reply_Mem_Name(memberVo.getMem_Name());
		List<FreeBoardReplyVo> freeBoardReplyList = new ArrayList<FreeBoardReplyVo>();
		try {
			freeBoardReplyService.insertFreeBoardReply(freeBoardReplyVo);
			freeBoardReplyList = freeBoardReplyService.selectFreeBoardReply(freeBoardReplyVo.getFrb_Article_Num());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return freeBoardReplyList;
	}
}
