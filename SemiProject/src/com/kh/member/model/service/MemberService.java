package com.kh.member.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import com.kh.pet.model.vo.Pet;

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
	
	public int idCheck(String userId) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int count = new MemberDao().idCheck(conn, userId);
		
		JDBCTemplate.close(conn);
		
		return count;
	}
	
	public int nickCheck(String userNickname) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int count1 = new MemberDao().nickCheck(conn, userNickname);
		
		JDBCTemplate.close(conn);
		
		return count1;
	}
	
	public int insertMember(Member m, Pet p) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result1 = new MemberDao().insertMember(conn, m);
		int result2 = 1;
		
		if(p != null) {
			result2 = new MemberDao().insertPet(conn, p);
		}
		
		if(result1 > 0 && result2 > 0) {
			
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result1 * result2;
	}
	
	
	
}
