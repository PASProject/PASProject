package com.app.pas.service.dic;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.dic.DocumentDao;
import com.app.pas.dao.dic.SpreadSheetDao;
import com.app.pas.dto.dic.DocumentVo;
import com.app.pas.dto.dic.SpreadSheetVo;

public class DocumentService {

	private DocumentDao documentDao;
	private SpreadSheetDao spreadSheetDao;
	
	
	public void setSpreadSheetDao(SpreadSheetDao spreadSheetDao) {
		this.spreadSheetDao = spreadSheetDao;
	}

	
	
	public void setDocumentDao(DocumentDao documentDao) {
		this.documentDao = documentDao;
	}



	public boolean insertDictionarySpreadSeet(DocumentVo documentVo,SpreadSheetVo spreadSheetVo) throws SQLException{
		documentDao.insertDocument(documentVo);
		DocumentVo selectLastVo = documentDao.selectDocumentLastColumn();
		spreadSheetVo.setDoc_Num(selectLastVo.getDoc_Num());
		int result = spreadSheetDao.insertSpreadSheet(spreadSheetVo);
		boolean flag = false;
		if(result==1){
			flag = true;
		}
		return flag;
	}
	
	public List<DocumentVo> selectDocumentListByProjNum(int proj_Num)throws SQLException{
		List<DocumentVo> list = documentDao.selectDocumentListByProjNum(proj_Num);
		return list;
	}
	
	public boolean deleteDocumentByDocNum(DocumentVo documentVo) throws SQLException{
		int result = documentDao.deleteDocumentByDocNum(documentVo.getDoc_Num());
		boolean flag = false;
		if(result==1){
			flag = true;
		}
		return flag;
	}
	
	public DocumentVo selectDocumentByDocNum(int doc_Num) throws SQLException{
		DocumentVo documentVo = documentDao.selectDocumentByDocNum(doc_Num);
		return documentVo;
	}
}
