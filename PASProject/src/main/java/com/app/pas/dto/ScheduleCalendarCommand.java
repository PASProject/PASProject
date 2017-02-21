package com.app.pas.dto;

import java.util.Date;

import lombok.Data;

import com.fasterxml.jackson.annotation.JsonFormat;

@Data
public class ScheduleCalendarCommand {
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd HH:mm")
	private Date start;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd HH:mm")
	private Date end;
	private String title;
	private String color;
	private String description;
	private String id;

}
