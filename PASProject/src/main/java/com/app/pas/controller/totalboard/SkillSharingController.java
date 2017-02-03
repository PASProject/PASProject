package com.app.pas.controller.totalboard;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.app.pas.commons.Paging;
import com.app.pas.dao.board.SkillSharingBoardDao;
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
			Model model,HttpServletRequest request,HttpSession session) {
		
		 /* System.out.println("SkillSharingLike 로 들어왔당!"); 
		  MemberVo memberVo = (MemberVo) session.getAttribute("loginUser"); 
		  String mem_Email = memberVo.getMem_Email();*/
		 
		String message = null;
		message = request.getParameter("message");
		String url = "SkillSharing/SkillSharingDetail";
		SkillSharingBoardVo skillSharingBoardVo = null;
		SkillSharingBoardLikeVo skillSharingBoardLikeVo = null;
		System.out.println("URL : "+request.getRequestURL().toString());
		System.out.println("URI : "+request.getRequestURI().toString());
		
		try {
			skillSharingBoardVo = skillSharingBoardService
					.selectSkillSharingBoardDetail(Integer
							.parseInt(ssb_Article_Num));
			if(message== null){
			skillSharingBoardService
					.updateSkillSharingBoardCount(skillSharingBoardVo);
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("skillSharingBoardVo", skillSharingBoardVo);
		return url;
	}
	
	@RequestMapping("/SkillSharingLike")
	public String detailskillSharingBoardLike(
			@RequestParam String ssb_Article_Num, Model model,
			HttpSession session,HttpServletRequest request) throws SQLException {
		/*
		 * System.out.println("SkillSharingLike 로 들어왔당!"); MemberVo memberVo =
		 * (MemberVo) session.getAttribute("loginUser"); String mem_Email =
		 * memberVo.getMem_Email();
		 */
		
		System.out.println("like : "+request.getRequestURL().toString());
		String url = "redirect:SkillSharingDetail?ssb_Article_Num="+ ssb_Article_Num+"& message=1";
		SkillSharingBoardVo skillSharingBoardVo = new SkillSharingBoardVo();
		SkillSharingBoardLikeVo skillSharingBoardLikeVo = new SkillSharingBoardLikeVo();
		SkillSharingBoardLikeVo LikeMember = new SkillSharingBoardLikeVo();
		
		skillSharingBoardLikeVo.setSsb_Article_Num(Integer
				.parseInt(ssb_Article_Num));
		skillSharingBoardVo.setSsb_Article_Num(Integer
				.parseInt(ssb_Article_Num));
		skillSharingBoardLikeVo.setMem_Email("abc@naver.com");
		
		LikeMember =skillSharingBoardService.selectSkillSharingBoardLikeList(Integer
				.parseInt(ssb_Article_Num));
		
		int likeCount = skillSharingBoardService
				.insertSkillSharingBoardLike(skillSharingBoardVo,
						skillSharingBoardLikeVo, Integer.parseInt(ssb_Article_Num));
		model.addAttribute("likeCount", likeCount);
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
			Model model) {
		String url = "SkillSharing/SkillSharingUpdate";
		SkillSharingBoardVo skillSharingBoardVo = null;
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
		return url;

	}

	@RequestMapping(value = "/SkillSharingUpdate", method = RequestMethod.POST)
	public String updateskillSharingBoard(
			SkillSharingBoardVo skillSharingBoardVo) {
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
	public String deleteskillSharingBoard(String ssb_Article_Num) {
		String url = "redirect:SkillSharingList";
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
