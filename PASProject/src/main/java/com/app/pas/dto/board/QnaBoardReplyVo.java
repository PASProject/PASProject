package com.app.pas.dto.board;

public class QnaBoardReplyVo {

	private int qb_Reply_Num;
	private String qb_Reply_Time;
	private int qb_Article;
	private String admin_Email;
	private String qb_Reply_Content;
	public int getQb_Reply_Num() {
		return qb_Reply_Num;
	}
	public void setQb_Reply_Num(int qb_Reply_Num) {
		this.qb_Reply_Num = qb_Reply_Num;
	}
	public String getQb_Reply_Time() {
		return qb_Reply_Time;
	}
	public void setQb_Reply_Time(String qb_Reply_Time) {
		this.qb_Reply_Time = qb_Reply_Time;
	}
	public int getQb_Article() {
		return qb_Article;
	}
	public void setQb_Article(int qb_Article) {
		this.qb_Article = qb_Article;
	}
	public String getAdmin_Email() {
		return admin_Email;
	}
	public void setAdmin_Email(String admin_Email) {
		this.admin_Email = admin_Email;
	}
	public String getQb_Reply_Content() {
		return qb_Reply_Content;
	}
	public void setQb_Reply_Content(String qb_Reply_Content) {
		this.qb_Reply_Content = qb_Reply_Content;
	}
	
	@Override
	public String toString() {
		return "QnaBoardReplyVo [qb_Reply_Num=" + qb_Reply_Num
				+ ", qb_Reply_Time=" + qb_Reply_Time + ", qb_Article="
				+ qb_Article + ", admin_Email=" + admin_Email
				+ ", qb_Reply_Content=" + qb_Reply_Content + "]";
	}
	
	
	
	
	
	
}
