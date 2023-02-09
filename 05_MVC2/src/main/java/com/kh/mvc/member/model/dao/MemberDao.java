package com.kh.mvc.member.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.kh.mvc.member.model.vo.Member;

public class MemberDao {

	public Member findMemberById(String userId) {
		Member member = null;
		Connection connection = null;
		Statement statement = null; // 실제 쿼리문을 수행시키는 오브젝트
		ResultSet resultSet = null;
		String query = "SELECT * FROM MEMBER WHERE ID='admin2' AND STATUS='Y'";
		
		try {
			// 클래스 이름을 줄 때는 패키지명까지 다 작성
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// DriverManager를 통해서 DB와 연결된 connection 객체 불러오기
			connection = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "WEB", "WEB");
			
			statement = connection.createStatement();
			
			// SELECT 구문을 수행시키는 메소드
			resultSet = statement.executeQuery(query);
			
			while(resultSet.next()) {
				member = new Member();
				
				member.setNo(resultSet.getInt("NO"));
		        member.setId(resultSet.getString("ID"));
		        member.setPassword(resultSet.getString("PASSWORD"));
		        member.setRole(resultSet.getString("ROLE"));
		        member.setName(resultSet.getString("NAME"));
		        member.setPhone(resultSet.getString("PHONE"));
		        member.setEmail(resultSet.getString("EMAIL"));
		        member.setAddress(resultSet.getString("ADDRESS"));
		        member.setHobby(resultSet.getString("HOBBY"));
		        member.setStatus(resultSet.getString("STATUS"));
		        member.setEnrollDate(resultSet.getDate("ENROLL_DATE"));
		        member.setModifyDate(resultSet.getDate("MODIFY_DATE"));
		        
				/*
				 * System.out.println(resultSet.getInt("NO")); // 매개값으로 컬럼명 주기
				 * System.out.println(resultSet.getString("ID"));
				 * System.out.println(resultSet.getString(3)); // 컬럼 순번 주기
				 * System.out.println(resultSet.getString(4));
				 */
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				// 생성의 역순으로 close
				resultSet.close();
				statement.close();
				connection.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return member;
	}
}