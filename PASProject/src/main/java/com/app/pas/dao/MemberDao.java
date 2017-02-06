package com.app.pas.dao;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.MemApplyViewVo;
import com.app.pas.dto.MemberVo;

public interface MemberDao {
	public List<MemberVo> selectMemberList()throws SQLException;
	public MemberVo selectMember(String mem_Email)throws SQLException;
	public void insertMember(MemberVo memberVo)throws SQLException;
	public void updateMember(MemberVo memberVo)throws SQLException;
	public void deleteMember(String mem_Email)throws SQLException;
	public void extraMemberPwd(MemberVo memberVo)throws SQLException;
	public void AuthMember(String mem_Email)throws SQLException;
	public int selectCountMemApplyView(MemApplyViewVo memApplyViewVo) throws SQLException;
	public MemApplyViewVo selectMemApplyViewByMemProj(MemApplyViewVo memApplyViewVo) throws SQLException;
	public List<MemApplyViewVo> selectMemApplyViewByEmail(String p_Mem_Email) throws SQLException;
	public void updateMemberImg(MemberVo memberVo) throws SQLException;
    public MemberVo searchEmail(MemberVo memberVo) throws SQLException;
}
