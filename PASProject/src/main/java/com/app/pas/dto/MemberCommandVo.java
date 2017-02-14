package com.app.pas.dto;

import java.io.Serializable;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;


@Alias("MemberCommand")
@Data
public class MemberCommandVo implements Serializable{

	private String mem_Email;
	private String mem_Name;
	
	
}
