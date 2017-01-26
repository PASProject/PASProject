package com.app.pas.controller.totalboard;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.pas.dto.MemberVo;
import com.app.pas.dto.board.SkillSharingBoardVo;
import com.app.pas.service.board.SkillSharingBoardService;

@Controller
@RequestMapping("/SkillSharing")
public class SkillSharingController {

	@Autowired
	SkillSharingBoardService skillSharingBoardService;

	@RequestMapping("/SkillSharingList")
	public String skillSharingBoardList(HttpSession session, Model model) {
		String url = "SkillSharing/SkillSharingBoardList";
		List<SkillSharingBoardVo> skillSharingBoardList = null;
		try {
			skillSharingBoardList = skillSharingBoardService
					.selectSkillSharingBoardList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("skillSharingBoardList", skillSharingBoardList);
		return url;

	}

	@RequestMapping("/SkillSharingDetail")
	public String detailskillSharingBoard(@RequestParam String ssb_Article_Num,
			Model model) {
		String url = "SkillSharing/SkillSharingDetail";
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

	@RequestMapping("/SkillSharingInsert")
	public String insertskillSharingBoardForm(HttpSession session, Model model) {
		String url = "skillSharing/SkillSharingWrite";
		return url;

	}

	@RequestMapping(value = "/SkillSharingInsert", method = RequestMethod.POST)
	public String insertskillSharingBoard(HttpSession session,
			SkillSharingBoardVo skillSharingBoardVo) {
		String url = "redirect:SkillSharingList";

		/*MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		String mem_Email = memberVo.getMem_Email();
		skillSharingBoardVo.setMem_Email(mem_Email);*/
		
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
	public String updateskillSharingBoardForm(String ssb_Article_Num, Model model) {
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
	
	@RequestMapping(value="/SkillSharingUpdate", method=RequestMethod.POST)
	public String updateskillSharingBoard(SkillSharingBoardVo skillSharingBoardVo){
		String url ="redirect:SkillSharingList";
		try {
			skillSharingBoardService.updateSkillSharingBoard(skillSharingBoardVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url;
	}

	@RequestMapping(value="/SkillSharingWrite",method=RequestMethod.GET)
	public String writeskillSharingBoard(HttpSession session, Model model) {
		String url = "SkillSharing/SkillSharingWrite";
		return url;

	}

	@RequestMapping(value="/SkillSharingDelete",method=RequestMethod.POST)
	public String deleteskillSharingBoard(String ssb_Article_Num) {
		String url = "redirect:SkillSharingList";
		try {
			skillSharingBoardService.deleteSkillSharingBoard(Integer.parseInt(ssb_Article_Num));
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
