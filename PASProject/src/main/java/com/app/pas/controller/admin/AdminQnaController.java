package com.app.pas.controller.admin;

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
import com.app.pas.dto.board.QnaBoardReplyVo;
import com.app.pas.dto.board.QnaBoardVo;
import com.app.pas.service.board.QnaBoardReplyService;
import com.app.pas.service.board.QnaBoardService;

@Controller
@RequestMapping("/admin")
public class AdminQnaController {

	@Autowired
	QnaBoardService qnaBoardService;

	@Autowired
	QnaBoardReplyService qnaBoardReplyService;

	// 관리자 Qna 리스트
	@RequestMapping("/AdminQnAList")
	public String QnaList(Model model,
			@RequestParam(value = "page", defaultValue = "1") String page)
			throws SQLException {
		String url = "admin/adminQnAList";
		int totalCount = 0;
		List<QnaBoardVo> qnaList = new ArrayList<QnaBoardVo>();

		qnaList = qnaBoardService.selectQnaBoardList();
		totalCount = qnaBoardService.QnaSelectTotalCount();

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
	//디테일
	@RequestMapping("/AdminQnADetail")
	public String detailQna(@RequestParam String qb_Article_Num, Model model) {
		String url = "admin/adminQnADetail";	
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
	
//댓글작성----------------------------------------------------------------------
	@RequestMapping(value="/InsertQnAReply", method=RequestMethod.POST)
	public String insertQnaBoardReply(QnaBoardReplyVo qnaBoardReplyVo,Model model){
		System.out.println("댓글작성중..");
		
		String qb_Article_Num = qnaBoardReplyVo.getQb_Article_Num()+"";
		
		String url = "redirect:AdminQnADetail?qb_Article_Num="+qb_Article_Num;
		
		qnaBoardReplyVo.setAdmin_Email("admin");
		System.out.println(qnaBoardReplyVo.toString());
		try {
			
			qnaBoardReplyService.insertQnaBoardReply(qnaBoardReplyVo, Integer.parseInt(qb_Article_Num));
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		System.out.println("답글하는즁");
		return url;
	
	}
//-------  댓글폼  ------------------------------------------------------------	
	@RequestMapping("/AdminQnAReplyForm")
	public String QnaWrite(@RequestParam String qb_Article_Num, Model model) throws NumberFormatException, SQLException {
		QnaBoardVo qnaBoardVo = qnaBoardService.selectQnaBoard(Integer
				.parseInt(qb_Article_Num));
		
		model.addAttribute("qnaBoardVo", qnaBoardVo);
		String url = "admin/adminQnAReplyForm";
		return url;
	}
//--------------------------------------------------------------------------
	@RequestMapping("/qnaDelete")
	public String deleteQna(HttpSession session, Model model) {
		String url = "";
		return url;
	}

	
	
	
}
