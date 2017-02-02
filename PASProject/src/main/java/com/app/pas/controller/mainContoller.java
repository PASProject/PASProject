package com.app.pas.controller;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.pas.dto.MemPositionViewVo;
import com.app.pas.dto.MemberVo;
import com.app.pas.dto.ProjectVo;
import com.app.pas.service.MemberService;
import com.app.pas.service.ProjectService;

@Controller
@RequestMapping("/main")
public class mainContoller {

	@Resource(name = "mailSender")
	private MailSender mailSender;

	public void setMailSender(MailSender mailSender) {
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

		// 아이디 오류
		if (memberVo == null) {
			result = 0;

		} else {
			// 로그인 성공
			if (memberVo.getMem_Pass().equals(pwd)) {
				result = 1;
				session.setAttribute("loginUser", memberVo);
				// 비밀번호실패
			} else {
				result = 2;
			}

		}
		return result;
	}
	//가입처리
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(HttpSession session, Model model) {
		String url = "main/joinForm";
		return url;
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinMember(HttpSession session, MemberVo memberVo) {
		String url = "redirect:loginForm";
		System.out.println(memberVo);
		System.out.println(memberVo.getMem_Email());
		
		try {
			memberService.insertMember(memberVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return url;
	}

	@RequestMapping("/myProject")
	public String MyProject(HttpSession session, Model model) {
		String url = "main/myProject";
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		System.out.println(memberVo.getMem_Email() + "@@@@@@@@@@@@@@@@로그인이메일");
		try {
			List<ProjectVo> list = projectService.selectMyProjectById(memberVo.getMem_Email());
			model.addAttribute("myProjectList", list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return url;
	}

	@RequestMapping("/otherProject")
	public String OtherProject(HttpSession session, Model model) {
		String url = "/main/otherProject";

		List<ProjectVo> list;
		try {
			list = projectService.selectOtherProjectList();
			model.addAttribute("otherProjectList", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return url;
	}

	@RequestMapping("/mypageList")
	public String Mypage(HttpSession session, Model model) {
		String url = "";
		return url;
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
        if(memberVo!=null){
		memberService.extraPwd(memberVo);

		message.setText(content);
		message.setTo(sendEmail);
		message.setSubject("임시비밀번호 전송입니다.");
		message.setFrom("youliksna@naver.com");

		mailSender.send(message);
	     	result=1;
        }else{
            result=-1;	
        }
        
		return result;
	}

}
