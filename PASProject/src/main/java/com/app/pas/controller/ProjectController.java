package com.app.pas.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.app.pas.dto.MemPositionViewVo;
import com.app.pas.dto.MemberVo;
import com.app.pas.dto.board.NoticeVo;
import com.app.pas.dto.board.ProjectBoardVo;
import com.app.pas.service.board.NoticeService;
import com.app.pas.service.board.ProjectBoardService;




@Controller
@RequestMapping("/project")

public class ProjectController {

	@Autowired
	NoticeService noticeService;



	
	@Autowired
	ProjectBoardService projectBoardService;
	
	
	
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
	public String NoticeList(Model model, HttpSession session,
			@RequestParam(value = "page", defaultValue = "1") String page) {
		int proj_Num = 1;
		int totalCount = 0;
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");

		String url = "project/pmNoticeList";

		List<NoticeVo> list = null;
		MemPositionViewVo memPositionView = new MemPositionViewVo();
		HashMap map = new HashMap();
		map.put("proj_Num", proj_Num);
		map.put("mem_Email", memberVo.getMem_Email());

		try {
			list = noticeService.getNoticeList(proj_Num);
			model.addAttribute("NoticeList", list);
			memPositionView = noticeService.getNoticePosition(map);
			session.setAttribute("memPositionView", memPositionView);
			totalCount = noticeService.selectNoticeCount();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (page.equals(null) || page == "") {
			page = "" + 1;
		}

		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(page));
		paging.setPageSize(10);
		paging.setTotalCount(totalCount);

		model.addAttribute("paging", paging);

		return url;

	}

