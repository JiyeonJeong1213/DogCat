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
	
	public int increaseCount(int bno) {
		Connection conn = getConnection();
		int result = new SellBoardDao().increseCount(conn, bno);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public Board selectBoard(int bno) {
		Connection conn = getConnection();
		Board b = new SellBoardDao().selectBoard(conn, bno);
		close(conn);
		return b;
	}
	public ArrayList<Attachment> selectAttachmentList(int bno) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new SellBoardDao().selectAttachmentList(conn, bno);
		close(conn);
		return list;
	}
	
	public int updateBoard(Board b, ArrayList<Attachment> list, ArrayList<Integer> originFileNos) {
		Connection conn = getConnection();
		int result1 = new SellBoardDao().updateBoard(conn, b);
		
		int result2 = 1; // 애초에 insert나 update문이 실행되지 않을 경우를 대비해서 1로 초기화 해줌
		int result3 = 1;
		if(list.size() > 0) {
			result2 = new SellBoardDao().updateAttachmentInsert(conn, list);
			if(originFileNos != null) { // 기존에 첨부파일이 있었던 경우
				result3 = new SellBoardDao().updateAttachmentDelete(conn, originFileNos);
			}
		}
		
		if(result1>0 && result2>0 && result3>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1*result2*result3;
	}
	
	public int deleteBoard(int bno, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		int result1 = new SellBoardDao().deleteBoard(conn, bno);
		int result2 = 1;
		if(list != null) {
			result2 = new SellBoardDao().deleteAttachment(conn, bno);
		}
		
		if(result1>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
}
