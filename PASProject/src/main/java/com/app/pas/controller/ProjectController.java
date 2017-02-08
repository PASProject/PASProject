package com.app.pas.controller;

import java.sql.SQLException;
import java.text.ParseException;
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
import com.app.pas.dto.ProjInviteViewVo;
import com.app.pas.dto.board.AccountBoardVo;
import com.app.pas.dto.board.NoticeVo;
import com.app.pas.dto.board.ProjectBoardReplyVo;
import com.app.pas.dto.board.ProjectBoardVo;
import com.app.pas.service.InviteService;
import com.app.pas.service.MemberService;
import com.app.pas.service.board.AccountBoardService;
import com.app.pas.service.board.NoticeService;
import com.app.pas.service.board.ProjectBoardReplyService;
import com.app.pas.service.board.ProjectBoardService;


@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	NoticeService noticeService;
	@Autowired
	ProjectBoardService projectBoardService;
	
	@Autowired
	ProjectBoardReplyService projectBoardReplyService;
	
	@Autowired
	AccountBoardService accountService;
	@Autowired
	MemberService memberService;
	@Autowired
	InviteService inviteService;
	
	//프로젝트 Board List ---------------------------------------------
	@RequestMapping("/pmBoardList")
	public String selectProjectBoardList(HttpSession session,Model model,@RequestParam(value = "page", defaultValue = "1") String page
			) throws SQLException {
		
		List<ProjectBoardVo> pbList = new ArrayList<ProjectBoardVo>();
		String url ="project/pmBoardList";
		
		String getProj_Num = (String) session.getAttribute("joinProj");
		pbList = projectBoardService.selectProjectBoardList(Integer.parseInt(getProj_Num));
		
		model.addAttribute("pbList", pbList);
		return url;
	}
	
	
	//프로젝트 board 게시글 올리기-----------------------------------------
		@RequestMapping(value="/pmBoardInsert",method=RequestMethod.POST)
		public String insertProjectBoard( Model model,ProjectBoardVo projectBoardVo,HttpSession session) throws SQLException {
			//int proj_Num = (Integer) session.getAttribute("joinProj");
		
			//세션의 정보를 가져와서 넣음
			MemberVo memberVo = (MemberVo)session.getAttribute("loginUser");
			String mem_Email = memberVo.getMem_Email();
			projectBoardVo.setMem_Email(mem_Email); 
	        projectBoardVo.setMem_Name(memberVo.getMem_Name());
			projectBoardVo.setProj_Num(1);
			System.out.println("프로제이넘" +  projectBoardVo.getProj_Num());
			
			projectBoardService.insertProjectBoard(projectBoardVo);
			System.out.println("projectBoardVo"+projectBoardVo);
			
			String url = "redirect:pmBoardList";
			return url;
		}		
