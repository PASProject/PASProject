package com.app.pas.dto;

import java.util.Date;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;



@Alias("WeeklyCheck")
@Data
public class WeeklyCheckVo {

	private int wk_Num;
	private Date wk_Date;
	private String wk_Content;
	private String wk_Mem_Email;
	private String wk_Yn;


}
