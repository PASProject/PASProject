package com.app.pas.dto;

import java.io.Serializable;
import java.sql.Timestamp;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

@Data
@Alias("MemberLog")
public class MemberLogVo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String mem_Email;
	private Timestamp mem_Log_Time;
	private int mem_Log_Num;
	
}
