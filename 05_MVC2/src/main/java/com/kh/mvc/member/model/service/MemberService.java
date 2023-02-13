package com.kh.mvc.member.model.service;

import java.sql.Connection;

// static : 정적 메소드 호출 시 클래스명 생략 가능
import static com.kh.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import static com.kh.mvc.common.jdbc.JDBCTemplate.commit;
import static com.kh.mvc.common.jdbc.JDBCTemplate.rollback;

import com.kh.mvc.common.jdbc.JDBCTemplate;
import com.kh.mvc.member.model.dao.MemberDao;
import com.kh.mvc.member.model.vo.Member;

public class MemberService {

//	public Member login(String userId, String userPwd) {
//		Member member = null;
////		Connection connection = JDBCTemplate.getConnection();
//		Connection connection = getConnection(); // 클래스명 생략
//		
//		// connection 받는 매개변수가 없으므로 MemberDao 에서 생성해줘야 한다.
//		member = new MemberDao().findMemberById(connection, userId);
//		
//		// connection.close 를 하지 않아도 되는 이유? JDBCTemplate 파일에서 close 구문을 생성했기 때문
////		JDBCTemplate.close(connection);
//		close(connection); // 클래스명 생략
//		
//		if (member == null || !member.getPassword().equals(userPwd)) {
//			return null;
//		}
//		
//		return member;
//	}
	
	// 위의 코드 줄이기
	public Member login(String userId, String userPwd) {
		Member member = this.findMemberById(userId);
		
		if (member == null || !member.getPassword().equals(userPwd)) {
			return null;
		}
		
		return member;
	}

	// 서비스가 트렌젝션을 제어해야 하기 때문에 서비스에서 ...
	public int save(Member member) { // 매개값과 리턴값 자동 지정
		int result = 0;
		Connection connection = getConnection();
		
		if (member.getNo() > 0) {
			// update 작업
			result = new MemberDao().updateMember(connection, member); // 영향 받은 행의 개수를 정수값으로 리턴
			
		} else {
			// insert 작업
			// URL을 /member/enroll 로 지정해놨기 때문에 회원가입 실패 시 회원가입 화면이 다시 보여진다.
			result = new MemberDao().insertMember(connection, member);
		}
				
		if (result > 0) {
			commit(connection); // 클래스명 생략
		} else {
			rollback(connection); // 클래스명 생략
		}
		
		close(connection);
		
		return result;
	}
	
//	public boolean isDuplicateId(String userId) {
//		Connection connection = getConnection();
//		
//		// Dao에 있는 메소드를 통해 member 객체를 가져온다. (존재한다면 이미 있는 아이디)
//		Member member = new MemberDao().findMemberById(connection, userId);
//		
//		close(connection);
//		
//		return member != null;
//	}
	
	// 위의 코드 줄이기
	public boolean isDuplicateId(String userId) {
		return this.findMemberById(userId) != null;
	}

	public Member findMemberById(String userId) {
		Connection connection = getConnection();
		
		Member member = new MemberDao().findMemberById(connection, userId);
		
		close(connection);
		
		return member;
		
	}

	public int updatePassword(int no, String userPwd) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new MemberDao().updateMemberPassword(connection, no, userPwd);
		
		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public int delete(int no) {
		int result = 0;
		
		Connection connection = getConnection();
		
		result = new MemberDao().updateMemberStatus(connection, no, "N");
		
		if (result > 0) {
			commit(connection);
			
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
}