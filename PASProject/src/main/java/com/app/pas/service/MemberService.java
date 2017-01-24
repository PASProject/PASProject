package com.app.pas.service;

import java.sql.SQLException;

import com.app.pas.dao.MemberDao;
import com.app.pas.dto.MemberVo;

public class MemberService {

	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public MemberVo getMember(String memEmail){
		MemberVo member= null;
		try {
			member = memberDao.selectMember(memEmail);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
	}
	//비번찾는 메서드
	public int getPwd(String mem_Email){
		int result = 0;
		try {
			result=memberDao.selectMemberById(mem_Email);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
