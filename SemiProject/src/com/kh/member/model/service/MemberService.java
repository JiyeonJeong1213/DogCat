package com.kh.member.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String userId, String userPwd) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		return m;
		
	}
	
	public Member updateMember(Member m) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMem = null;
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
			
			updateMem = new MemberDao().selectMember(conn, m.getUserId());
			
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return updateMem;
		
	}
	
	
	
	
	
	
}
