package com.app.pas.controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
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

import com.app.pas.dto.MemPositionViewVo;
import com.app.pas.dto.MemberVo;
import com.app.pas.dto.ProjectVo;
import com.app.pas.service.MemberService;
import com.app.pas.service.ProjectService;

@Controller
@RequestMapping("/main")
public class mainContoller {

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

		// 아이디 오류
		if (memberVo == null) {
			result = 0;

		} else {
			// 로그인 성공
			if (memberVo.getMem_Pass().equals(pwd)) {
				/*result = 1;*/
				/*session.setAttribute("loginUser", memberVo);*/
				// 비밀번호실패
				if(memberVo.getMem_Approve()=="y"){
					result=1;
				}else{
					result=3;
				}
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
	public String joinMember(HttpSession session, MemberVo memberVo,HttpServletRequest request) throws UnsupportedEncodingException, MessagingException {
		String url = "redirect:/index";
		request.setCharacterEncoding("utf-8");
		
		/*System.out.println(memberVo);
		System.out.println(memberVo.getMem_Email());*/

		try {
			memberService.insertMember(memberVo);
			String content = memberVo.getMem_Email()+"(님)의 계정 승인 확인 메일입니다. "
					+ "<a href='http://localhost:8181/pas/main/loginAuthForm?mem_Email="+memberVo.getMem_Email()+"'>승인확인</a>"  ;
			 
			
			MimeMessage message = mailSender.createMimeMessage();
			
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            messageHelper.setSubject("이메일 인증 요정확인 메일입니다.");
            messageHelper.setTo(memberVo.getMem_Email());
            messageHelper.setFrom("youliksna@naver.com");
            messageHelper.setText(content, true);
            mailSender.send(message);
			
			url="/main/joinAuthForm";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return url;
	}
	
	@RequestMapping("/loginAuthForm")
	public String LoginAuthForm(HttpServletRequest request,String mem_Email){
		String url="/main/loginAuthForm";
		MemberVo memberVo =memberService.getMember(mem_Email);
		request.setAttribute("memberVo", memberVo);
		
		return url;
		
		
	}
	
	@RequestMapping(value="/memberAuth",method=RequestMethod.POST)
	public @ResponseBody int MemberAuth(@RequestBody MemberVo memberVo) throws SQLException{
		int result= 1;
		memberService.AuthMember(memberVo.getMem_Email());
		return 1;
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
	
	@RequestMapping(value="/mdlValue",method = RequestMethod.POST)
	public @ResponseBody List<MemPositionViewVo> aa(@RequestBody Map<String,Object> map) throws SQLException{
		int proj_Num =(Integer) map.get("proj_Num");
		List<MemPositionViewVo> list = projectService.selectMemPositionViewListByProjNum(proj_Num);
		return list;
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
	

	// 파일업로드 연습
	private String uploadPath = "resources/upload";

	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public String uploadForm() {
		return "main/uploadForm";
	}

	@RequestMapping(value = "/yourProject", method = RequestMethod.POST)
	public String uploadByMultipartFile(
			@RequestParam("f") MultipartFile multipartFile,
			@RequestParam("title") String title, Model model,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		request.setCharacterEncoding("utf-8");
		if (!multipartFile.isEmpty()) {

			String upload = request.getSession().getServletContext()
					.getRealPath(uploadPath);
			/*
			 * uploadPath =
			 * request.getSession().getServletContext().getRealPath(uploadPath);
			 */

			File file = new File(upload, System.currentTimeMillis() + "$$"
					+ multipartFile.getOriginalFilename());// 파일명 저장

			long fileSizeLimit = 1024 * 1024 * 5;

			if (multipartFile.getSize() > fileSizeLimit) {
				System.out.println("파일 용량이 너무 큽니다.");

				response.setCharacterEncoding("utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('파일 용량은 5MB 이하 입니다.');history.go(-1);</script>");
				return null;
			}

			multipartFile.transferTo(file); // 이곳에서 파일저장

			model.addAttribute("title", title);
			model.addAttribute("fileName", multipartFile.getOriginalFilename());
			model.addAttribute("uploadPath", file.getAbsolutePath());
			return "main/yourProject";
		}
		return "upload/noUploadFile";
	}

}
