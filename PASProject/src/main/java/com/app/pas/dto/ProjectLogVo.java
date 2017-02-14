package com.app.pas.dto;

import java.io.Serializable;
import java.sql.Timestamp;

import kr.or.ddit.commons.ibatis.Alias;

import com.fasterxml.jackson.annotation.JsonSubTypes.Type;

import lombok.Data;

@Data
@Alias("ProjectLog")
public class ProjectLogVo implements Serializable{

	private static final long serialVersionUID = 1L;
	private String mem_Email;
	private int proj_Num;
	private int proj_Log_Num;
	private Timestamp proj_Log_Time;

}
