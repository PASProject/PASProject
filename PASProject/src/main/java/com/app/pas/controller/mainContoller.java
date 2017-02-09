package com.app.pas.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.app.pas.dto.ApplyVo;
import com.app.pas.dto.MemApplyViewVo;
import com.app.pas.dto.MemPositionViewVo;
import com.app.pas.dto.MemberVo;
import com.app.pas.dto.ProjectJoinVo;
import com.app.pas.dto.ProjectVo;
import com.app.pas.service.MemberService;
import com.app.pas.service.ProjectService;

@Controller
@RequestMapping("/main")
public class mainContoller{
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

	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(HttpSession session, Model model) {
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
		if(session.getAttribute("joinProj")!=null&&session.getAttribute("joinProj")!="null"){
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
			HttpServletRequest request) throws UnsupportedEncodingException,
			MessagingException {
		String url = "redirect:/index";
		request.setCharacterEncoding("utf-8");

		/*
		 * System.out.println(memberVo);
		 * System.out.println(memberVo.getMem_Email());
		 */

		try {
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return url;
	}

	@RequestMapping(value = "/memberAuth", method = RequestMethod.GET)
	public String MemberAuth(String mem_Email) throws SQLException {
		String url = "/main/loginAuthForm";
		memberService.AuthMember(mem_Email);
		return url;
	}

	@RequestMapping("/myProject")
	public String MyProject(HttpSession session, Model model)
			throws SQLException {
		String url = "main/myProject";
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		System.out.println(memberVo.getMem_Email() + "@@@@@@@@@@@@@@@@로그인이메일");
		List<ProjectVo> list = projectService.selectMyProjectListById(memberVo
				.getMem_Email());
		model.addAttribute("myProjectList", list);
		if (session.getAttribute("proj_Num") != null) {
			session.removeAttribute("proj_Num");
		}

		return url;
	}

	@RequestMapping("/otherProject")
	public String OtherProject(HttpSession session, Model model)
			throws SQLException {
		String url = "/main/otherProject";

		List<ProjectVo> list;
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		list = projectService.selectOtherProjectListById(memberVo
				.getMem_Email());
		model.addAttribute("otherProjectList", list);
		if (session.getAttribute("proj_Num") != null) {
			session.removeAttribute("proj_Num");
		}

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
		String mem_Phone = (String) map.get("mem_Phone");
		String url = "redirect:myProject";
		memberVo.setMem_Pass(mem_Pass);
		memberVo.setMem_Phone(mem_Phone);

		System.out.println(memberVo.toString());

		/*
		 * memberVo.setMem_Email("mem_Meai
		 */int a = memberService.updateMember(memberVo);
		System.out.println(a);
		Map<String,Object> m = new HashMap<String, Object>();
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

	private String savePath = "resources/upload";

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
	public @ResponseBody List<MemApplyViewVo> selectAlarmView(
			HttpSession session) throws SQLException {
		MemberVo member = (MemberVo) session.getAttribute("loginUser");
		String p_Mem_Email = member.getMem_Email();
		List<MemApplyViewVo> memApplyViewList = memberService
				.selectMemApplyViewByEmail(p_Mem_Email);
		return memApplyViewList;
	}
	
	/*@RequestMapping(value = "/alarmCount", method = RequestMethod.GET)
	public @ResponseBody int selectAlarmCount(HttpSession session) throws SQLException{
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		int memApplyViewCount = memberService.selectCountMemApplyViewByEmail(memberVo.getMem_Email());
		return memApplyViewCount;
	}*/
	
	@RequestMapping(value="/searchEmail",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> SearchEmail(@RequestBody Map<String,Object> map,Model model) throws SQLException{
		String Id="";
		MemberVo memberVo = new MemberVo();
		memberVo.setMem_Name(map.get("sendName").toString());
		memberVo.setMem_Phone(map.get("sendPhone").toString());
		
		MemberVo memberVo1 =memberService.searchEmail(memberVo);
		System.out.println(memberVo1+"이건 멤멤!!");
		if(memberVo1 !=null){
			
			Id=memberVo1.getMem_Email();
			}
		System.out.println(Id+"이건아이디!!!!!");
		
		map.put("id", Id);
		return map;
	}

	@RequestMapping(value="/agree",method = RequestMethod.POST)
	public @ResponseBody List<MemApplyViewVo> agreeAlarm(@RequestBody Map<String,Object> map) throws SQLException{
		String apply_Num = (String) map.get("apply_Num");
		List<MemApplyViewVo> memApplyViewList =  memberService.updateApplyAgree(Integer.parseInt(apply_Num));
		return memApplyViewList;
	}
	
	@RequestMapping(value="/reject",method = RequestMethod.POST)
	public @ResponseBody List<MemApplyViewVo> rejectAlarm(@RequestBody Map<String,Object> map) throws SQLException{
		String apply_Num = (String)map.get("apply_Num");
		List<MemApplyViewVo> memApplyViewList= memberService.updateApplyReject(Integer.parseInt(apply_Num));
		return memApplyViewList;
	}
	
	@RequestMapping(value= "/createProject",method = RequestMethod.POST)
	public @ResponseBody int createProject(@RequestBody ProjectVo projectVo) throws SQLException{
		ProjectJoinVo projectJoinVo = new ProjectJoinVo();
		projectJoinVo.setMem_Email(projectVo.getMem_Email());
		projectJoinVo.setMem_Name(projectVo.getMem_Name());
		projectJoinVo.setPjj_Per_Num(1);
		projectJoinVo.setPosition_Num(1);
		int proj_Num = projectService.insertProject(projectVo,projectJoinVo);
		return proj_Num;
	}
	
	
}
