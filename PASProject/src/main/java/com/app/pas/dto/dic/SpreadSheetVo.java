package com.app.pas.dto.dic;

import java.sql.Timestamp;

import kr.or.ddit.commons.ibatis.Alias;
import lombok.Data;

@Data
@Alias("SpreadSheet")
public class SpreadSheetVo {
	private int dic_Num;
	private String sp_Content;
	private Timestamp sp_Wt_Date;
}
