package com.app.pas.service.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.pas.dao.board.QnaBoardReplyDao;
import com.app.pas.dto.board.QnaBoardReplyVo;

public class QnaBoardReplyService {
	private QnaBoardReplyDao qnaBoardReplyDeo;
	
	public void setQnaBoardReply (QnaBoardReplyDao qnaBoardReplyDeo){
		this.qnaBoardReplyDeo = qnaBoardReplyDeo;
	}
	public QnaBoardReplyVo selectQnaReply(int qb_Article_Num) throws SQLException{
		QnaBoardReplyVo qnaBoardReplyVo= null;
		qnaBoardReplyVo = qnaBoardReplyDeo.selectQnaReply(qb_Article_Num);
		
		return qnaBoardReplyVo;
		
	}
	
}
