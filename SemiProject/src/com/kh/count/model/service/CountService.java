package com.kh.count.model.service;

import java.sql.Connection;  

import com.kh.count.model.dao.CountDao;
import com.kh.count.model.vo.Count;

import static com.kh.common.JDBCTemplate.*;


public class CountService {
	
	public Count selectCount(int userNo) {
		
		Connection conn = getConnection();
		
		int bCount = new CountDao().selectBCount(conn, userNo);
		int sCount = new CountDao().selectSCount(conn, userNo);
		int cCount = new CountDao().selectCCount(conn, userNo);
		int mCount = new CountDao().selectMCount(conn, userNo);
		
		Count count = new Count(userNo, sCount, bCount, cCount, mCount);
		
		System.out.println(count);
		
		close(conn);
		
		return count;
	}
	
	
	
}
