package com.app.pas.dao.board;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.board.TotalNoticeVo;

public interface TotalNoticeDao {
	
	public List<TotalNoticeVo> selectTotalNoticeList() throws SQLException;
	public TotalNoticeVo selectTotalNotice(int ttnotice_Num) throws SQLException;
	public void insertTotalNotice(TotalNoticeVo totalNoticeVo) throws SQLException;
	public void updateTotalNotice(TotalNoticeVo totalNoticeVo )throws SQLException;
	public void deleteTotalNotice(int ttnotice_Num)throws SQLException;

	
	
	
	
	
}
