package com.app.pas.dto.board;

import java.io.Serializable;
import java.sql.Timestamp;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;



@Alias("SkillSharingBoard")
@Data
public class SkillSharingBoardVo implements Serializable{

	private int ssb_Article_Num;
	private Timestamp ssb_wt_date;
	private String ssb_Content;
	private String ssb_Title;
	private int ssb_Inq_Count;
	private String mem_Email;
	private int ssb_Like_Count;
	private String mem_Name;
	
	
	
}
