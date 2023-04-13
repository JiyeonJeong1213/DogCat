package com.kh.chat.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.kh.chat.model.vo.Chatroom;
import com.kh.chat.model.vo.Message;

public class ChatDao {

	private Properties prop = new Properties();

	public ChatDao() {
		try {
			prop.loadFromXML(new FileInputStream(ChatDao.class.getResource("/sql/chat/chat-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int checkChatroom(Connection conn, int bno, int buyerNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkChatroom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, buyerNo);
			pstmt.setInt(2, buyerNo);
			pstmt.setInt(3, bno);
			pstmt.setInt(4, bno);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	public int insertChatroom(Connection conn, int bno, int buyerNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertChatroom");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setInt(2, buyerNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertMessageFromBuyer(Connection conn, int bno, int senderNo, String msg) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMessageFromBuyer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setInt(2, senderNo);
			pstmt.setInt(3, senderNo);
			pstmt.setInt(4, bno);
			pstmt.setInt(5, senderNo);
			pstmt.setInt(6, senderNo);
			pstmt.setInt(7, senderNo);
			pstmt.setInt(8, bno);
			pstmt.setInt(9, senderNo);
			pstmt.setInt(10, senderNo);
			pstmt.setInt(11, bno);
			pstmt.setString(12, msg);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return result;
	}
	public ArrayList<Message> readMessageForBuyer(Connection conn, int bno, int reader) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Message> mList = new ArrayList<>();
		String sql = prop.getProperty("readMessageForBuyer");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setInt(2, reader);
			pstmt.setInt(3, reader);
			pstmt.setInt(4, bno);
			pstmt.setInt(5, reader);
			pstmt.setInt(6, reader);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Message m = new Message(rset.getInt("SENDER"), rset.getInt("RECEIVER"), rset.getString("M_CONTENT"));
				mList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return mList;
	}
	
	public ArrayList<Chatroom> selectChatList(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Chatroom> chatList = new ArrayList<>();
		String sql = prop.getProperty("selectChatList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Chatroom croom = new Chatroom();
				croom.setChatroomNo(rset.getInt("CR_NO"));
				croom.setCreateDate(rset.getDate("CREATE_DATE"));
				croom.setSeller(rset.getString("SELLER"));
				croom.setBuyer(rset.getString("BUYER"));
				
				chatList.add(croom);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return chatList;
	}
	public ArrayList<String> selectRecentMsg(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> recentMsgs = new ArrayList<>();
		String sql = prop.getProperty("selectRecentMsg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				String msg = rset.getString("M_CONTENT");
				
				recentMsgs.add(msg);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return recentMsgs;
	}
	public ArrayList<Message> readMessage2(Connection conn, int crNo, int reader){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Message> mList = new ArrayList<>();
		String sql = prop.getProperty("readMessage2");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, crNo);
			pstmt.setInt(2, reader);
			pstmt.setInt(3, reader);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Message m = new Message(rset.getInt("SENDER"), rset.getInt("RECEIVER"), rset.getString("M_CONTENT"));
				mList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return mList;
	}
	public int insertMessage2(Connection conn, int crNo, int senderNo, String msg) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMessage2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, crNo);
			pstmt.setInt(2, senderNo);
			pstmt.setInt(3, senderNo);
			pstmt.setInt(4, senderNo);
			pstmt.setInt(5, crNo);
			pstmt.setString(6, msg);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn);
		}
		return result;
	}
}
