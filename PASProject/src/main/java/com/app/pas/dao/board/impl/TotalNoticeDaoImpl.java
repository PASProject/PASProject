package com.app.pas.dao.board.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.board.TotalNoticeDao;
import com.app.pas.dto.board.TotalNoticeVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class TotalNoticeDaoImpl implements TotalNoticeDao {
	private SqlMapClient client;
	
	public void setClient (SqlMapClient client){
		this.client = client;
	}
	
	
	@Override
	public List<TotalNoticeVo> selectTotalNoticeList() throws SQLException {
		List<TotalNoticeVo> list = client.queryForList("selectTotalNoticeList");
		return list;
	}
//디테일
	@Override
	public TotalNoticeVo selectTotalNoticeBoard(int ttnotice_Num) throws SQLException {
		TotalNoticeVo totalNoticeVo = (TotalNoticeVo)client.queryForObject("selectTotalNoticeBoard",ttnotice_Num);
		return totalNoticeVo;
	}

	@Override
	public void insertTotalNotice(TotalNoticeVo totalNoticeVo)
			throws SQLException {
		client.insert("insertTotalNotice",totalNoticeVo);
	}

	@Override
	public void updateTotalNotice(TotalNoticeVo totalNoticeVo)
			throws SQLException {
		client.update("updateTotalNotice",totalNoticeVo);
	}

	@Override
	public void deleteTotalNotice(int ttnotice_Num) throws SQLException {
		client.delete("deleteTotalNotice",ttnotice_Num);
		
	}
	

	
	
	

}
