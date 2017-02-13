package com.app.pas.dto;

import java.io.Serializable;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;


@Alias("Admin")
@Data
public class AdminVo implements Serializable{

	private String admin_Email;
	private String admin_Pass;
	
	
}
