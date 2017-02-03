package com.app.pas.dto.board;

public class SkillSharingBoardLikeVo {

	private int ssb_Article_Num;
	private String mem_Email;
	
	
	@Override
	public String toString() {
		return "SkillSharingBoardLikeVo [ssb_Article_Num=" + ssb_Article_Num
				+ ", mem_Email=" + mem_Email + "]";
	}

	public int getSsb_Article_Num() {
		return ssb_Article_Num;
	}

	public void setSsb_Article_Num(int ssb_Article_Num) {
		this.ssb_Article_Num = ssb_Article_Num;
	}

	public String getMem_Email() {
		return mem_Email;
	}

	public void setMem_Email(String mem_Email) {
		this.mem_Email = mem_Email;
	}

}
