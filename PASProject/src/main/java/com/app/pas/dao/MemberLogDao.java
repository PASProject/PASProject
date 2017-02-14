package com.app.pas.dao;

import java.sql.SQLException;

import com.app.pas.dto.MemberLogVo;

public interface MemberLogDao {
	public void insertMemberLog(MemberLogVo memberLogVo) throws SQLException;
}
