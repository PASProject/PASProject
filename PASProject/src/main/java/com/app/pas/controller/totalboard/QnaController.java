package com.app.pas.controller.totalboard;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@RequestMapping("/qnaList")
	public String QnaList(HttpSession session, Model model) {
		String url = "";
		return url;

	}

	@RequestMapping("/qnaInsert")
	public String insertQna(HttpSession session, Model model) {
		String url = "";
		return url;

	}

	@RequestMapping("/qnaUpdate")
	public String updateQna(HttpSession session, Model model) {
		String url = "";
		return url;

	}
	
	@RequestMapping("/qnaWrite")
	public String writeQna(HttpSession session,Model model){
		String url="";
		return url;
				
	}

	@RequestMapping("/qnaDelete")
	public String deleteQna(HttpSession session, Model model) {
		String url = "";
		return url;
	}

}
