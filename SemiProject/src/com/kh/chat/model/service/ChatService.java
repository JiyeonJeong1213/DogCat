package com.kh.chat.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.chat.model.dao.ChatDao;
import com.kh.chat.model.vo.Message;

public class ChatService {

	public int checkChatroom(int bno, int buyerNo) {
		Connection conn = getConnection();
		int result = new ChatDao().checkChatroom(conn, bno, buyerNo);
		close(conn);
		return result;
	}
	public int insertChatroom(int bno, int buyerNo) {
		Connection conn = getConnection();
		int result = new ChatDao().insertChatroom(conn, bno, buyerNo);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int insertMessageFromBuyer(int bno, int senderNo, String msg) {
		Connection conn = getConnection();
		int result = new ChatDao().insertMessageFromBuyer(conn, bno, senderNo, msg);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public ArrayList<Message> readMessageForBuyer(int bno, int reader) {
		Connection conn = getConnection();
		ArrayList<Message> mList = new ChatDao().readMessageForBuyer(conn, bno, reader);
		close(conn);
		return mList;
	}
}
