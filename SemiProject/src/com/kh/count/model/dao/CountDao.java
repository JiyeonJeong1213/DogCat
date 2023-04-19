package com.kh.count.model.dao;

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
import com.kh.member.model.dao.MemberDao;

import static com.kh.common.JDBCTemplate.*;

public class CountDao {
	
	private Properties prop = new Properties();
	
	public CountDao() {
	
		String fileName = MemberDao.class.getResource("/sql/count/count-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectBCount(Connection conn, int userNo) {
		
		int bCount = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				bCount = rset.getInt("BCOUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(bCount);
		return bCount;
	}
	
	public int selectSCount(Connection conn, int userNo) {
		
		int sCount = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				sCount = rset.getInt("SCOUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return sCount;
	}
	
	public int selectCCount(Connection conn, int userNo) {
		
		int cCount = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				cCount = rset.getInt("CCOUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(cCount);
		return cCount;
	}
	
	public int selectMCount(Connection conn, int userNo) {
	
	int mCount = 0;
	
	PreparedStatement pstmt = null;
	
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectMCount");
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, userNo);
		
		rset = pstmt.executeQuery();
		
		if(rset.next()) {
			mCount = rset.getInt("MCOUNT");
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	return mCount;
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
	
	
	
	public String selectRecentMsg2(Connection conn, int crNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String recentMsg = null;
		String sql = prop.getProperty("selectRecentMsg2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, crNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				recentMsg = rset.getString("M_CONTENT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return recentMsg;
	}
	
	
	

}
