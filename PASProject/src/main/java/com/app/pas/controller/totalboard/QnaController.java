package com.app.pas.controller.totalboard;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.app.pas.dao.board.QnaBoardDao;
import com.app.pas.dto.board.QnaBoardReplyVo;
import com.app.pas.dto.board.QnaBoardVo;
import com.app.pas.service.board.QnaBoardReplyService;
import com.app.pas.service.board.QnaBoardService;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	QnaBoardService qnaBoardService;
	
	@Autowired
	QnaBoardReplyService qnaBoardReplyService;

	// qnaList
	@RequestMapping("/QnAList")
	public String QnaList(Model model,
			@RequestParam(value = "page", defaultValue = "1") String page) {
		String url = "qna/QnAList";
		int totalCount = 0;
		List<QnaBoardVo> qnaList = new ArrayList<QnaBoardVo>();
		try {
			qnaList = qnaBoardService.selectQnaBoardList();
			System.out.println("qnaboardList >> > > : " + qnaList);
			totalCount = qnaBoardService.QnaSelectTotalCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 페이징처리
		if (page.equals(null) || page == "") {
			page = "" + 1;
		}
		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(page));
		paging.setPageSize(5);
		paging.setTotalCount(totalCount);

		model.addAttribute("paging", paging);
		model.addAttribute("qnaList", qnaList);

		return url;
	}

	// qna글쓰기
	@RequestMapping("/QnAWrite")
	public String writeQna(Model model, QnaBoardVo qnaBoardVo) {
		String url = "qna/QnAWrite";
		return url;

	}

	@RequestMapping(value = "/insertQnABoard", method = RequestMethod.POST)
	public String insertQna(HttpSession session, Model model,
			QnaBoardVo qnaBoardVo) {
		String url = "redirect:QnAList";
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

	@RequestMapping(value = "/QnAUpdate", method = RequestMethod.GET)
	public String updateQnaForm(@RequestParam String qb_Article_Num,
			HttpSession session, Model model) {
		String url = "qna/QnAUpdate";

		QnaBoardVo qnaBoardVo;
		try {
			qnaBoardVo = qnaBoardService.selectQnaBoard(Integer
					.parseInt(qb_Article_Num));
			model.addAttribute("QnABoardVo", qnaBoardVo);

		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;

	}

	@RequestMapping(value = "/QnAUpdate", method = RequestMethod.POST)
	public String updateQnaBoard(QnaBoardVo qnaBoardVo) {
		String url = "redirect:QnAList";

		try {
			qnaBoardService.updateQnaBoard(qnaBoardVo);

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return url;
	}

	@RequestMapping("/QnADelete")
	public String deleteQna(HttpSession session, Model model) {
		String url = "";
		return url;
	}

	// 디테일 , 리플
	@RequestMapping("/QnADetail")
	public String detailQna(@RequestParam String qb_Article_Num, Model model) {
		String url = "qna/QnADetail";
		
		try {
			QnaBoardVo qnaBoardVo = qnaBoardService.selectQnaBoard(Integer
					.parseInt(qb_Article_Num));
			QnaBoardReplyVo qnaBoardReplyVo = qnaBoardReplyService.selectQnaReply(Integer.parseInt(qb_Article_Num));
			
			model.addAttribute("qnaBoardReplyVo", qnaBoardReplyVo);
			model.addAttribute("qnaBoardVo", qnaBoardVo);
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return url;
	}
	
//댓글작성
	@RequestMapping("/InsertQnAReply")
	public String insertQnaBoardReply(String qb_Article_Num,String qb_Reply_Content,Model model,
			QnaBoardReplyVo qnaBoardReplyVo){
		String url="qna/QnADetail";
		try {
			qnaBoardReplyVo.setAdmin_Email("admin");
			qnaBoardReplyVo.setQb_Article_Num(Integer.parseInt(qb_Article_Num));
			qnaBoardReplyVo.setQb_Reply_Content(qb_Reply_Content);
	
			System.out.println("댓글연습중 : " + qnaBoardReplyVo);
			qnaBoardReplyService.insertQnaBoardReply(qnaBoardReplyVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return url;
	}

	// 글 삭제
	@RequestMapping(value = "/QnADelete", method = RequestMethod.POST)
	public String deleteQnaBoard(String qb_Article_Num) {
		String url = "redirect:QnAList";
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
