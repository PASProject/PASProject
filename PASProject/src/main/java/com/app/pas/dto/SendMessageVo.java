package com.app.pas.dto;

import java.io.Serializable;
import java.sql.Timestamp;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

@Alias("SendMessage")
@Data
public class SendMessageVo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1544046855263467824L;
	private int sm_Article_Num;
	private String mem_Email;
	private Timestamp sm_Wt_Date;
	private String sm_Title;
	private String sm_Content;
	private String mem_Name;
	private String sm_Read_yn;
	private String sm_Del_yn;
	

	
}
