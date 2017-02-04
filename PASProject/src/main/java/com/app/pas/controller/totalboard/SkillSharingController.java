package com.app.pas.controller.totalboard;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.pas.commons.Paging;
import com.app.pas.dto.LikeVo;
import com.app.pas.dto.MemberVo;
import com.app.pas.dto.board.SkillSharingBoardLikeVo;
import com.app.pas.dto.board.SkillSharingBoardVo;
import com.app.pas.service.board.SkillSharingBoardService;

@Controller
@RequestMapping("/SkillSharing")
public class SkillSharingController {

	@Autowired
	SkillSharingBoardService skillSharingBoardService;

	@RequestMapping("/SkillSharingList")
	public String skillSharingBoardList(Model model,
			@RequestParam(value = "page", defaultValue = "1") String page) throws SQLException {
		String url = "SkillSharing/SkillSharingBoardList";
		int totalCount = 0;
		List<SkillSharingBoardVo> skillSharingBoardList = new ArrayList<SkillSharingBoardVo>();
		
			skillSharingBoardList = skillSharingBoardService
					.selectSkillLikeCountViewList();
			totalCount = skillSharingBoardService.selectTotalCount();
		/*	int likeCount = skillSharingBoardService.selectCountSharingBoardLike(ssb_Article_Num);*/

		if (page.equals(null) || page == "") {
			page = "" + 1;
		}

		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(page));
		paging.setPageSize(10);
		paging.setTotalCount(totalCount);

		model.addAttribute("paging", paging);
		model.addAttribute("skillSharingBoardList", skillSharingBoardList);
		return url;

	}

	@RequestMapping("/SkillSharingDetail")
	public String detailskillSharingBoard(@RequestParam String ssb_Article_Num,
			Model model,HttpServletRequest request,HttpSession session) throws NumberFormatException, SQLException {
		
		 /* System.out.println("SkillSharingLike 로 들어왔당!"); 
		  MemberVo memberVo = (MemberVo) session.getAttribute("loginUser"); 
		  String mem_Email = memberVo.getMem_Email();*/
		
		String like = "";
		String modi = null;
		String message = null;
		String delete = null;
		message = request.getParameter("message");
		like = request.getParameter("like");
		modi = request.getParameter("modi");
		delete = request.getParameter("delete");
		System.out.println(modi);
		String url = "SkillSharing/SkillSharingDetail";
		
		if(like != null) {
			model.addAttribute("like", like);
		}
		if(modi != null){
			model.addAttribute("modi", modi);
		}
		if(delete !=null){
			model.addAttribute("delete",delete);
		}
		
		SkillSharingBoardVo skillSharingBoardVo = null;
		SkillSharingBoardLikeVo skillSharingBoardLikeVo = null;
		
		
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
		/*
		 * System.out.println("SkillSharingLike 로 들어왔당!"); MemberVo memberVo =
		 * (MemberVo) session.getAttribute("loginUser"); String mem_Email =
		 * memberVo.getMem_Email();
		 */
		
		
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
		
		}else{
			
			skillSharingBoardService.updateSkillSharingBoardCountM(skillSharingBoardVo);
			System.out.println("else 값 들어옴");
			return "redirect:SkillSharingDetail?ssb_Article_Num="+ ssb_Article_Num+"& message=2&like=ok";
		}
		return url;
		
	}

	@RequestMapping("/SkillSharingInsert")
	public String insertskillSharingBoardForm(HttpSession session, Model model) {
		String url = "skillSharing/SkillSharingWrite";
		return url;

	}

	@RequestMapping(value = "/SkillSharingInsert", method = RequestMethod.POST)
	public String insertskillSharingBoard(HttpSession session,
			SkillSharingBoardVo skillSharingBoardVo) {
		String url = "redirect:SkillSharingList";

		/*
		 * MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		 * String mem_Email = memberVo.getMem_Email();
		 * skillSharingBoardVo.setMem_Email(mem_Email);
		 */

		skillSharingBoardVo.setMem_Email("abc@naver.com");

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
		/*String url = "SkillSharing/SkillSharingUpdate";*/
		
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		  String login_Mem_Email = memberVo.getMem_Email();
		  SkillSharingBoardVo skillSharingBoardVo1 = 
				  skillSharingBoardService.selectSkillSharingBoardDetail(Integer
					.parseInt(ssb_Article_Num));
		  String article_mem_Email = skillSharingBoardVo1.getMem_Email();
		 
		if(login_Mem_Email.equals(article_mem_Email)){
			System.out.println("if로들어옴");
		try {
			skillSharingBoardVo = skillSharingBoardService
					.selectSkillSharingBoardDetail(Integer
							.parseInt(ssb_Article_Num));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("skillSharingBoardVo", skillSharingBoardVo);
		return "SkillSharing/SkillSharingUpdate";
	}else{
		
		skillSharingBoardService.updateSkillSharingBoardCountM(skillSharingBoardVo);
		System.out.println("else로들어옴");
		return "redirect:SkillSharingDetail?ssb_Article_Num="+ ssb_Article_Num+"&modi=no";
	}
		

	}

	@RequestMapping(value = "/SkillSharingUpdate", method = RequestMethod.POST)
	public String updateskillSharingBoard(
			SkillSharingBoardVo skillSharingBoardVo,HttpSession session) {
		
		  
		String url = "redirect:SkillSharingList";
		
		try {
			skillSharingBoardService
					.updateSkillSharingBoard(skillSharingBoardVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
		String url = "redirect:SkillSharingList";
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
			@RequestParam(defaultValue = "") String ssb_Title, Model model) {
		String url = "SkillSharing/SkillSharingBoardList";
		List<SkillSharingBoardVo> skillSharingBoardList = null;
		try {
			skillSharingBoardList = skillSharingBoardService
					.selectSearchSsbTitle(ssb_Title);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("skillSharingBoardList", skillSharingBoardList);
		return url;
	}

}
