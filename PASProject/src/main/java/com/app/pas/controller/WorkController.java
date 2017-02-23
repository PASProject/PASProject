package com.app.pas.controller;

import java.sql.SQLException;
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
	
	@RequestMapping(value="spreadSheetForm",method = RequestMethod.GET)
	public String createSheet(HttpSession session) throws SQLException{
		String url = "/work/spreadSheetForm";
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
	
	@RequestMapping("selectDocument")
	public String selectDocument(DocumentVo documentVo,Model model) throws SQLException{
		
		String url = "";
		DocumentVo selectVo = documentService.selectDocumentByDocNum(documentVo.getDoc_Num());
		if(selectVo ==null){ return "redirect:workList"; }
			
		if(selectVo.getDoc_Kind()==1){
			SpreadSheetVo spreadSheetVo = spreadSheetService.selectSpreadSheetByDocNum(documentVo.getDoc_Num());
			model.addAttribute("spreadSheetVo", spreadSheetVo);
			url = "/work/viewSpreadSheet";
		}
		return url;
	}
	
	
	
	@RequestMapping(value="downloadFile",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> downloadFile(@RequestBody DocumentVo documentVo) throws SQLException{
		DocumentVo selectVo = documentService.selectDocumentByDocNum(documentVo.getDoc_Num());
		
		Map<String,Object> downloadFileMap = new HashMap<String, Object>();
		
		if(selectVo.getDoc_Kind()==1){
			SpreadSheetVo spreadSheetVo = spreadSheetService.selectSpreadSheetByDocNum(documentVo.getDoc_Num());
			downloadFileMap.put("data", spreadSheetVo.getSp_Content());
		}
		
		
		return downloadFileMap;
	}
	@RequestMapping(value="saveFile",method = RequestMethod.POST)
	public @ResponseBody boolean saveFile(@RequestBody Map<String,Object> map ) throws SQLException{
		String sp_Content = (String) map.get("sheet");
		String doc_Num = (String) map.get("doc_Num");
		SpreadSheetVo spreadSheetVo = new SpreadSheetVo();
		spreadSheetVo.setDoc_Num(Integer.parseInt(doc_Num));
		spreadSheetVo.setSp_Content(sp_Content);
		boolean flag = spreadSheetService.updateSpreadSheet(spreadSheetVo);
		return flag;
	}
	
	@RequestMapping(value="preViewFile",method = RequestMethod.POST)
	public @ResponseBody SpreadSheetVo preViewFile(@RequestBody DocumentVo documentVo, HttpSession session) throws SQLException{
		SpreadSheetVo spreadSheetVo = new SpreadSheetVo();
		spreadSheetVo.setDoc_Num(documentVo.getDoc_Num());
		spreadSheetVo = spreadSheetService.selectSpreadSheetByDocNum(documentVo.getDoc_Num());
		return spreadSheetVo;
	}

}
