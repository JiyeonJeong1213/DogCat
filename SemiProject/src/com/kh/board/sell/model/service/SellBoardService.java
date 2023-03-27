package com.kh.board.sell.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.sell.model.dao.SellBoardDao;
import com.kh.common.model.vo.PageInfo;

public class SellBoardService {

	public int insertSellBoard(Board b, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		int result = new SellBoardDao().insertSellBoard(conn, b);
		int result2 = new SellBoardDao().insertAttachmentList(conn, list);
		
		if(result>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result * result2;
	}
	
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new SellBoardDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	public ArrayList<Board> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new SellBoardDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Board> selectNoticeList() {
		Connection conn = getConnection();
		
		ArrayList<Board> nList = new SellBoardDao().selectNoticeList(conn);
		
		close(conn);
		
		return nList;
	}
}
