package com.app.pas.dto.board;



public class FreeBoardLikeVo {
	
	
	private int frb_Article_Num;
	private String mem_Email;
	
	@Override
	public String toString() {
		return "FreeBoardLikeVo [frb_Article_Num=" + frb_Article_Num
				+ ", mem_Email=" + mem_Email + "]";
	}

	public int getFrb_Article_Num() {
		return frb_Article_Num;
	}

	public void setFrb_Article_Num(int frb_Article_Num) {
		this.frb_Article_Num = frb_Article_Num;
	}

	public String getMem_Email() {
		return mem_Email;
	}

	public void setMem_Email(String mem_Email) {
		this.mem_Email = mem_Email;
	}
	
	
}
	
