package com.app.pas.dao.board;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dto.board.QnaBoardVo;

public interface QnaBoardDao {
  
	  public List<QnaBoardVo> selectQnaBoardList()throws SQLException;
	  public QnaBoardVo selectQnaBoard(int qb_Article_Num)throws SQLException;
	  public void insertQnaBoard(QnaBoardVo qnaBoardVo)throws SQLException;
	  public void updateQnaBoard(QnaBoardVo qnaBoardVo)throws SQLException;
	  public void deleteQnaBoard(int qb_Article_Num)throws SQLException;
	  public int QnaSelectTotalCount()throws SQLException;

	  
}
