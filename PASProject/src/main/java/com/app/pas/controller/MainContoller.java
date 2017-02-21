package com.app.pas.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.app.pas.dto.ApplyVo;
import com.app.pas.dto.MemApplyViewVo;
import com.app.pas.dto.MemPositionViewVo;
import com.app.pas.dto.MemberVo;
import com.app.pas.dto.MyPostBoardVo;
import com.app.pas.dto.ProjInviteViewVo;
import com.app.pas.dto.ProjectJoinVo;
import com.app.pas.dto.ProjectVo;
import com.app.pas.dto.board.FreeBoardVo;
import com.app.pas.dto.board.QnaBoardReplyVo;
import com.app.pas.dto.board.QnaBoardVo;
import com.app.pas.dto.board.SkillSharingBoardReplyVo;
import com.app.pas.dto.board.SkillSharingBoardVo;
import com.app.pas.service.InviteService;
import com.app.pas.service.MainService;
import com.app.pas.service.MemberService;
import com.app.pas.service.ProjectService;
import com.app.pas.service.board.QnaBoardReplyService;
import com.app.pas.service.board.QnaBoardService;
import com.app.pas.service.board.SkillSharingBoardReplyService;

@Controller
@RequestMapping("/main")
public class MainContoller {
	HttpServletRequest request;
	@Autowired
	private JavaMailSender mailSender;

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	@Autowired
	MemberService memberService;

	@Autowired
	ProjectService projectService;

	@Autowired
	InviteService inviteService;
	
	@Autowired
	MainService mainService;
	
	@Autowired
	QnaBoardService qnaBoardService; 
	
	@Autowired
	QnaBoardReplyService qnaBoardReplyService;
	
	@Autowired
	SkillSharingBoardReplyService skillSharingBoardReplyService;
	


	//연습용
		@RequestMapping(value="/temp")
		public String temp(HttpSession session, Model model){
		String url = "/main/temp";
		return url;
			
		}

	//공지팝업
	@RequestMapping(value="/tempNotice")
	public String tempNotice(HttpSession session, Model model){
	String url = "/main/tempNotice";
	return url;
		
	}
	//내가 쓴 글 보기
	@RequestMapping(value ="/myPostBoard")
	public String myPostBoard(HttpSession session, Model model,
			FreeBoardVo freeBoardVo,
			MyPostBoardVo myPostBoardVo,String page) throws SQLException {
		String url = "main/myPostBoard";
		if (session.getAttribute("proj_Num") != null) {
			session.removeAttribute("proj_Num");
		}
		if (session.getAttribute("joinProj") != null
				|| session.getAttribute("joinProj") != "null") {
			session.removeAttribute("joinProj");
		}
		if (session.getAttribute("joinProjectVo") != null
				|| session.getAttribute("joinProjectVo") != "null") {
			session.removeAttribute("joinProjectVo");
		}

		
//		List<SkillSharingBoardVo> myPostSkillList = new ArrayList<SkillSharingBoardVo>();
		List<MyPostBoardVo> myPostBoardList = new ArrayList<MyPostBoardVo>();
		
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		String mem_Email = memberVo.getMem_Email();
		String sessionMem_Name = memberVo.getMem_Name();
		model.addAttribute("sessionMem_Name", sessionMem_Name);
	
		myPostBoardVo.setMail(mem_Email);
//		freeBoardVo.setMem_Email(mem_Email);
//		skillSharingBoardVo.setMem_Email(mem_Email);
	
		myPostBoardList = mainService.MyPostBoard(myPostBoardVo);
//		myPostSkillList = mainService.myPostBoard_Skill(skillSharingBoardVo);
		
		model.addAttribute("myPostBoardList", myPostBoardList);
	
//		model.addAttribute("myPostSkillList", myPostSkillList);
	return url;
	}
	
