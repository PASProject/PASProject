package com.app.pas.dao.dic;

import java.sql.SQLException;

import com.app.pas.dto.dic.SpreadSheetVo;

public interface SpreadSheetDao {

	public int insertSpreadSheet(SpreadSheetVo spreadSheetVo) throws SQLException;
}
