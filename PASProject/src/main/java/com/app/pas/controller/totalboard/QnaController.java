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

import com.app.pas.dao.board.QnaBoardDao;
import com.app.pas.dto.board.QnaBoardVo;
import com.app.pas.service.board.QnaBoardService;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	QnaBoardService qnaBoardService;

	@RequestMapping("/qnaList")
	public String QnaList(Model model) {
		String url = "qna/QnAList";
		List<QnaBoardVo> qnaboardList;
		try {
			qnaboardList = qnaBoardService.selectQnaBoardList();
			model.addAttribute("qnaboardList", qnaboardList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		}

		return url;
	}

	@RequestMapping("/qnaWrite")
	public String writeQna(Model model, QnaBoardVo qnaBoardVo) {
		String url = "qna/QnAWrite";
		return url;

	}

	@RequestMapping(value = "/insertQnaBoard", method = RequestMethod.POST)
	public String insertQna(HttpSession session, Model model,
			QnaBoardVo qnaBoardVo) {
		String url = "redirect:qnaList";
		qnaBoardVo.setMem_Email("abc@naver.com");
		qnaBoardVo.setQb_Password("임시Password");
		try {
			qnaBoardService.insertQnaBoard(qnaBoardVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return url;

	}
	@RequestMapping(value="/qnaUpdate",method=RequestMethod.GET)
	public String updateQnaForm(@RequestParam String qb_Article_Num,
			HttpSession session, Model model) {
		String url = "qna/QnAUpdate";

		QnaBoardVo qnaBoardVo;
		try {
			qnaBoardVo = qnaBoardService.selectQnaBoard(Integer
					.parseInt(qb_Article_Num));
			model.addAttribute("qnaBoardVo", qnaBoardVo);
		
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;

	}
	
	@RequestMapping(value="/qnaUpdate", method=RequestMethod.POST)
	public String updateQnaBoard(QnaBoardVo qnaBoardVo){
		String url="redirect:qnaList";
		
		try {
			qnaBoardService.updateQnaBoard(qnaBoardVo);
			
		} catch (SQLException e) {
	
			e.printStackTrace();
		}
		return url;
	}
	
	
//////////////////////////////////////////////////////////
	@RequestMapping("/qnaDelete")
	public String deleteQna(HttpSession session, Model model) {
		String url = "";
		return url;
	}

//////////////////////////////////////////////////////////
	@RequestMapping("/QnADetail")
	public String detailQna(@RequestParam String qb_Article_Num, Model model) {
		String url = "qna/QnADetail";
		try {
			QnaBoardVo qnaBoardVo = qnaBoardService.selectQnaBoard(Integer
					.parseInt(qb_Article_Num));
			model.addAttribute("qnaBoardVo", qnaBoardVo);
		
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return url;
	}
	//////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="/qnaDelete", method=RequestMethod.POST)
	public String deleteQnaBoard (String qb_Article_Num){
		String url="redirect:qnaList";
		System.out.println("삭제하는중 : 아티클넘버" + qb_Article_Num);
		try {
			qnaBoardService.deleteQnaBoard(Integer.parseInt(qb_Article_Num));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return url;

	}
	

}
