package com.app.pas.service.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.pas.dao.board.QnaBoardReplyDao;
import com.app.pas.dto.board.QnaBoardReplyVo;

public class QnaBoardReplyService {
	private QnaBoardReplyDao qnaBoardReplyDao;

	public void setQnaBoardReply(QnaBoardReplyDao qnaBoardReplyDeo) {
		this.qnaBoardReplyDao = qnaBoardReplyDeo;
	}

	/*
	 * public QnaBoardReplyVo selectQnaReply(int qb_Article_Num) throws
	 * SQLException{ QnaBoardReplyVo qnaBoardReplyVo= null; qnaBoardReplyVo =
	 * qnaBoardReplyDao.selectQnaReply(qb_Article_Num);
	 * 
	 * return qnaBoardReplyVo; }
	 */
	public List<QnaBoardReplyVo> selectQnaReply() throws SQLException {
		List<QnaBoardReplyVo> list = qnaBoardReplyDao.selectQnaReply();

		return list;

	}

	public void insertQnaBoardReply(QnaBoardReplyVo qnaBoardReplyVo)
			throws SQLException {
		qnaBoardReplyDao.insertQnaBoardReply(qnaBoardReplyVo);

	}

}
