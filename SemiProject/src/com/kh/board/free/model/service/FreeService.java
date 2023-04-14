package com.kh.board.free.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.free.model.dao.FreeDao;
import com.kh.board.free.model.vo.Category;
import com.kh.board.free.model.vo.Reply;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.model.vo.PageInfo;

public class FreeService {

	public int selectListCount() {
		Connection conn = getConnection();

		int listCount = new FreeDao().selectListCount(conn);

		close(conn);

		return listCount;
	}

	public ArrayList<Board> selectList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Board> list = new FreeDao().selectList(conn, pi);

		close(conn);

		return list;
	}

	public ArrayList<Category> selectCategoryList() {

		Connection conn = getConnection();

		ArrayList<Category> categoryList = new FreeDao().selectCategoryList(conn);

		close(conn);

		return categoryList;
	}

	public int insertBoard(Board b, Attachment at) {

		Connection conn = getConnection();

		int result1 = new FreeDao().insertBoard(conn, b);

		int result2 = 1;

		if (at != null) {
			result2 = new FreeDao().insertAttachment(conn, at);
		}

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result1 * result2;

	}

	public int increaseCount(int boardNo) {
		Connection conn = getConnection();

		int result = new FreeDao().increaseCount(conn, boardNo);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public Board selectBoard(int boardNo) {
		Connection conn = getConnection();

		Board b = new FreeDao().selectBoard(conn, boardNo);

		close(conn);

		return b;
	}

	public Attachment selectAttachment(int boardNo) {
		Connection conn = getConnection();

		Attachment at = new FreeDao().selectAttachment(conn, boardNo);

		close(conn);

		return at;
	}

	public int updateBoard(Board b, Attachment at) {

		Connection conn = getConnection();

		int result1 = new FreeDao().updateBoard(conn, b);

		int result2 = 1;

		if (at != null) {
			if (at.getFileNo() != 0) {
				result2 = new FreeDao().updateAttachment(conn, at);
			} else {
				result2 = new FreeDao().insertNewAttachment(conn, at);
			}
		}

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result1 * result2;
	}

	public int deleteBoard(int boardNo, int userNo, Attachment at) {
		Connection conn = getConnection();

		int result = new FreeDao().deleteBoard(conn, boardNo, userNo);
		int result2 = 1;

		if (at != null) {
			result2 = new FreeDao().deleteAttachment(conn, boardNo);
		}

		if (result > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result * result2;
	}

	public int insertReply(Reply r) {

		Connection conn = getConnection();

		int result = new FreeDao().insertReply(conn, r);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public ArrayList<Reply> selectReplyList(int boardNo) {

		Connection conn = getConnection();

		ArrayList<Reply> list = new FreeDao().selectReplyList(conn, boardNo);

		close(conn);

		return list;
	}

	public int updateReply(Reply r) {

		Connection conn = getConnection();

		int result = new FreeDao().updateReply(conn, r);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public int deleteReply(int replyNo) {
		Connection conn = getConnection();

		int result = new FreeDao().deleteReply(conn, replyNo);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}
	
	public int searchListCount() {
		Connection conn = getConnection();

		int listCount = new FreeDao().selectListCount(conn);

		close(conn);

		return listCount;
	}
	
	public ArrayList<Board> searchList(PageInfo pi, String inputText) {
		Connection conn = getConnection();

		ArrayList<Board> list = new FreeDao().searchList(conn, pi, inputText);

		close(conn);
		
		return list;
	}
}
