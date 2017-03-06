package com.app.pas.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.pas.dto.BoardJoinVo;
import com.app.pas.dto.BoardManagementVo;
import com.app.pas.dto.MemPositionViewVo;
import com.app.pas.dto.MemberVo;
import com.app.pas.service.BoardJoinService;
import com.app.pas.service.BoardManagementService;
import com.app.pas.service.MemberService;



@Controller
@RequestMapping("/project")
public class BoardManagementController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	BoardManagementService boardManagementService;
	@Autowired
	BoardJoinService boardJoinService;
	
	@RequestMapping("pmBoardManagementList")
	public String boardManagementList(HttpSession session,Model model) throws SQLException{
		String url = "project/pmBoardManagement";
		int proj_Num = Integer.parseInt((String) session.getAttribute("joinProj"));
		MemPositionViewVo memPositionView = new MemPositionViewVo();
		memPositionView.setPjj_Per_Num(1);
		memPositionView.setProj_Num(proj_Num);
		List<MemPositionViewVo> memberList = memberService.selectMemberListByProj(memPositionView);
		model.addAttribute("memberList",memberList);
		return url;
	}
	
	@RequestMapping(value= "insertBoard",method = RequestMethod.POST)
	public @ResponseBody boolean insertBoard(HttpSession session,@RequestBody BoardManagementVo boardManagementVo) throws SQLException{
		int proj_Num = Integer.parseInt((String) session.getAttribute("joinProj"));
		MemberVo member = (MemberVo) session.getAttribute("loginUser");
		boardManagementVo.setBm_Mem_Name(member.getMem_Name());
		boardManagementVo.setBm_Mem_Email(member.getMem_Email());
		boardManagementVo.setBm_Proj_Num(proj_Num);
		System.out.println(boardManagementVo+"@@@@@@@@@@@@@@@@");
		boolean flag =boardManagementService.insertBoardManagement(boardManagementVo);
		return flag;
	}
	
	@RequestMapping(value="insertBoardJoin",method = RequestMethod.POST)
	public @ResponseBody boolean insertBoardJoin(@RequestBody BoardJoinVo boardJoinVo,HttpSession session) throws SQLException{
		MemberVo member = (MemberVo) session.getAttribute("loginUser");
		BoardManagementVo vo = boardManagementService.selectLastColumn(member.getMem_Email());
		boardJoinVo.setBm_Num(vo.getBm_Num());
		boardJoinService.insertBoardJoinDao(boardJoinVo);
		return true;
	}
	
	@RequestMapping(value="boardManagementList",method = RequestMethod.POST)
	public @ResponseBody List<BoardManagementVo> boardManagementList(HttpSession session) throws SQLException{
		int proj_Num = Integer.parseInt((String) session.getAttribute("joinProj"));
		List<BoardManagementVo> list = boardManagementService.selectBoardList(proj_Num);
		return list;
	}
	
	@RequestMapping(value="boardJoinList" ,method = RequestMethod.POST)
	public @ResponseBody List<BoardJoinVo> boardJoinList(HttpSession session,@RequestBody BoardJoinVo boardJoinVo) throws SQLException{
		List<BoardJoinVo> list = boardJoinService.selectBoardJoinList(boardJoinVo.getBm_Num());
		return list;
	}
	
	@RequestMapping(value="deleteBoard",method = RequestMethod.GET)
	public String deleteBoard(@RequestParam String bm_Num) throws SQLException{
		String url="redirect:pmBoardManagementList";
		boardManagementService.deleteBoardManagement(Integer.parseInt(bm_Num));
		return url;
	}
	
	@RequestMapping(value="updateBoardJoin", method = RequestMethod.POST)
	public @ResponseBody boolean updateBoardJoin(@RequestBody BoardJoinVo boardJoinVo )throws SQLException{
		boolean flag = true;
		boardJoinService.updateBoardJoin(boardJoinVo);
		return flag;
	}
}
