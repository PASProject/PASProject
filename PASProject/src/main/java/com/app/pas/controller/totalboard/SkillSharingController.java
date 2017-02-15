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
import com.app.pas.dto.board.FreeBoardReplyVo;
import com.app.pas.dto.board.ProjectBoardVo;
import com.app.pas.dto.board.SkillSharingBoardLikeVo;
import com.app.pas.dto.board.SkillSharingBoardReplyVo;
import com.app.pas.dto.board.SkillSharingBoardVo;
import com.app.pas.service.board.SkillSharingBoardReplyService;
import com.app.pas.service.board.SkillSharingBoardService;

@Controller
@RequestMapping("/SkillSharing")
public class SkillSharingController {

	@Autowired
	SkillSharingBoardService skillSharingBoardService;
	@Autowired
	SkillSharingBoardReplyService skillSharingBoardReplyService;

	@RequestMapping("/SkillSharingBoardList")
	public String skillSharingBoardList(Model model,
			@RequestParam(value = "page", defaultValue = "1") String page,
			@RequestParam(defaultValue="") String ssb_Title,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String keyField,
			@RequestParam(defaultValue = "") String name,
			@RequestParam(defaultValue = "") String title,
			@RequestParam(defaultValue = "") String number,
			SkillSharingBoardVo skillSharingBoardVo
			) throws SQLException {
		String url = "SkillSharing/SkillSharingBoardList";
		int totalCount = 0;
		List<SkillSharingBoardVo> skillSharingBoardList = new ArrayList<SkillSharingBoardVo>();
		
//			skillSharingBoardList = skillSharingBoardService
//					.selectSkillLikeCountViewList(ssb_Title);
//			totalCount = skillSharingBoardService.selectTotalCount();
	
		if (keyField == "" || keyField.equals(null)) {
			totalCount = skillSharingBoardService.selectTotalCount();
			if (page.equals(null) || page == "") {
				page = "" + 1;
			}

		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(page));
		paging.setPageSize(10);
		paging.setTotalCount(totalCount);

		model.addAttribute("paging", paging);
		}else{
			
			 if (keyField == ("name") || keyField.equals("name")) {

				 skillSharingBoardVo.setMem_Name(keyword);
					System.out.println("--------------name 키워드 : " + keyword);

				} else if (keyField == ("title") || keyField.equals("title")) {
					skillSharingBoardVo.setSsb_Title(keyword);
					System.out.println("-----------------title 키워드 : " + keyword);

				} else if (keyField == ("number") || keyField.equals("number")) {
					if (!(keyword.isEmpty() || keyword == null))
						skillSharingBoardVo.setSsb_Article_Num(Integer.parseInt(keyword));

					System.out.println("-----------------number 키워드 : " + keyword);
				}
			 skillSharingBoardList = skillSharingBoardService.selectSkillSharingBoardList(skillSharingBoardVo);
				model.addAttribute("skillSharingBoardList", skillSharingBoardList);
				
				totalCount =(Integer)skillSharingBoardService.skillSharingSearchCount(skillSharingBoardVo);
				if (page.equals(null) || page == "") {
					page = "" + 1;
				}
				Paging paging = new Paging();
				paging.setPageNo(Integer.parseInt(page));
				paging.setPageSize(5);
				paging.setTotalCount(totalCount);

				model.addAttribute("paging", paging);

			}
			
			
		return url;
			
			
		}
		//model.addAttribute("skillSharingBoardList", skillSharingBoardList);
		


	@RequestMapping("/SkillSharingDetail")
	public String detailskillSharingBoard(@RequestParam String ssb_Article_Num,
			Model model,HttpServletRequest request,HttpSession session
			,SkillSharingBoardReplyVo skillSharingBoardReplyVo) throws NumberFormatException, SQLException {
		
		 
		  /*MemberVo memberVo = (MemberVo) session.getAttribute("loginUser"); 
		  String mem_Email = memberVo.getMem_Email();*/
		
		String url = "SkillSharing/SkillSharingDetail";
		
		String like = "";
		String modi = null;
		String message = null;
		String delete = null;
		String likee = null;
		message = request.getParameter("message");
		like = request.getParameter("like");
		modi = request.getParameter("modi");
		delete = request.getParameter("delete");
		likee = request.getParameter("likee");
		if(like != null) {
			model.addAttribute("like", like);
		}
		if(modi != null){
			model.addAttribute("modi", modi);
		}
		if(delete !=null){
			model.addAttribute("delete",delete);
		}
		if(likee != null) {
			model.addAttribute("likee", likee);
		}
	
		SkillSharingBoardVo skillSharingBoardVo = null;
		skillSharingBoardVo = skillSharingBoardService.selectSkillSharingBoardDetail(Integer.parseInt(ssb_Article_Num));
			if(message== null){
				System.out.println("detail message가 null일때 들어옴");
			skillSharingBoardService.updateSkillSharingBoardCount(skillSharingBoardVo);
			}
		model.addAttribute("skillSharingBoardVo", skillSharingBoardVo);
			
		return url;
	}
	
	
	@RequestMapping("/SkillSharingLike")
	public String detailskillSharingBoardLike(
			@RequestParam String ssb_Article_Num, Model model,
			HttpSession session,HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		
		  System.out.println("SkillSharingLike 로 들어왔당!"); 
		
		String url = "redirect:SkillSharingDetail?ssb_Article_Num="+ ssb_Article_Num+"& message=1";
		SkillSharingBoardVo skillSharingBoardVo = new SkillSharingBoardVo();
		SkillSharingBoardLikeVo skillSharingBoardLikeVo = new SkillSharingBoardLikeVo();
		SkillSharingBoardLikeVo LikeMember = new SkillSharingBoardLikeVo();
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		
		skillSharingBoardLikeVo.setSsb_Article_Num(Integer
				.parseInt(ssb_Article_Num));
		skillSharingBoardVo.setSsb_Article_Num(Integer
				.parseInt(ssb_Article_Num));
		skillSharingBoardLikeVo.setMem_Email(memberVo.getMem_Email());
		System.out.println(skillSharingBoardLikeVo.getMem_Email());
		LikeMember = skillSharingBoardService.selectSkillSharingBoardLikeList(skillSharingBoardLikeVo);
		
		if(LikeMember==null){
			
		int likeCount = skillSharingBoardService
				.insertSkillSharingBoardLike(skillSharingBoardVo,
						skillSharingBoardLikeVo, Integer.parseInt(ssb_Article_Num));
		return "redirect:SkillSharingDetail?ssb_Article_Num="+ ssb_Article_Num+"&likee=yes";
		}else{
			
			skillSharingBoardService.updateSkillSharingBoardCountM(skillSharingBoardVo);
			System.out.println("else 값 들어옴");
			return "redirect:SkillSharingDetail?ssb_Article_Num="+ ssb_Article_Num+"& message=2&like=ok";
		}
		/*return url;*/
		
	}

	@RequestMapping("/SkillSharingInsert")
	public String insertskillSharingBoardForm(HttpSession session, Model model) {
		String url = "skillSharing/SkillSharingWrite";
		return url;

	}

	@RequestMapping(value = "/SkillSharingInsert", method = RequestMethod.POST)
	public String insertskillSharingBoard(HttpSession session,
			SkillSharingBoardVo skillSharingBoardVo) {
		String url = "redirect:SkillSharingBoardList";

		
		  MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		  String mem_Email = memberVo.getMem_Email();
		  skillSharingBoardVo.setMem_Email(mem_Email);
		  skillSharingBoardVo.setMem_Name(memberVo.getMem_Name());

		try {
			skillSharingBoardService
					.insertSkillSharingBoard(skillSharingBoardVo);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return url;
	}

	@RequestMapping(value = "/SkillSharingUpdate", method = RequestMethod.GET)
	public String updateskillSharingBoardForm(String ssb_Article_Num,
			Model model,SkillSharingBoardVo skillSharingBoardVo, 
			HttpServletResponse response, HttpSession session) throws NumberFormatException, SQLException, IOException {
		
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		  String login_Mem_Email = memberVo.getMem_Email();
		  SkillSharingBoardVo skillSharingBoardVo1 = 
				  skillSharingBoardService.selectSkillSharingBoardDetail(Integer
					.parseInt(ssb_Article_Num));
		  String article_mem_Email = skillSharingBoardVo1.getMem_Email();
		 
		if(login_Mem_Email.equals(article_mem_Email)){
		
			skillSharingBoardVo = skillSharingBoardService.selectSkillSharingBoardDetail(Integer.parseInt(ssb_Article_Num));
		
		model.addAttribute("skillSharingBoardVo", skillSharingBoardVo);
		return "SkillSharing/SkillSharingUpdate";
		}else{
		
		skillSharingBoardService.updateSkillSharingBoardCountM(skillSharingBoardVo);
		
		return "redirect:SkillSharingDetail?ssb_Article_Num="+ ssb_Article_Num+"&modi=no";
	}
		

	}

	@RequestMapping(value = "/SkillSharingUpdate", method = RequestMethod.POST)
	public String updateskillSharingBoard(
			SkillSharingBoardVo skillSharingBoardVo) throws SQLException {
		
		String url = "redirect:SkillSharingBoardList";
		skillSharingBoardService.updateSkillSharingBoard(skillSharingBoardVo);
		return url;
	}

	@RequestMapping(value = "/SkillSharingWrite", method = RequestMethod.GET)
	public String writeskillSharingBoard(HttpSession session, Model model) {
		String url = "SkillSharing/SkillSharingWrite";
		return url;

	}

	@RequestMapping(value = "/SkillSharingDelete", method = RequestMethod.POST)
	public String deleteskillSharingBoard(String ssb_Article_Num,HttpSession session,SkillSharingBoardVo skillSharingBoardVo) 
			throws NumberFormatException, SQLException {
		String url = "redirect:SkillSharingBoardList";
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		String login_Mem_Email = memberVo.getMem_Email();
		  SkillSharingBoardVo skillSharingBoardVo1 = 
				  skillSharingBoardService.selectSkillSharingBoardDetail(Integer
					.parseInt(ssb_Article_Num));
		  String article_mem_Email = skillSharingBoardVo1.getMem_Email();
		  
		  if(login_Mem_Email.equals(article_mem_Email)){
		  try {
			skillSharingBoardService.deleteSkillSharingBoard(Integer
					.parseInt(ssb_Article_Num));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  }else{
			  skillSharingBoardService.updateSkillSharingBoardCountM(skillSharingBoardVo);
			  return "redirect:SkillSharingDetail?ssb_Article_Num="+ ssb_Article_Num+"&delete=no";
		  }
		return url;
	}

	@RequestMapping("/searchTitle")
	public String searchTitle(
			@RequestParam(defaultValue = "") String ssb_Title, Model model) throws SQLException {
		String url = "redirect:SkillSharingBoardList?ssb_Title="+ssb_Title;
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+ssb_Title);
		/*List<SkillSharingBoardVo> skillSharingBoardList = null;
	
			skillSharingBoardList = skillSharingBoardService.selectSearchSsbTitle(ssb_Title);
		
		model.addAttribute("skillSharingBoardList", skillSharingBoardList);*/
		return url;
	}
	
	@RequestMapping(value="/SkillSharingReplyList")
	public @ResponseBody List<SkillSharingBoardReplyVo> selectSkillSharingReplyList(@RequestBody Map<String,Object> jsonMap,Model model){
		
		List<SkillSharingBoardReplyVo> skillSharingBoardReply = new ArrayList<SkillSharingBoardReplyVo>();
		String ssb_Article_Num = (String) jsonMap.get("ssb_Article_Num");
		System.out.println(ssb_Article_Num);
		try {
			skillSharingBoardReply = skillSharingBoardReplyService.selectSkillSharingBoardReply(Integer.parseInt(ssb_Article_Num));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("skillSharingBoardReply",skillSharingBoardReply);
		return skillSharingBoardReply;
	}
	
	@RequestMapping(value="SkillSharingReplyWrite", method=RequestMethod.POST)
	public  @ResponseBody List<SkillSharingBoardReplyVo> writeSkillSharingReply
	(@RequestBody SkillSharingBoardReplyVo skillSharingBoardReplyVo, HttpSession session){
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		String mem_Email = memberVo.getMem_Email();
		String mem_Name = memberVo.getMem_Name();
		skillSharingBoardReplyVo.setSsb_Reply_Mem(mem_Email);
		skillSharingBoardReplyVo.setSsb_Reply_Mem_Name(mem_Name);
		List<SkillSharingBoardReplyVo> skillSharingBoardReplyList = new ArrayList<SkillSharingBoardReplyVo>();
		try {
			skillSharingBoardReplyService.insertSkillSharingBoardReply(skillSharingBoardReplyVo);
			skillSharingBoardReplyList = skillSharingBoardReplyService.selectSkillSharingBoardReply(skillSharingBoardReplyVo.getSsb_Article_Num());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return skillSharingBoardReplyList;
	}
	
	

}
