package com.app.pas.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.pas.dto.MemberVo;
import com.app.pas.dto.dic.DocumentVo;
import com.app.pas.dto.dic.SpreadSheetVo;
import com.app.pas.service.MemberService;
import com.app.pas.service.ProjectService;
import com.app.pas.service.dic.DocumentService;
import com.app.pas.service.dic.SpreadSheetService;

@Controller
@RequestMapping("/project/work")
public class WorkController {
	HttpServletRequest request;

	@Autowired
	MemberService memberService;

	@Autowired
	ProjectService projectService;

	@Autowired
	SpreadSheetService spreadSheetService;
	@Autowired
	DocumentService documentService;
	
	@RequestMapping(value = "/workList", method = RequestMethod.GET)
	public String loginForm(HttpSession session, Model model) throws NumberFormatException, SQLException {
		String url = "/work/workList";
		String proj_Num = (String) session.getAttribute("joinProj");
		List<DocumentVo> documentList = documentService.selectDocumentListByProjNum(Integer.parseInt(proj_Num));
		model.addAttribute("documentList", documentList);
		return url;
	}
	@RequestMapping(value="createWorkForm")
	public String createWorkForm(HttpSession session){
		String url = "";
		url = "/work/createWorkForm";
		return url;
	}
	@RequestMapping(value="viewSpreadSheet",method = RequestMethod.GET)
	public String createSheet(HttpSession session) throws SQLException{
		String url = "/work/viewSpreadSheet";
		return url;
	}
	
	@RequestMapping(value="createSpreadSheet",method=RequestMethod.POST)
	public @ResponseBody boolean createSpreadSheet(@RequestBody String sp_Content,HttpSession session) throws SQLException{
		
		MemberVo memberVo = (MemberVo) session.getAttribute("loginUser");
		String proj_Num = (String) session.getAttribute("joinProj");
		DocumentVo documentVo = new DocumentVo();
		documentVo.setDoc_Kind(1);
		documentVo.setDoc_Name("SpreadSheet");
		documentVo.setMem_Email(memberVo.getMem_Email());
		documentVo.setMem_Name(memberVo.getMem_Name());
		documentVo.setProj_Num(Integer.parseInt(proj_Num));
		documentVo.setDoc_Img("excel.png");
		SpreadSheetVo spreadSheetVo = new SpreadSheetVo();
		spreadSheetVo.setSp_Content(sp_Content);
		boolean flag = documentService.insertDictionarySpreadSeet(documentVo,spreadSheetVo);
		return flag;
		
	}
	
	@RequestMapping("deleteDocument")
	public String deleteDocument(DocumentVo documentVo)throws SQLException{
		String url ="redirect:workList";
		boolean flag = documentService.deleteDocumentByDocNum(documentVo);
		if(!flag){
			url = "";
		}
		return url;
	}
	
	public String selectDocument(DocumentVo documentVo) throws SQLException{
		String url = "redirect:";
		return url;
	}


}
