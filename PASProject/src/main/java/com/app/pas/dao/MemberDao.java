package com.app.pas.dao;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.MemberVo;

public interface MemberDao {
	public List<MemberVo> selectMemberList()throws SQLException;
	public MemberVo selectMember(String mem_Email)throws SQLException;
	public void insertMember(MemberVo memberVo)throws SQLException;
	public void updateMember(MemberVo memberVo)throws SQLException;
	public void deleteMember(String mem_Email)throws SQLException;
}