//프로젝트 Board 글 수정 ------------------------------------------------------------------		
		@RequestMapping(value= "/pmBoardUpdate")
		public String updateProjectBoard(ProjectBoardVo projectBoardVo,Model model,HttpSession session) {
			MemberVo memberVo = (MemberVo)session.getAttribute("loginUser");
			String mem_Email = memberVo.getMem_Email();
			String url = "redirect:pmBoardMyProjectList";
			projectBoardVo.setMem_Email(mem_Email); 
			
			System.out.println("여기오는가 수정수정?");
			System.out.println("수정하는 중  vo값 : " +projectBoardVo  );
			try {
				projectBoardService.updateProjectBoard(projectBoardVo);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return url;
		}
		
		
		//내가 쓴 글 보기 --------------------------------------------------	
		@RequestMapping("/pmBoardMyProjectList")
		public String myProjectList(Model model,HttpSession session,ProjectBoardVo projectBoardVo
				) throws SQLException{
			List<ProjectBoardVo> pbList = new ArrayList<ProjectBoardVo>();
			
			MemberVo memberVo = (MemberVo)session.getAttribute("loginUser");
			String mem_Email = memberVo.getMem_Email();
			projectBoardVo.setMem_Email(mem_Email); 
			projectBoardVo.setProj_Num(1);
			
			String url="project/pmBoardMyProjectList";

			pbList = projectBoardService.myProjectList(mem_Email);
			model.addAttribute("projectBoardVo",projectBoardVo);
			model.addAttribute("pbList",pbList);
			
			return url;
		}
		//글삭제 ------------------------------------------------------------------------
		@RequestMapping("/deleteProjectBoard")
		public String deleteProjectBoard(String pb_Article_Num) {
			String url = "redirect:pmBoardMyProjectList";
			try {
				projectBoardService.deleteProjectBoard(Integer
						.parseInt(pb_Article_Num));
			} catch (NumberFormatException e) {
				
				e.printStackTrace();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			return url;
		}

//댓글 
		
//댓글 리스트---------------------------------------------------------------
		@RequestMapping(value = "/selectProjectBoardReply",method = RequestMethod.POST)
		public @ResponseBody List<List<ProjectBoardReplyVo>> selectProjectBoardReply(HttpSession session) throws NumberFormatException, SQLException{
			String proj_Num = (String) session.getAttribute("joinProj");
			
			List<ProjectBoardVo> list = projectBoardService.selectProjectBoardList(Integer.parseInt(proj_Num));
			
			List<List<ProjectBoardReplyVo>> fullList = new ArrayList<List<ProjectBoardReplyVo>>();
			
			for(ProjectBoardVo x : list){
				List<ProjectBoardReplyVo> projectBoardReplyList = new ArrayList<ProjectBoardReplyVo>();
				projectBoardReplyList = projectBoardReplyService.selectProjectBoardReply(x.getPb_Article_Num());
				fullList.add(projectBoardReplyList);
			}
			
		/*	model.addAttribute("projectBoardReplyList",projectBoardReplyList);*/
			return fullList;
		}
		
		
		
//댓글 올리기 -----------------------------------------------------
		@RequestMapping(value = "/insertProjectBoardReply", method = RequestMethod.POST)
		public @ResponseBody List<ProjectBoardReplyVo> insertProjectBoardReply(@RequestBody ProjectBoardReplyVo projectBoardReplyVo,HttpSession session) throws SQLException {
			MemberVo memberVo = (MemberVo)session.getAttribute("loginUser");
			String mem_Email = memberVo.getMem_Email();
			projectBoardReplyVo.setPb_Reply_Mem(mem_Email);;
			List<ProjectBoardReplyVo> list =projectBoardReplyService.insertProjectBoardReply(projectBoardReplyVo);
			
			return list;
		}
	
//		
//		@RequestMapping(value = "/pmBoardWrite", method = RequestMethod.GET)
//		public String writeFreeBoard(HttpSession session, Model model) {
//			String url = "project/pmBoardWrite";
//			return url;
//
//		}

		
//------------------------------------------------------------------------------	
//------------------------------------------------------------------------------	
		
	

	@RequestMapping("/pmChat")
	public String PmChat(HttpSession session, Model model) {
		String url = "";
		return url;
	}
   
	
    //프로젝트 Notice 리스트
	@RequestMapping("/pmNoticeList")
	public String pmNoticeList(Model model, HttpSession session,
			@RequestParam(value = "page", defaultValue = "1") String page) {
		String proj_Num = (String) session.getAttribute("joinProj");
		int totalCount = 0;
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");

		String url = "project/pmNoticeList";

		List<NoticeVo> list = null;
		MemPositionViewVo memPositionView = new MemPositionViewVo();
		HashMap map = new HashMap();
		map.put("proj_Num", proj_Num);
		map.put("mem_Email", memberVo.getMem_Email());

		try {
			list = noticeService.getNoticeList(Integer.parseInt(proj_Num));
			model.addAttribute("NoticeList", list);
			memPositionView = noticeService.getNoticePosition(map);
			session.setAttribute("memPositionView", memPositionView);
			totalCount = noticeService.selectNoticeCount(Integer.parseInt(proj_Num));

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
    
	//프로젝트 Notice게시판 글쓰기 POST
	@RequestMapping(value="/pmNoticeWrite", method=RequestMethod.POST)
	public String pmNoticeWrite(HttpSession session, NoticeVo noticeVo) {
		String url = "redirect:/project/pmNoticeList";
		int proj_Num = (Integer) session.getAttribute("joinProj");

		noticeVo.setProj_Num(proj_Num);

		try {
			noticeService.insertNotice(noticeVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return url;

	}
	
	//프로젝트 Notice게시판 글쓰기 Form
	@RequestMapping(value = "/pmNoticeWrite", method = RequestMethod.GET)
	public String pmNoticeWriteForm(HttpServletRequest request, String proj_Num,
			String notice_Num) {
		String url = "project/pmNoticeWrite";

		return url;

	}
	//프로젝트 Notice게시판 디테일 
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
	
	
	//프로젝트 Notice게시판 수정 Form
	@RequestMapping(value="/pmNoticeUpdate",method=RequestMethod.GET)
	public String pmNoticeUpdateForm(HttpServletRequest request, String proj_Num,
			String notice_Num) {
		String url = "project/pmNoticeUpdate";
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
	
	//프로젝트 Notice게시판 수정 POST
	@RequestMapping(value="/pmNoticeUpdate",method=RequestMethod.POST)
	public String updateUpdate(NoticeVo noticeVo) {
		String url = "redirect:/project/pmNoticeList";

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
		String url = "redirect:/notice/pmNoticeList";
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
	public String PmOverView(HttpSession session, Model model,@RequestParam String proj_Num) {
		String url = "project/pmOverView";
		// joinProj 현재 접속한 프로젝트 번호 
		session.setAttribute("joinProj", proj_Num);
		return url;
	}

	@RequestMapping("/teamMemberList")
	public String TeamMemberList(HttpSession session, Model model) {
		String url = "";
		return url;
	}
	
	@RequestMapping("/AccountBoardList")
	public String AccountBoardList(HttpSession session, Model model,
			@RequestParam(value = "page", defaultValue = "1") String page) throws SQLException{
		String url="schedule/accountForm";
		/*int proj_Num = (Integer) session.getAttribute("joinProj");*/
		String Num=(String) session.getAttribute("joinProj");
		int proj_Num = Integer.parseInt(Num);
		int totalCount = 0;
		List<AccountBoardVo> list =accountService.getAccountList(proj_Num);
		System.out.println(list+"이건 리스트!!");
		if(list.isEmpty()!=true){
		int Imp = accountService.sumAccountImp(proj_Num);
		int Exp = accountService.sumAccountExp(proj_Num);
		model.addAttribute("sumImp",Imp);
		model.addAttribute("sumExp",Exp);
		}
		model.addAttribute("AccountBoardList", list);
		
		totalCount = accountService.selectAccountCount(proj_Num);
		
		
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
	
	@RequestMapping(value="/AccountBoardInsert", method=RequestMethod.POST)
	public @ResponseBody int AccountBoardInsert(@RequestBody Map<String,Object> map) throws SQLException, ParseException{
		int result=1;
		AccountBoardVo accountBoardVo = new AccountBoardVo();
		
		String str= map.get("acc_Date").toString(); 
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
		java.util.Date t = sdf.parse(str); 
		java.sql.Date st = new java.sql.Date(t.getTime());
		java.sql.Timestamp sts = new java.sql.Timestamp(t.getTime());
		
		accountBoardVo.setAcc_Date(sts);
		int acc_Imp =Integer.parseInt(map.get("acc_Imp").toString());
		 accountBoardVo.setAcc_Imp(acc_Imp);
		 int acc_Exp = Integer.parseInt(map.get("acc_Exp").toString());
		 accountBoardVo.setAcc_Exp(acc_Exp);
		 accountBoardVo.setAcc_Content((String)map.get("acc_Content"));
		 accountBoardVo.setAcc_Total(acc_Imp-acc_Exp);
		 accountBoardVo.setProj_Num(Integer.parseInt(map.get("proj_Num").toString()));
		accountService.InsertAccountBoard(accountBoardVo);
		return result;
	}
	
	@RequestMapping(value="/AccountBoardUpdate", method=RequestMethod.POST)
	public @ResponseBody int AccountBoardUpdate(@RequestBody Map<String,Object> map) throws SQLException, ParseException{
		int result=1;
		AccountBoardVo accountBoardVo = new AccountBoardVo();
		accountBoardVo.setAcc_Num(Integer.parseInt(map.get("acc_Num").toString()));
		accountBoardVo.setProj_Num(Integer.parseInt(map.get("proj_Num").toString()));
		accountBoardVo = accountService.selectAccountBoardByAcc(accountBoardVo);
		String str= map.get("acc_Date").toString();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyy-MM-dd");
		java.util.Date t =sdf.parse(str);
		java.sql.Date st = new java.sql.Date(t.getTime());
		java.sql.Timestamp sts = new java.sql.Timestamp(t.getTime());
		accountBoardVo.setAcc_Date(sts);
		System.out.println(accountBoardVo.getAcc_Date()+"이것은 accountboardVo accDate");
		int acc_Imp =Integer.parseInt(map.get("acc_Imp").toString());
		 accountBoardVo.setAcc_Imp(acc_Imp);
		 int acc_Exp = Integer.parseInt(map.get("acc_Exp").toString());
		 accountBoardVo.setAcc_Exp(acc_Exp);
		 accountBoardVo.setAcc_Content((String)map.get("acc_Content"));
		 accountBoardVo.setAcc_Total(acc_Imp-acc_Exp);
		 
		accountService.updateAccountBoard(accountBoardVo);
		return result;
	}
	
	
	@RequestMapping(value="/AccountBoardDelete", method=RequestMethod.POST)
	public @ResponseBody int AccountBoardDelete(@RequestBody Map<String,Object> map) throws SQLException{
		int result=1;
		AccountBoardVo accountBoardVo = new AccountBoardVo();
		accountBoardVo.setAcc_Num(Integer.parseInt(map.get("acc_Num").toString()));
		accountBoardVo.setProj_Num(Integer.parseInt(map.get("proj_Num").toString()));
		
		accountService.deleteAccountBoard(accountBoardVo);
		return result;
	}
	
	@RequestMapping("/pmMemberList")
    public String pmMemberList(HttpSession session,Model model) throws SQLException{
		String url="/project/teamMemberList";
		/*int proj = (Integer) session.getAttribute("joinProj");*/
		int proj=9;
		int
		per =1;
		MemPositionViewVo memPositionView = new MemPositionViewVo();
		memPositionView.setPjj_Per_Num(1);
		memPositionView.setProj_Num(1);
		
        
		List<MemPositionViewVo> list =memberService.selectMemberListByProj(memPositionView);
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		memPositionView.setMem_Email(memberVo.getMem_Email());
		memPositionView =memberService.selectMemberPosition(memPositionView);
		model.addAttribute("pmMemberList", list);
		model.addAttribute("memPositionView", memPositionView);
		return url;
	}
	
	@RequestMapping("/pmMemberInvite")
	public String pmMemberInvite(HttpSession session) throws SQLException{
		String url="/project/teamInvite";
		String mem_Email="";
		/*int proj_Num= (Integer) session.getAttribute("joinProj");*/
		ProjInviteViewVo projInviteViewVo = new ProjInviteViewVo();
		projInviteViewVo.setProj_Num(1);
		
		List<ProjInviteViewVo> list =inviteService.selectInviteList(projInviteViewVo);
		session.setAttribute("InviteList", list);
		List<MemberVo> memberList =memberService.selectMemberList();
		System.out.println(memberList+"멤버리스트!!!!!!!!!!!!!!!!!!");
		session.setAttribute("memberList", memberList);
		return url;
	}
	
	
}
/*	@RequestMapping("/projectBoardReplyList")

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
	
	@RequestMapping(value="/projectBoardReplyWrite", method=RequestMethod.POST)
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
	}
}
*/


















