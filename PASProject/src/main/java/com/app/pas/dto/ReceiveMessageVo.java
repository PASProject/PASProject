package com.app.pas.dto;

import java.io.Serializable;
import java.sql.Timestamp;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

@Alias("ReceiveMessage")
@Data
public class ReceiveMessageVo implements Serializable{


	private static final long serialVersionUID = 3925172639862008648L;


	private int rm_Article_Num;
	private String mem_Email;
	private Timestamp rm_Wt_Date;
	private String rm_Title;
	private String rm_Content;
	private String mem_Name;
	private String rm_Read_yn;
	private String rm_Del_yn;
	

	
}