	@RequestMapping(value = "/pmNoticeWrite", method = RequestMethod.POST)
	public String insertNotice(HttpSession session, NoticeVo noticeVo) {
		String url = "redirect:/project/noticeList";
		int proj_Num = 1;

		noticeVo.setProj_Num(proj_Num);

		try {
			noticeService.insertNotice(noticeVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return url;

	}

	@RequestMapping(value = "/pmNoticeDetail", method = RequestMethod.GET)
	public String NoticeDetailForm(HttpServletRequest request, String proj_Num,
			String notice_Num) {
		String url = "project/pmNoticeDetail";
		// int iproj_Num = Integer.parseInt(proj_Num);
		HashMap map = new HashMap();
		map.put("proj_Num", proj_Num);
		map.put("notice_Num", notice_Num);

		try {
			NoticeVo noticeVo = (NoticeVo) noticeService.getNoticeDetail(map);
			request.setAttribute("NoticeVo", noticeVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return url;
	}

	@RequestMapping(value = "/pmNoticeWrite", method = RequestMethod.GET)
	public String writeNoticeForm(HttpServletRequest request, String proj_Num,
			String notice_Num) {
		String url = "project/pmNoticeWrite";

		return url;

	}

	@RequestMapping(value = "/pmNoticeUpdate", method = RequestMethod.GET)
	public String updateUpdateForm(HttpServletRequest request, String proj_Num,
			String notice_Num) {
		String url = "project/NoticeUpdate";
		HashMap map = new HashMap();
		map.put("proj_Num", proj_Num);
		map.put("notice_Num", notice_Num);

		try {
			NoticeVo noticeVo = (NoticeVo) noticeService.getNoticeDetail(map);
			request.setAttribute("NoticeVo", noticeVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return url;

	}

	@RequestMapping(value = "/pmNoticeUpdate", method = RequestMethod.POST)
	public String updateUpdate(NoticeVo noticeVo) {
		String url = "redirect:/project/noticeList";

		try {
			noticeService.updateNotice(noticeVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return url;
	}

	@RequestMapping("/pmNoticeDelete")
	public String deleteNotice(HttpSession session, NoticeVo noticeVo) {
		String url = "redirect:/project/noticeList";
		System.out.println(noticeVo.getProj_Num() + "이건프로젝트넘버@@@@");
		try {
			noticeService.deleteNotice(noticeVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return url;
	}

	@RequestMapping("/pmOverView")
	public String PmOverView(HttpSession session, Model model) {
		String url = "";
		return url;
	}

	@RequestMapping("/teamMemberList")
	public String TeamMemberList(HttpSession session, Model model) {
		String url = "";
		return url;
	}
	
	@RequestMapping("/projectBoardList")
	public String ProjectBoardList(Model model,@RequestParam(value="page",defaultValue="1")String page){
		String url = "projectBoard/projectBoardList";
		int totalCount= 0;
		/*Page<FreeBoardVo> postPage =projectBoardService.*/
		List<ProjectBoardVo> projectBoardList = new ArrayList<ProjectBoardVo>();
		try {
			projectBoardList = projectBoardService.selectProjectboardList();
			totalCount = projectBoardService.selectPBTotalCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(page.equals(null)||page ==""){
			page = ""+1;
		}
		
		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(page));
		paging.setPageSize(10);
		paging.setTotalCount(totalCount);
		
		model.addAttribute("paging",paging);
		model.addAttribute("projectBoardList", projectBoardList);
		return url;
	
	}
	
	@RequestMapping(value="/projectBoardInsert")
	public String insertProjectBoardForm(HttpSession session,Model model){
		String url = "projectBoard/projectBoardWrite";
		return url;
	}
	
	@RequestMapping(value="/projectBoardInsert", method=RequestMethod.POST)
	public String insertProjectBoard(HttpSession session, ProjectBoardVo projectBoardVo){
		String url = "redirect:projectBoardList";
		
		/*MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		 String mem_Email = memberVo.getMem_Email();
		 projectBoardVo.setMem_Email(mem_Email);*/
		
		projectBoardVo.setMem_Email("abc@naver.com");
		
		try {
			projectBoardService.insertProjectBoard(projectBoardVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return url;
	}
	
	@RequestMapping(value ="/projectBoardUpdate",method = RequestMethod.GET)
	public String updateProjectBoardForm(String pb_Article_Num, Model model){
		String url="projectBoard/projectBoardUpdate";
		ProjectBoardVo projectBoardVo=null;
		try {
			projectBoardVo = projectBoardService.selectProjectBoardDetail(Integer.parseInt(pb_Article_Num));
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
	
	@RequestMapping(value="/projectBoardUpdate",method=RequestMethod.POST)
	public String updateProjectBoard(ProjectBoardVo projectBoardVo){
		String url = "redirect:projectBoardList";
		try {
			projectBoardService.updateProjectBoard(projectBoardVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url;
	}
	
	@RequestMapping(value ="/projectBoardWrite",method=RequestMethod.GET )
	public String writeFreeBoard(HttpSession session,Model model){
		String url = "projectBoard/projectBoardWrite";
		return url;
				
	}
	
/*	@RequestMapping(value="/fprojectBoardDelete",method = RequestMethod.POST)
	public String deleteFreeBoard(String pb_Article_Num){
		String url="redirect:projectBoardList";
		try {
			projectBoardService.deleteProjectBoard(Integer.parseInt(pb_Article_Num));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return url;
	}
	
	/*
	@RequestMapping("/projectBoardReplyList")
	public @ResponseBody List<ProjectBoardVo> selectProjectBoardReplyList(@RequestBody Map<String,Object> jsonMap,Model model){
		
		List<ProjectBoardVo> projectBoardReplyList = new ArrayList<ProjectBoardVo>();
		String pb_Article_Num = (String)jsonMap.get("pb_Article_Num");
		
		try {
			projectBoardReplyList = projectBoardService.selectProjectboard(Integer.parseInt(pb_Article_Num));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("projectBoardList",projectBoardList);
		
		return projectBoardList;
	}
	*/
/*	@RequestMapping(value="/projectBoardReplyWrite", method=RequestMethod.POST)
	public @ResponseBody List<ProjectBoardVo> writeProjectBoardReply(@RequestBody ProjectBoardVo projectBoardVo, HttpSession session){
		 MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		 String mem_Email = memberVo.getMem_Email();
		 projectBoardVo.setMem_Email(mem_Email);
		
		List<ProjectBoardVo> projectBoardList = new ArrayList<ProjectBoardVo>();
		projectBoardVo.setPb_Wt_Mem("def@naver.com");
		
		try {
			projectBoardService.insertProjectboardDao(projectBoardVo);
			projectBoardList = projectBoardService.selectProjectboard(projectBoardVo.getPb_Article_Num());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return projectBoardList;
	}*/
}



















