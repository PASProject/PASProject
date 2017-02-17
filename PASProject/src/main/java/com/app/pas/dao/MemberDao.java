package com.app.pas.dao;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.MemApplyViewVo;
import com.app.pas.dto.MemPositionViewVo;
import com.app.pas.dto.MemberCommandVo;
import com.app.pas.dto.MemberVo;

public interface MemberDao {
	public List<MemberVo> selectMemberList()throws SQLException;
	public MemberVo selectMember(String mem_Email)throws SQLException;
	public void insertMember(MemberVo memberVo)throws SQLException;
	public int updateMember(MemberVo memberVo)throws SQLException;
	public void deleteMember(String mem_Email)throws SQLException;
	public void extraMemberPwd(MemberVo memberVo)throws SQLException;
	public void AuthMember(String mem_Email)throws SQLException;
	public int selectCountMemApplyView(MemApplyViewVo memApplyViewVo) throws SQLException;
	public MemApplyViewVo selectMemApplyViewByMemProj(MemApplyViewVo memApplyViewVo) throws SQLException;
	public List<MemApplyViewVo> selectMemApplyViewByEmail(String p_Mem_Email) throws SQLException;
	public void updateMemberImg(MemberVo memberVo) throws SQLException;
    public MemberVo searchEmail(MemberVo memberVo) throws SQLException;
	public void updateApplyCommitCheck(int apply_Num) throws SQLException;
	public MemApplyViewVo selectMemApplyViewByApplyNum(int apply_Num) throws SQLException;
	public void deleteApplyViewByApplyNum(int apply_Num) throws SQLException;
	public List<MemPositionViewVo> selectMemberListByProj(MemPositionViewVo memPoistionViewVo)throws SQLException;
    public MemPositionViewVo selectMemberPosition(MemPositionViewVo memPositionViewVo)throws SQLException;
    public int selectMemberTotalCount() throws SQLException;
    public int selectCountMemApplyViewByEmail(String p_Mem_Email) throws SQLException;
    public List<MemberCommandVo> selectMemberEmailList(int proj_Num)throws SQLException;
    public String selectMemberPhone(String mem_Email)throws SQLException;
    public int selectOtherProjectCount(String mem_Email) throws SQLException;

}
