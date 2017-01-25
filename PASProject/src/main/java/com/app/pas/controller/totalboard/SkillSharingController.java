package com.app.pas.controller.totalboard;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.pas.dto.board.FreeBoardVo;
import com.app.pas.dto.board.SkillSharingBoardVo;
import com.app.pas.service.board.SkillSharingBoardService;

@Controller
@RequestMapping("/SkillSharing")
public class SkillSharingController {

	@Autowired
	SkillSharingBoardService skillSharingBoardService;

	@RequestMapping("/SkillSharingList")
	public String TechList(HttpSession session, Model model) {
		String url = "SkillSharing/SkillSharingBoardList";
		List<SkillSharingBoardVo> skillSharingBoardList = skillSharingBoardService
				.selectSkillSharingBoardList();

		model.addAttribute("skillSharingBoardList", skillSharingBoardList);
		return url;

	}
	
	@RequestMapping("/SkillSharingDetail")
	public String detailskillSharingBoard(@RequestParam String ssb_Article_Num,Model model){
		String url="SkillSharing/SkillSharingDetail";
		SkillSharingBoardVo skillSharingBoardVo = skillSharingBoardService.selectSkillSharingBoardDetail(Integer.parseInt(ssb_Article_Num));
		model.addAttribute("skillSharingBoardVo",skillSharingBoardVo);
		return url;
	}

	@RequestMapping("/SkillSharingInsert")
	public String insertTech(HttpSession session, Model model) {
		String url = "";
		return url;

	}

	@RequestMapping("/SkillSharingUpdate")
	public String updateTech(HttpSession session, Model model) {
		String url = "";
		return url;

	}

	@RequestMapping("/SkillSharingWrite")
	public String writeTech(HttpSession session, Model model) {
		String url = "";
		return url;

	}

	@RequestMapping("/SkillSharingDelete")
	public String deleteTech(HttpSession session, Model model) {
		String url = "";
		return url;
	}

}
