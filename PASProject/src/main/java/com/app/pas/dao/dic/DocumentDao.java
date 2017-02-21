package com.app.pas.dao.dic;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.dic.DocumentVo;

public interface DocumentDao {

	public void  insertDocument(DocumentVo documentVo) throws SQLException;
	public DocumentVo selectDocumentLastColumn() throws SQLException;
	public List<DocumentVo> selectDocumentListByProjNum(int proj_Num)throws SQLException; 
}
