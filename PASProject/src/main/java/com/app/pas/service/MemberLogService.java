package com.app.pas.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import com.app.pas.dao.MemberLogDao;
import com.app.pas.dto.MemberLogVo;
import com.app.pas.dto.ProjectVo;

public class MemberLogService {


	private MemberLogDao memberLogDao;
	
	
	public void setMemberLogDao(MemberLogDao memberLogDao) {
		this.memberLogDao = memberLogDao;
	}


	public void insertMemberLog(MemberLogVo memberLogVo)throws SQLException{
		memberLogDao.insertMemberLog(memberLogVo);
	}
	
}
