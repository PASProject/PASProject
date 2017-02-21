package com.app.pas.dto;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

public class CalVo {
	private Timestamp Start;
	private String title;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public Timestamp getStart() {
		return Start;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public void setStart(Timestamp start) {
		Start = start;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	
    

}