	//기술공유 내가쓴글 보기
	@RequestMapping(value = "/myPostDetail_skill")
	public String myPostBoard_Skill(HttpSession session, Model model,
			MyPostBoardVo myPostBoardVo,SkillSharingBoardVo skillSharingBoardVo,
			SkillSharingBoardReplyVo skillSharingBoardReplyVo) throws SQLException {
	
		int skillDetailNum = myPostBoardVo.getNum();
		skillSharingBoardVo.setSsb_Article_Num(skillDetailNum);
		
		skillSharingBoardVo = (SkillSharingBoardVo)mainService.myPostBoard_Skill(skillSharingBoardVo);
		model.addAttribute("skillSharingBoardVo", skillSharingBoardVo);
		
		//답글보여주기
		skillSharingBoardReplyVo = mainService.selectSkillSharingBoardReply(skillDetailNum);
		model.addAttribute("skillSharingBoardReplyVo",skillSharingBoardReplyVo);
		
		String url = "/main/myPostDetail_skill";
		

		return url;
	
	}
	
	
	
	//qna디테일
	@RequestMapping(value = "/myPostDetail_qna")
	public String myPostDetail_qna(HttpSession session, Model model,QnaBoardVo qnaBoardVo,
			MyPostBoardVo myPostBoardVo,QnaBoardReplyVo qnaBoardReplyVo) throws SQLException {
	
		int qnaDetailNum = myPostBoardVo.getNum();
		qnaBoardVo.setQb_Article_Num(qnaDetailNum);
		
		qnaBoardVo = (QnaBoardVo)mainService.myPostBoard_Qna(qnaBoardVo);
		model.addAttribute("qnaBoardVo", qnaBoardVo);
		
		//답글보여주기
		//qnaBoardReplyVo.setQb_Article_Num(qnaDetailNum);
		qnaBoardReplyVo = qnaBoardReplyService.selectQnaReply(qnaDetailNum);
		model.addAttribute("qnaBoardReplyVo",qnaBoardReplyVo);
		
		String url = "/main/myPostDetail_qna";
		

		return url;
	
	}
	
	
	
	
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(HttpSession session, Model model) {

		if (session != null) {
			session.removeAttribute("loginUser");
			if (session.getAttribute("joinProj") != null
					|| session.getAttribute("joinProj") != "null") {
				session.removeAttribute("joinProj");
			}
			if(session.getAttribute("joinProjectVo")!=null || session.getAttribute("joinProjectVo") !="null" ){
				session.removeAttribute("joinProjectVo");
			}
		}
		String url = "/main/loginForm";
		return url;
	}

