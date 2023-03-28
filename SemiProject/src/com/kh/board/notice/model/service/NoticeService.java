package com.kh.board.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.vo.Board;
import com.kh.board.notice.model.dao.NoticeDao;

import static com.kh.common.JDBCTemplate.*;

public class NoticeService {

	public ArrayList<Board> selectNoticeList(){
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new NoticeDao().selectNoticeList(conn);
		
		close(conn);
		
		return list;
		
	}
	
	public int insertNotice(Board b) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(conn, b);
		
		if(result > 0) {
			
			commit(conn);
			
			result = new NoticeDao().selectNoticeNo(conn);
			
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}
	
	public int increaseCount(int bno) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().increaseCount(conn, bno);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
	}
	
	public Board selectNotice(int bno) {
		
		Connection conn = getConnection();
		
		Board b = new NoticeDao().selectNotice(conn, bno);
		
		close(conn);
		
		return b;
		
	}

}
