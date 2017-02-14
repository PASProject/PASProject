package com.app.pas.dto;

import java.io.Serializable;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;


@Alias("DeadLine")
@Data
public class DeadLineVo implements Serializable{

	private int gt_Num;
	private String dd_Charge_Mem;
	private String dd_Content;
	private String alarm_Clsfct;
	

}
