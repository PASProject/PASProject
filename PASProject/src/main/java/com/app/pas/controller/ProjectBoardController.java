package com.app.pas.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.pas.commons.Paging;
import com.app.pas.dto.MemberVo;
import com.app.pas.dto.board.FreeBoardVo;
import com.app.pas.dto.board.ProjectBoardVo;
import com.app.pas.service.board.NoticeService;
import com.app.pas.service.board.ProjectBoardService;

@Controller
@RequestMapping("/project")
public class ProjectBoardController {

	@Autowired
	NoticeService noticeService;
	@Autowired
	ProjectBoardService projectBoardService;

	@RequestMapping("/projectBoardList")
	public String ProjectBoardList(Model model,@RequestParam(value = "page", defaultValue = "1") String page) {
		String url = "projectBoard/projectBoardList";

		return url;

	}
//프로젝트 게시글 올리기-----------------------------------------
	@RequestMapping("/projectBordInsert")
	public String insertProjectBoard(HttpSession session, Model model,ProjectBoardVo projectBoardVo) throws SQLException {
		/*int proj_Num = (Integer) session.getAttribute("joinProj");*/
		projectBoardVo.setMem_Email("임시Email");
		projectBoardVo.setProj_Num(1);
		
		System.out.println("여기오는가?");
		projectBoardService.insertProjectBoard(projectBoardVo);
		System.out.println("projectBoardVo");
	
		
		String url = "projectBoard/projectBoardList";
		return url;
	}

//----------------------------------------------
	

	@RequestMapping(value = "/projectBoardUpdate", method = RequestMethod.GET)
	public String updateProjectBoardForm(String pb_Article_Num, Model model) {
		String url = "projectBoard/projectBoardUpdate";
		ProjectBoardVo projectBoardVo = null;
		try {
			projectBoardVo = projectBoardService
					.selectProjectBoardDetail(Integer.parseInt(pb_Article_Num));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("freeBoardVo", projectBoardVo);
		return url;
	}

	@RequestMapping(value = "/projectBoardUpdate", method = RequestMethod.POST)
	public String updateProjectBoard(ProjectBoardVo projectBoardVo) {
		String url = "redirect:projectBoardList";
		try {
			projectBoardService.updateProjectBoard(projectBoardVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url;
	}

	@RequestMapping(value = "/projectBoardWrite", method = RequestMethod.GET)
	public String writeFreeBoard(HttpSession session, Model model) {
		String url = "projectBoard/projectBoardWrite";
		return url;

	}

	@RequestMapping(value = "/fprojectBoardDelete", method = RequestMethod.POST)
	public String deleteFreeBoard(String pb_Article_Num) {
		String url = "redirect:projectBoardList";
		try {
			projectBoardService.deleteProjectBoard(Integer
					.parseInt(pb_Article_Num));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url;
	}

	@RequestMapping("/pmBoard")
	public String PmBoard(HttpSession session, Model model) {
		String url = "";
		return url;
	}

	@RequestMapping("/pmChat")
	public String PmChat(HttpSession session, Model model) {
		String url = "";
		return url;
	}

	@RequestMapping("/pmNoticeList")
	public String PmNoticeList(HttpSession session, Model model) {
		String url = "";
		return url;
	}

	@RequestMapping("/pmNoticeWrite")
	public String WritePmNotice(HttpSession session, Model model) {
		String url = "";
		return url;

	}

	@RequestMapping("/pmNoticeUpdate")
	public String UpdatePmNotice(HttpSession session, Model model) {
		String url = "";
		return url;
	}

	@RequestMapping("/pmNoticeDelete")
	public String DeletePmNotice(HttpSession session, Model model) {
		String url = "";
		return url;
	}

	@RequestMapping("/pmOverView")
	public String PmOverView(HttpSession session, Model model,
			@RequestParam String proj_Num) {
		String url = "project/pmOverView";
		model.addAttribute("proj_Num", proj_Num);
		return url;
	}

	@RequestMapping("/teamMemberList")
	public String TeamMemberList(HttpSession session, Model model) {
		String url = "";
		return url;
	}
}