	// 로그인처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody int loginMember(HttpSession session, String email,
			String pwd) {

		int result = 0;
		MemberVo memberVo = null;

		memberVo = memberService.getMember(email);

		// 아이디 검증
		if (memberVo == null) {
			result = 0;

		} else {
			// 비밀번호 검증
			if (memberVo.getMem_Pass().equals(pwd)) {

				/* result = 1; */

				// 이메일 인증
				if (memberVo.getMem_Approve().equals("y")) {
					result = 1;
					// 로그인 정보 세션에 저장
					session.setAttribute("loginUser", memberVo);
				} else {
					result = 3;

				}
			} else {
				result = 2;
			}

		}
		/* System.out.println("result값" + result); */
		return result;
	}

	@RequestMapping(value = "/logOut")
	public String logOut(HttpSession session, Model model) {
		String url = "redirect:/index";
		session.removeAttribute("loginUser");
		if (session.getAttribute("joinProj") != null
				&& session.getAttribute("joinProj") != "null") {
			session.removeAttribute("joinProj");
		}
		return url;
	}

	// 가입처리
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(HttpSession session, Model model) {
		String url = "main/joinForm";
		return url;
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinMember(HttpSession session, MemberVo memberVo,
			HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException,
			MessagingException, SQLException {
		String url = "redirect:/index";
		request.setCharacterEncoding("utf-8");
		
		 /*System.out.println(memberVo);
		 System.out.println(memberVo.getMem_Email());*/
		
		
			System.out.println("중복이아닙니다.");
			memberService.insertMember(memberVo);
			String content = memberVo.getMem_Email()
					+ "(님)의 계정 승인 확인 메일입니다. "
					+ "<a href='http://localhost:8181/pas/main/memberAuth?mem_Email="
					+ memberVo.getMem_Email() + "'>승인확인</a>";

			MimeMessage message = mailSender.createMimeMessage();

			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");
			messageHelper.setSubject("이메일 인증 요정확인 메일입니다.");
			messageHelper.setTo(memberVo.getMem_Email());
			messageHelper.setFrom("youliksna@naver.com");
			messageHelper.setText(content, true);
			mailSender.send(message);

			url = "/main/joinAuthForm";
		
		return url;
	}
	
	@RequestMapping(value = "/EmailCheck", method = RequestMethod.POST)
	@ResponseBody 
	public boolean EmailCheck(HttpSession session, MemberVo memberVo,Model model,
			HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException,
			MessagingException, SQLException {
		
		boolean result = false;
		
		String asd = request.getParameter("mem_Email");
		System.out.println(asd);
		
		System.out.println(memberVo);
		if(memberService.getMember(memberVo.getMem_Email()) != null ){
			result = false;
		}else{
			System.out.println("중복아님");
			result = true;
		}
		return result;
	}
	

	@RequestMapping(value = "/memberAuth", method = RequestMethod.GET)
	public String MemberAuth(String mem_Email) throws SQLException {
		String url = "/main/loginAuthForm";
		memberService.AuthMember(mem_Email);
		return url;
	}
	

	/**
	 * 내가 참여한 프로젝트 리스트와 프로젝트를 검색한 결과의 리스트를 뿌려주는 메소드
	 * 
	 * @param session : 로그인한 회원의 기본키인 Email을 받음
	 * @param model :  내가 참여한 프로젝트의 리스트를 뿌려주는 기능을 model에 넣음
	 * @param proj_Search : jsp파일로부터 입력받은 검색어를 가져옴 
	 * @param projectVo : 회원의email과 검색어를 projectVo 에 넣음
	 * @return : myProject.jsp 파일로 return
	 * @throws SQLException
	 */
	@RequestMapping("/myProject")
	public String MyProject(HttpSession session, Model model,
			@RequestParam(defaultValue = "")String proj_Search,
			ProjectVo projectVo) throws SQLException {
		String url = "main/myProject";
		
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		String mem_Email = memberVo.getMem_Email();
	
		projectVo.setMem_Email(mem_Email);
		List<ProjectVo> list = projectService.selectMyProjectListById(projectVo);
		if (session.getAttribute("proj_Num") != null) {
			session.removeAttribute("proj_Num");
			}

			if (session.getAttribute("joinProj") != null
				|| session.getAttribute("joinProj") != "null") {
				session.removeAttribute("joinProj");
			}
			if (session.getAttribute("joinProjectVo") != null
				|| session.getAttribute("joinProjectVo") != "null") {
				session.removeAttribute("joinProjectVo");
			}
		
		if (proj_Search == "" || proj_Search.equals(null)) {
		
			}else{
				projectVo.setProj_Search(proj_Search);
				
				}
				model.addAttribute("myProjectList", list);
				return url;
		}
//---------------------------------------------------------------------------------
//외부 프로젝트
	@RequestMapping("/otherProject")
	public String OtherProject(HttpSession session, Model model,
			@RequestParam(defaultValue = "")String proj_Search,ProjectVo projectVo,
			HttpServletResponse response)
			throws SQLException {

		
		String url = "/main/otherProject";
		List<ProjectVo> list = new ArrayList<ProjectVo>();
		
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		String mem_Email = memberVo.getMem_Email();
		projectVo.setMem_Email(mem_Email);
		
		if(proj_Search == "" || proj_Search.equals(null)){
			if (session.getAttribute("proj_Num") != null) {
				session.removeAttribute("proj_Num");
			}
			if (session.getAttribute("joinProj") != null
					|| session.getAttribute("joinProj") != "null") {
				session.removeAttribute("joinProj");
			}
			if (session.getAttribute("joinProjectVo") != null
					|| session.getAttribute("joinProjectVo") != "null") {
				session.removeAttribute("joinProjectVo");
			}

		}else{
			
			if (session.getAttribute("proj_Num") != null) {
				session.removeAttribute("proj_Num");
			}
			if (session.getAttribute("joinProj") != null
					|| session.getAttribute("joinProj") != "null") {
				session.removeAttribute("joinProj");
			}
			if (session.getAttribute("joinProjectVo") != null
					|| session.getAttribute("joinProjectVo") != "null") {
				session.removeAttribute("joinProjectVo");
			}
			
			projectVo.setProj_Search(proj_Search);
			
		}
		
		list = projectService.selectOtherProjectListById(projectVo);
		List<Integer> list2= projectService.selectInviteProjNumByMemEmail(memberVo.getMem_Email());
		model.addAttribute("otherProjectList", list);
		model.addAttribute("inviteList",list2);
		return url;
		
	}

	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String Mypage(HttpSession session, Model model) {
		String url = "main/myPage";
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		MemberVo memName = memberService.getMember(memberVo.getMem_Name());
		model.addAttribute("memName", memName);
		if (session.getAttribute("memName") != null) {
			session.removeAttribute("memName");
		}
		return url;
	}

	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> MypageUpdate(HttpSession session,
			Model model, @RequestBody Map<String, Object> map)
			throws SQLException {
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		
		String mem_Pass = (String) map.get("mem_Pass");
		if(mem_Pass ==""|| mem_Pass==null){
			memberVo.setMem_Pass(memberVo.getMem_Pass());
		}else{
			memberVo.setMem_Pass(mem_Pass);	
		}
		
		String mem_Phone = (String) map.get("mem_Phone");
		memberVo.setMem_Phone(mem_Phone);
		String url = "redirect:myProject";
		
		

		System.out.println(memberVo.toString());

		int a = memberService.updateMember(memberVo);
		System.out.println(a);
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("T", a);
		return m;
	}

	/*
	 * MyProject 모달
	 */

	@RequestMapping(value = "/mdlValue", method = RequestMethod.POST)
	public @ResponseBody List<MemPositionViewVo> mdlValue(
			@RequestBody Map<String, Object> map) throws SQLException {
		int proj_Num = (Integer) map.get("proj_Num");
		List<MemPositionViewVo> list = projectService
				.selectMemPositionViewListByProjNum(proj_Num);
		return list;
	}

	/*
	 * OtherProject 모달
	 */
	@RequestMapping(value = "/mdlOtherValue", method = RequestMethod.POST)
	public @ResponseBody List<MemPositionViewVo> mdlOtherValue(
			@RequestBody Map<String, Object> map) throws SQLException {
		int proj_Num = (Integer) map.get("proj_Num");
		List<MemPositionViewVo> list = projectService
				.selectMemPositionViewListByProjNum(proj_Num);
		return list;
	}

	@RequestMapping(value = "/checkApply", method = RequestMethod.POST)
	public @ResponseBody int mdlCheckApply(
			@RequestBody Map<String, Object> map, HttpSession session)
			throws SQLException {
		int proj_Num = (Integer) map.get("proj_Num");
		MemApplyViewVo memApplyViewVo = new MemApplyViewVo();
		memApplyViewVo.setProj_Num(proj_Num);
		memApplyViewVo.setMem_Email(((MemberVo) session
				.getAttribute("loginUser")).getMem_Email());
		int countMemApply = memberService
				.selectCountMemApplyView(memApplyViewVo);
		return countMemApply;
	}

	@RequestMapping(value = "/apply", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> mdlInvite(
			@RequestBody Map<String, Object> map, HttpSession session)
			throws SQLException {
		int proj_Num = (Integer) map.get("proj_Num");
		ApplyVo applyVo = new ApplyVo();
		ProjectJoinVo projectJoinVo = new ProjectJoinVo();
		MemApplyViewVo memApplyViewVo = new MemApplyViewVo();
		MemberVo member = (MemberVo) session.getAttribute("loginUser");

		applyVo.setMem_Email(member.getMem_Email());
		applyVo.setProj_Num(proj_Num);
		applyVo.setAlarm_Clsfct("1");

		projectJoinVo.setMem_Email(member.getMem_Email());
		projectJoinVo.setProj_Num(proj_Num);

		memApplyViewVo.setMem_Email(member.getMem_Email());
		memApplyViewVo.setProj_Num(proj_Num);
		memApplyViewVo = projectService.insertApply(applyVo, projectJoinVo,
				memApplyViewVo);
		String p_Mem_Email = memApplyViewVo.getP_Mem_Email();
		map.put("p_Mem_Email", p_Mem_Email);
		
		return map;
	}

	@RequestMapping(value = "/simpleMessage", method = RequestMethod.POST)
	public @ResponseBody int SimpleMessage(HttpSession session,
			HttpServletRequest request, String sendEmail) throws SQLException,
			UnsupportedEncodingException {

		request.setCharacterEncoding("utf-8");
		int result = -1;
		String pwd = (Math.random() * 100000) + 100000 + "";
		String content = sendEmail + "님 의 임시 비밀번호는 " + pwd + "입니다";
		SimpleMailMessage message = new SimpleMailMessage();

		MemberVo memberVo = (MemberVo) memberService.getMember(sendEmail);
		memberVo.setMem_Pass(pwd);
		if (memberVo != null) {
			memberService.extraPwd(memberVo);

			message.setText(content);
			message.setTo(sendEmail);
			message.setSubject("임시비밀번호 전송입니다.");
			message.setFrom("youliksna@naver.com");

			mailSender.send(message);
			result = 1;
		} else {
			result = -1;
		}
		return result;
	}

	@RequestMapping("/c8")
	public String c8(HttpSession session, Model model) {
		String url = "/main/c8";
		return url;
	}

	
	// 씨벌 왤케 안되냐 이건 아작스 씌벌

	@RequestMapping(value = "/c8", method = RequestMethod.POST)
	public String uploadByMultipartHttpServletRequest(MemberVo memberVo,
			MultipartHttpServletRequest request, Model model,
			HttpSession session) throws IOException {

		MultipartFile multipartFile = request.getFile("f");

		if (!multipartFile.isEmpty()) {
			/* String upload = request.getSession().Http */
			String upload = new HttpServletRequestWrapper(request)
					.getRealPath("/resources/upload");
			System.out.println(upload);
			File file = new File(upload, System.currentTimeMillis() + "$$"
					+ multipartFile.getOriginalFilename());

			multipartFile.transferTo(file);

			model.addAttribute("title", request.getParameter("title"));
			model.addAttribute("uploadPath", file.getAbsolutePath());
			// MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
			memberVo.setMem_Img(file.getName());
			memberVo.setMem_Email(((MemberVo) (session
					.getAttribute("loginUser"))).getMem_Email());
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser", memberVo);
			request.setAttribute("memberVo", memberVo);
			try {
				memberService.updateMemberImg(memberVo);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "main/c8";
		}
		System.out.println("null");
		return "main/c8";

	}
	
	@RequestMapping(value = "/profileImg", method = RequestMethod.GET)
	public String profileImg(HttpSession session, Model model) {
		String url = "main/profileImg";
		return url;
	}

	@RequestMapping(value = "/alramView", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> selectAlarmView(
			HttpSession session) throws SQLException {
		MemberVo member = (MemberVo) session.getAttribute("loginUser");
		String p_Mem_Email = member.getMem_Email();
		String mem_Email = member.getMem_Email();
		List<MemApplyViewVo> memApplyViewList = memberService
				.selectMemApplyViewByEmail(p_Mem_Email);
		List<ProjInviteViewVo> projInviteViewList = inviteService.selectInviteListByMemEmail(mem_Email);
		
		Map<String,Object> alarmMap = new HashMap<String, Object>();
		alarmMap.put("memApplyViewList", memApplyViewList);
		alarmMap.put("projInviteViewList", projInviteViewList);
		
		return alarmMap;
	}

	
	@RequestMapping(value = "/alarmCount", method = RequestMethod.GET)
	public @ResponseBody int selectAlarmCount(HttpSession session) throws SQLException{
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		int memApplyViewCount = memberService
				.selectCountMemApplyViewByEmail(memberVo.getMem_Email());
		return memApplyViewCount;

	}

	@RequestMapping(value = "/searchEmail", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> SearchEmail(
			@RequestBody Map<String, Object> map, Model model)
			throws SQLException {
		String Id = "";
		MemberVo memberVo = new MemberVo();
		memberVo.setMem_Name(map.get("sendName").toString());
		memberVo.setMem_Phone(map.get("sendPhone").toString());

		MemberVo memberVo1 = memberService.searchEmail(memberVo);
		if (memberVo1 != null) {

			Id = memberVo1.getMem_Email();
		}

		map.put("id", Id);
		return map;
	}

	@RequestMapping(value = "/agreeApply", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> agreeApplyAlarm(
			@RequestBody Map<String, Object> map,HttpSession session) throws SQLException {
		Map<String,Object> alarmMap = new HashMap<String, Object>();
		
		String apply_Num = (String) map.get("apply_Num");
		MemberVo member = (MemberVo) session.getAttribute("loginUser");
		String mem_Email = member.getMem_Email();
		
		List<MemApplyViewVo> memApplyViewList = memberService
				.updateApplyAgree(Integer.parseInt(apply_Num));
		List<ProjInviteViewVo> projInviteViewList = inviteService.selectInviteListByMemEmail(mem_Email);
		alarmMap.put("memApplyViewList", memApplyViewList);
		alarmMap.put("projInviteViewList", projInviteViewList);
		
		return alarmMap;
	}
	
	
	@RequestMapping(value = "/rejectApply", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> rejectApplyAlarm(
			@RequestBody Map<String, Object> map,HttpSession session) throws SQLException {
		Map<String,Object> alarmMap = new HashMap<String, Object>();
		String apply_Num = (String) map.get("apply_Num");
		MemberVo member = (MemberVo) session.getAttribute("loginUser");
		String mem_Email = member.getMem_Email();
		List<MemApplyViewVo> memApplyViewList = memberService.updateApplyReject(Integer.parseInt(apply_Num));
		List<ProjInviteViewVo> projInviteViewList = inviteService.selectInviteListByMemEmail(mem_Email);
		alarmMap.put("memApplyViewList", memApplyViewList);
		alarmMap.put("projInviteViewList", projInviteViewList);
		return alarmMap;
	}
	
	@RequestMapping(value = "/agreeInvite", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> agreeInviteAlarm(
			@RequestBody Map<String, Object> map,HttpSession session) throws SQLException {
		Map<String,Object> alarmMap = new HashMap<String, Object>();
		String invite_Num = (String) map.get("invite_Num");
		MemberVo member = (MemberVo) session.getAttribute("loginUser");
		String p_mem_Email = member.getMem_Email();
		
		List<MemApplyViewVo> memApplyViewList = memberService.selectMemApplyViewByEmail(p_mem_Email);
		List<ProjInviteViewVo> projInviteViewList = inviteService.updataInviteAgree(Integer.parseInt(invite_Num));
		alarmMap.put("memApplyViewList", memApplyViewList);
		alarmMap.put("projInviteViewList", projInviteViewList);
		return alarmMap;
	}

	@RequestMapping(value = "/rejectInvite", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> rejectInviteAlarm(
			@RequestBody Map<String, Object> map,HttpSession session) throws SQLException {
		Map<String,Object> alarmMap = new HashMap<String, Object>();
		String invite_Num = (String) map.get("invite_Num");
		MemberVo member = (MemberVo) session.getAttribute("loginUser");
		String p_Mem_Email = member.getMem_Email();
		List<MemApplyViewVo> memApplyViewList = memberService.selectMemApplyViewByEmail(p_Mem_Email);
		List<ProjInviteViewVo> projInviteViewList = inviteService.updataInviteReject(Integer.parseInt(invite_Num));
		
		alarmMap.put("memApplyViewList", memApplyViewList);
		alarmMap.put("projInviteViewList", projInviteViewList);
		return alarmMap;
	}
	
	
	@RequestMapping(value = "/createProject", method = RequestMethod.POST)
	public @ResponseBody int createProject(@RequestBody ProjectVo projectVo)
			throws SQLException {
		ProjectJoinVo projectJoinVo = new ProjectJoinVo();
		projectJoinVo.setMem_Email(projectVo.getMem_Email());
		projectJoinVo.setMem_Name(projectVo.getMem_Name());
		projectJoinVo.setMem_Img(projectVo.getMem_Img());
		projectJoinVo.setPjj_Per_Num(1);
		projectJoinVo.setPosition_Num(1);
		int proj_Num = projectService.insertProject(projectVo, projectJoinVo);
		return proj_Num;
	}
	
	
	
}
