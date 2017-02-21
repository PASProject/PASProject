package com.app.pas.service.dic;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import com.app.pas.dao.dic.SpreadSheetDao;
import com.app.pas.dto.dic.SpreadSheetVo;

public class SpreadSheetService {
	
	private SpreadSheetDao spreadSheetDao;

	public void setSpreadSheetDao(SpreadSheetDao spreadSheetDao) {
		this.spreadSheetDao = spreadSheetDao;
	}
	
	public boolean insertSpreadSheet(SpreadSheetVo spreadSheetVo) throws SQLException{
		boolean flag = false;
		int result = spreadSheetDao.insertSpreadSheet(spreadSheetVo);
		if(result ==1){
			flag = true;
		}else{
			flag = false;
		}
		return flag;
	}
}
