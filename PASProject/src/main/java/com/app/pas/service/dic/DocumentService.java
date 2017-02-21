package com.app.pas.service.dic;

import java.sql.SQLException;

import com.app.pas.dao.dic.DocumentDao;
import com.app.pas.dao.dic.SpreadSheetDao;
import com.app.pas.dto.dic.DocumentVo;
import com.app.pas.dto.dic.SpreadSheetVo;

public class DocumentService {

	private DocumentDao dictionaryDao;
	private SpreadSheetDao spreadSheetDao;
	
	
	public void setSpreadSheetDao(SpreadSheetDao spreadSheetDao) {
		this.spreadSheetDao = spreadSheetDao;
	}

	public void setDictionaryDao(DocumentDao dictionaryDao) {
		this.dictionaryDao = dictionaryDao;
	}
	
	public boolean insertDictionarySpreadSeet(DocumentVo documentVo,SpreadSheetVo spreadSheetVo) throws SQLException{
		dictionaryDao.insertDocument(documentVo);
		DocumentVo selectLastVo = dictionaryDao.selectDocumentLastColumn();
		spreadSheetVo.setDic_Num(selectLastVo.getDoc_Num());
		int result = spreadSheetDao.insertSpreadSheet(spreadSheetVo);
		boolean flag = false;
		if(result==1){
			flag = true;
		}
		return flag;
	}
	
}
