package com.kh.main.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.kh.main.model.dao.MainDao;

import static com.kh.common.JDBCTemplate.*;

public class MainService {
	
	public int countMate(int userNo) {
		Connection conn = getConnection();
		
		int notiCount = new MainDao().countMate(conn, userNo);
		
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return notiCount;
	}

}
