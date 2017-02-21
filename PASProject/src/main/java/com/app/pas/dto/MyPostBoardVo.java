package com.app.pas.dto;

import java.sql.Timestamp;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;


@Alias("MyPostBoardVo")
@Data
public class MyPostBoardVo {
	
	private Timestamp dt;
	private String title;
	private String cont;
	private int num;
	private int cnt;
	private String mail;
	private String yn;
	private String tag;
	private String ssb_y_n;
	
	
//	private Timestamp ssb_wt_date;
//	private String ssb_Content;
//	private int ssb_Article_Num;
//	private int ssb_Inq_Count;
//	private String mem_Email;
//	private String ssb_Tag;
//	
//	private Timestamp frb_Wt_Date;
//	private String frb_Title;
//	private String frb_Content;
//	private int frb_Article_Num;
//	private int frb_Inq_Count;
//	
//	private Timestamp qb_Wt_Date;
//	private String qb_Title;
//	private String qb_Content;
//	private int qb_Article_Num;
//	private int qb_Inq_Count;
//	private String qb_yn;
	


}
