package com.app.pas.dto.board;

import java.io.Serializable;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;



@Alias("SkillSharingBoardReply")
@Data
public class SkillSharingBoardReplyVo implements Serializable{

	private int ssb_Reply_Num;
	private int ssb_Article_Num;
	private String ssb_Reply_Mem;
	private String ssb_Reply_Content;
	private String ssb_Reply_Mem_Name;
	
	

}
