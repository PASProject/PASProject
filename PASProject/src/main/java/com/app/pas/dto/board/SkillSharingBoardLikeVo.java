package com.app.pas.dto.board;

import java.io.Serializable;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;



@Alias("SkillSharingBoardLike")
@Data
public class SkillSharingBoardLikeVo implements Serializable{

	private int ssb_Article_Num;
	private String mem_Email;
	
}
