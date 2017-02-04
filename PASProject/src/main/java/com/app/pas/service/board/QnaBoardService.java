package com.app.pas.service.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.app.pas.dao.board.QnaBoardDao;
import com.app.pas.dto.board.QnaBoardVo;

public class QnaBoardService {
	// db에서 받아온 값 :dao
	// dao에서 받아온 값을 가공처리 하는곳이 serviece
	// 가공처리 ex) if문 줘서 로그인 아이디가 null이면

	private QnaBoardDao qnaBoardDao;

	public void setQnaBoardDao(QnaBoardDao qnaBoardDao) {
		this.qnaBoardDao = qnaBoardDao;
	}

	public List<QnaBoardVo> selectQnaBoardList() throws SQLException {
		List<QnaBoardVo> list = new ArrayList<QnaBoardVo>();
		list = qnaBoardDao.selectQnaBoardList();

		return list;

	}

	public void insertQnaBoard(QnaBoardVo qnaBoardVo) throws SQLException {
		qnaBoardDao.insertQnaBoard(qnaBoardVo);
	}

	public QnaBoardVo selectQnaBoard(int qb_Article_Num) throws SQLException {
		QnaBoardVo qnaboardVo = null;
		qnaboardVo = qnaBoardDao.selectQnaBoard(qb_Article_Num);

		return qnaboardVo;
	}

	public void updateQnaBoard(QnaBoardVo qnaBoardVo) throws SQLException {
		qnaBoardDao.updateQnaBoard(qnaBoardVo);
	}
	
	public void deleteQnaBoard(int qb_Article_Num) throws SQLException{
		qnaBoardDao.deleteQnaBoard(qb_Article_Num);
	}

	public int QnaSelectTotalCount() throws SQLException {
		int totalCount = qnaBoardDao.QnaSelectTotalCount();	
		return totalCount;
	}
	
	
	
	
	

}
