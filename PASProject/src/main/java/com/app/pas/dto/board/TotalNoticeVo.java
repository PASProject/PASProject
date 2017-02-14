package com.app.pas.dto.board;

import java.io.Serializable;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;



@Alias("TotalNotice")
@Data
public class TotalNoticeVo implements Serializable{

	
	private int ttnotice_Num;
	private String ttnotice_Title;
	private String ttnotice_Content;
	private int ttnotice_Inq_Count;
	private String admin_Email;
	private String ttnotice_Date;
	
	
	
}
