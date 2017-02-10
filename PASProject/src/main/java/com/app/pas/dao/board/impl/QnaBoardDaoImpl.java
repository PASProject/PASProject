package com.app.pas.dao.board.impl;

import java.sql.SQLException;
import java.util.List;

import com.app.pas.dao.board.QnaBoardDao;
import com.app.pas.dto.board.QnaBoardVo;
import com.ibatis.sqlmap.client.SqlMapClient;

public class QnaBoardDaoImpl implements QnaBoardDao{
	
	private SqlMapClient client;
	
	public void setClient(SqlMapClient client) {
		this.client = client;
	}

	@Override
	public List<QnaBoardVo> selectQnaBoardList(QnaBoardVo qnaBoarVo) throws SQLException {
		List<QnaBoardVo> list = client.queryForList("selectQnaBoardList",qnaBoarVo);
		return list;
	}
	
////이름 찾기
//	@Override
//	public List<QnaBoardVo> QbNameSearch(String mem_Name) throws SQLException {
//		System.out.println("임플의 네임 : " + mem_Name);
//		List<QnaBoardVo> nameList =(List) client.queryForObject("QbNameSearch", mem_Name);
//		System.out.println("임플의 리스트 : " + nameList);
//		return nameList;
//	}

	
	@Override
	public QnaBoardVo selectQnaBoard(int qb_Article_Num) throws SQLException {
		QnaBoardVo qnaBoardVo = (QnaBoardVo) client.queryForObject("selectQnaBoard",qb_Article_Num);
		return qnaBoardVo;
	}

	@Override
	public void insertQnaBoard(QnaBoardVo qnaBoardVo) throws SQLException {
		client.insert("insertQnaBoard",qnaBoardVo);
	}

	@Override
	public void updateQnaBoard(QnaBoardVo qnaBoardVo) throws SQLException {	
		client.update("updateQnaBoard",qnaBoardVo);
	}

	@Override
	public void deleteQnaBoard(int qb_Article_Num) throws SQLException {
		System.out.println("^^^^^^^^^^^^^"+qb_Article_Num);
		client.delete("deleteQnaBoard",qb_Article_Num);
		System.out.println("^^^^^^^^^^^^^"+qb_Article_Num);
	}

	@Override
	public int QnaSelectTotalCount() throws SQLException {
		int totalCount = (Integer) client.queryForObject("QnaSelectTotalCount");
		return totalCount;
		
	}

	@Override
	public void QnaBoardCount(int qb_Article_Num) throws SQLException {
		client.update("QnaBoardCount",qb_Article_Num);
		
	}
	@Override
	public void updateQnaYN(int qb_Article_Num) throws SQLException {
		System.out.println("dao"+qb_Article_Num);
		client.update("updateQnaYN", qb_Article_Num);
		
	}

	@Override
	public void deleteQnaYN(int qb_Article_Num) throws SQLException {
		client.update("deleteQnaYN",qb_Article_Num);
		
	}


	
}
