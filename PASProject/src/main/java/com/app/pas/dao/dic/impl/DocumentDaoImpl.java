package com.app.pas.dao.dic.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.dic.DocumentDao;
import com.app.pas.dto.dic.DocumentVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class DocumentDaoImpl implements DocumentDao{
	private SqlMapClient client;

	public void setClient(SqlMapClient client) {
		this.client = client;
	}
	@Override
	public void insertDocument(DocumentVo documentVo) throws SQLException {
		client.update("insertDocument",documentVo);
	}
	@Override
	public DocumentVo selectDocumentLastColumn() throws SQLException {
		DocumentVo documentVo = (DocumentVo) client.queryForObject("selectDocumentLastColumn",null);
		return documentVo;
	}
	@Override
	public List<DocumentVo> selectDocumentListByProjNum(int proj_Num)
			throws SQLException {
		List<DocumentVo> list = client.queryForList("selectDocumentListByProjNum",proj_Num);
		return list;
	}

}
