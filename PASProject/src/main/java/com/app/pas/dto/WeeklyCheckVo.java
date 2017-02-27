package com.app.pas.dto;

import java.util.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;



@Alias("WeeklyCheck")
@Data
public class WeeklyCheckVo {

	private String mon;
	private String tue;
	private String wed;
	private String thu;
	private String fri;
	private String sat;
	private String sun;
	private String day;
	

}
