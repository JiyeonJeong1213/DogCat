package com.kh.board.notice.model.dao;

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
import static com.kh.common.JDBCTemplate.*;
import com.kh.board.model.vo.Board;

public class NoticeDao {
	
	private Properties prop = new Properties();
	
	public NoticeDao() {
		
		String fileName = NoticeDao.class.getResource("/sql/notice/notice-mapper.xml").getPath();
		
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
	
	public ArrayList<Board> selectNoticeList(Connection conn){
		
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Board b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardWriter(rset.getString("USER_NAME"));
				b.setCount(rset.getInt("COUNT"));
				b.setCreateDate(rset.getDate("CREATE_DATE"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println(list);
		return list;
	}

	public int insertNotice(Connection conn, Board b) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setInt(3, Integer.parseInt((b.getBoardWriter())));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int selectNoticeNo(Connection conn) {
		
		int noticeNo = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNoticeNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				noticeNo = rset.getInt("BOARD_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return noticeNo;
		
	}
	
	public int increaseCount(Connection conn, int bno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public Board selectNotice(Connection conn, int bno) {
		
		Board b = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Board();
				b.setBoardNo(rset.getInt("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
				b.setBoardWriter(rset.getString("USER_NICKNAME"));
				b.setCreateDate(rset.getDate("CREATE_DATE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
		
		
	}
	
}
