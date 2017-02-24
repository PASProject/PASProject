package com.app.pas.service.dic;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.dic.GantChartDao;
import com.app.pas.dto.dic.GantChartVo;

public class GantChartService {

	private GantChartDao gantChartDao;

	public void setGantChartDao(GantChartDao gantChartDao) {
		this.gantChartDao = gantChartDao;
	}
	public List<GantChartVo> selectGantChart(int proj_Num) throws SQLException{
		List<GantChartVo> list= gantChartDao.selectGantChart(proj_Num);
		return list;
	}
}
