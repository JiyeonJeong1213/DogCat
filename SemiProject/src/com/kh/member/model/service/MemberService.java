package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.SQLException;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import com.kh.pet.model.vo.Pet;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();

		Member m = new MemberDao().loginMember(conn, userId, userPwd);

		close(conn);

		return m;

	}

	public Member updateMember(Member m) {

		Connection conn = getConnection();

		int result = new MemberDao().updateMember(conn, m);

		Member updateMem = null;

		if (result > 0) {
			commit(conn);

			updateMem = new MemberDao().selectMember(conn, m.getUserId());

		} else {
			rollback(conn);
		}

		close(conn);

		return updateMem;

	}
	
	// 아이디 중복체크
	public int idCheck(String userId) {

		Connection conn = getConnection();

		int count = new MemberDao().idCheck(conn, userId);

		close(conn);

		return count;
	}

	// 닉네임 중복체크
	public int nickCheck(String userNickname) {

		Connection conn = getConnection();

		int count1 = new MemberDao().nickCheck(conn, userNickname);

		close(conn);

		return count1;
	}
	
	// 이메일 중복체크
	public int emailCheck(String email) {

		Connection conn = getConnection();

		int count1 = new MemberDao().emailCheck(conn, email);

		close(conn);

		return count1;
	}

	// 회원가입 멤버, 펫정보 삽입
	public int insertMember(Member m, Pet p) {

		Connection conn = getConnection();

		int result1 = new MemberDao().insertMember(conn, m);
		int result2 = 1;

		if (p != null) {
			result2 = new MemberDao().insertPet(conn, p);
		}

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result1 * result2;
	}

	MemberDao dao = new MemberDao();
	
	// 이름,이메일로 아이디 찾기
	public String searchMemberId(String inputName, String inputEmail) { 
		return dao.searchMemberId(inputName, inputEmail);
	}
	
	// 아이디,이름으로 이메일 찾기
	public String searchMemberEmail(String inputId, String inputName) { 
		return dao.searchMemberEmail(inputId, inputName);
	}
	
	// 비밀번호 업데이트
	public int UpdateMemberPwd(Member member) { 
		return dao.UpdateMemberPwd(member);
	}

}
