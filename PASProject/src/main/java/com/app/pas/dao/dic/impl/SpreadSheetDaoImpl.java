package com.app.pas.dao.dic.impl;

import java.sql.SQLException;

import com.app.pas.dao.dic.SpreadSheetDao;
import com.app.pas.dto.dic.SpreadSheetVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class SpreadSheetDaoImpl implements SpreadSheetDao {
	
	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}
	@Override
	public int insertSpreadSheet(SpreadSheetVo spreadSheetVo)
			throws SQLException {
		int result = (Integer) client.update("insertSpreadSheet", spreadSheetVo);
		return result;
	}

}
