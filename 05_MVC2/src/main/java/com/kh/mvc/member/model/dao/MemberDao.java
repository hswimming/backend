package com.kh.mvc.member.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import static com.kh.mvc.common.jdbc.JDBCTemplate.close;
import com.kh.mvc.member.model.vo.Member;

public class MemberDao {

	public Member findMemberById(Connection connection, String userId) {
		Member member = null;
//		Connection connection = null;
//		Statement statement = null; // 실제 쿼리문을 수행시키는 오브젝트
		PreparedStatement pstmt = null;
		ResultSet rs = null;
//		String query = "SELECT * FROM MEMBER WHERE ID='admin2' AND STATUS='Y'"; // 아이디가 admin2로 고정된 쿼리문 
//		String query = "SELECT * FROM MEMBER WHERE ID='" + userId + "' AND STATUS='Y'"; // 사용자의 아이디를 받는 쿼리문
		String query = "SELECT * FROM MEMBER WHERE ID=? AND STATUS='Y'";
		
		try {
			// 클래스 이름을 줄 때는 패키지명까지 다 작성
//			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// DriverManager를 통해서 DB와 연결된 connection 객체 불러오기
//			connection = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "WEB", "WEB");
			
//			statement = connection.createStatement();
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, userId); // 쿼리문을 수행하기 전 set 해준다.
			
			// SELECT 구문을 수행시키는 메소드
//			resultSet = statement.executeQuery(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				member = new Member();
				
				member.setNo(rs.getInt("NO"));
		        member.setId(rs.getString("ID"));
		        member.setPassword(rs.getString("PASSWORD"));
		        member.setRole(rs.getString("ROLE"));
		        member.setName(rs.getString("NAME"));
		        member.setPhone(rs.getString("PHONE"));
		        member.setEmail(rs.getString("EMAIL"));
		        member.setAddress(rs.getString("ADDRESS"));
		        member.setHobby(rs.getString("HOBBY"));
		        member.setStatus(rs.getString("STATUS"));
		        member.setEnrollDate(rs.getDate("ENROLL_DATE"));
		        member.setModifyDate(rs.getDate("MODIFY_DATE"));
		        
				/*
				 * System.out.println(resultSet.getInt("NO")); // 매개값으로 컬럼명 주기
				 * System.out.println(resultSet.getString("ID"));
				 * System.out.println(resultSet.getString(3)); // 컬럼 순번 주기
				 * System.out.println(resultSet.getString(4));
				 */
			}
			
		} /* catch (ClassNotFoundException e) {
			e.printStackTrace();
		}*/ catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs); // 클래스명 생략
			close(pstmt); // 클래스명 생략
			
			/*
			try {
				// 생성의 역순으로 close
				rs.close();
//				statement.close();
				pstmt.close();
				connection.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			*/
		}
		
		return member;
	}

	public int insertMember(Connection connection, Member member) {
		int result = 0;
//		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO MEMBER VALUES(SEQ_UNO.NEXTVAL,?,?,DEFAULT,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT)";
		
		try {
			/*
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			connection = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "WEB", "WEB");
			
			connection.setAutoCommit(false);
			*/
			
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getAddress());
			pstmt.setString(7, member.getHobby());
			
			result = pstmt.executeUpdate(); // 영향 받은 행의 개수 확인
			
			// insert 문의 커밋, 롤백을 서비스가 처리
			/*
			if (result > 0) {
				connection.commit();
			} else {
				connection.rollback();
			}
			*/
		
		
		} /* catch (ClassNotFoundException e) {
			e.printStackTrace();
		} */ catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
			/*
			try {
				pstmt.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} */
		
		return result;
		
	}

	public int updateMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		// 프라이머리 키 값을 가지고 처리
		String query = "UPDATE MEMBER SET NAME=?,PHONE=?,EMAIL=?,ADDRESS=?,HOBBY=?,MODIFY_DATE=SYSDATE WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getHobby());
			pstmt.setInt(6, member.getNo());
			
			result = pstmt.executeUpdate(); // 영향 받은 행의 개수를 result로 담는다.
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateMemberPassword(Connection connection, int no, String userPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE MEMBER SET PASSWORD=? WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, userPwd);
			pstmt.setInt(2, no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateMemberStatus(Connection connection, int no, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE MEMBER SET STATUS=? WHERE NO=?"; // STATUS='N'으로 할 경우 처리하는 구문을 또 만들어야 한다.
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}