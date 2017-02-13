package com.app.pas.dto;

import java.io.Serializable;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;


@Alias("ProjectJoin")
@Data
public class ProjectJoinVo implements Serializable{

	private String mem_Email;
	private int proj_Num;
	private int pjj_Per_Num;
	private int position_Num;
	private String mem_Name;
	private String mem_Img;
	
	
	
	

}
