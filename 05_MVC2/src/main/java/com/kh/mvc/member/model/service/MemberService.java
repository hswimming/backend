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

	public Member login(String userId, String userPwd) {
		Member member = null;
//		Connection connection = JDBCTemplate.getConnection();
		Connection connection = getConnection(); // 클래스명 생략
		
		// connection 받는 매개변수가 없으므로 MemberDao 에서 생성해줘야 한다.
		member = new MemberDao().findMemberById(connection, userId);
		
		// connection.close 를 하지 않아도 되는 이유? JDBCTemplate 파일에서 close 구문을 생성했기 때문
//		JDBCTemplate.close(connection);
		close(connection); // 클래스명 생략
		
		if (member == null || !member.getPassword().equals(userPwd)) {
			return null;
		}
		
		return member;
	}

	// 서비스가 트렌젝션을 제어해야 하기 때문에 서비스에서 ...
	public int save(Member member) { // 매개값과 리턴값 자동 지정
		int result = 0;
		Connection connection = getConnection();
		
		// URL을 /member/enroll 로 지정해놨기 때문에 회원가입 실패 시 회원가입 화면이 다시 보여진다.
		result = new MemberDao().insertMember(connection, member);
		
		if (result > 0) {
			commit(connection); // 클래스명 생략
		} else {
			rollback(connection); // 클래스명 생략
		}
		
		close(connection);
		
		return result;
	}
}