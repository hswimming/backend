<%@page import="java.util.Arrays"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 내장 객체</title>
</head>
<body>
	<h1>JSP 내장 객체</h1>
	<%--
	<%
		// 동일한 이름으로 변수를 만드려고 하면 (중복 작성 시) 에러 발생
		// String out = "";
		
		// out.write("<h3>안녕하세요^^</h3>");
	%>
	--%>
	 
	 <h2>1. request 객체</h2>
	 <p>
	 	웹 브라우저의 요청 정보를 가지고 있는 객체이다.
	 </p>
	 
	 <h3>1) 헤더와 관련된 메소드</h3>
	 
	 <table border="1">
	 	<tr>
	 		<th>헤더 이름</th>
	 		<th>헤더 값</th>
	 	</tr>
	 	<%
// 	 		String userAgent = request.getHeader("User-Agent");
// 	 		System.out.println(userAgent);

			Enumeration<String> headerNames = request.getHeaderNames();
			
			while(headerNames.hasMoreElements()) {
				String headerName = headerNames.nextElement();
				
// 				System.out.println(headerName);
// 				System.out.println(request.getHeader(headerName));
// 				System.out.println();
		%>
		 	<tr>
		 		<td><%= headerName %></td>
		 		<td><%= request.getHeader(headerName) %></td>
		 	</tr>
		<%
			}
	 	%>
	 </table>
	 
	 <h3>2) URL / URI, 요청 방식과 관련된 메소드</h3>
	 
	 <table border="1">
	 	<tr>
	 		<th>이름</th>
	 		<th>값</th>
	 	</tr>
	 	<tr>
	 		<td>서버 도메인명</td>
	 		<td><%= request.getServerName() %></td>
	 	</tr>
	 	<tr>
	 		<td>서버 포트 번호</td>
	 		<td><%= request.getServerPort() %></td>
	 	</tr>
	 	<tr>
	 		<td>서버 URL</td>
	 		<td><%= request.getRequestURL() %></td>
	 	</tr>
	 	<tr>
	 		<td>서버 URI</td>
	 		<td><%= request.getRequestURI() %></td>
	 	</tr>
	 	<tr>
	 		<td>프로토콜</td>
	 		<td><%= request.getProtocol() %></td>
	 	</tr>
	 	<tr>
	 		<td>요청 방식</td>
	 		<td><%= request.getMethod() %></td>
	 	</tr>
	 	<tr>
	 		<td>요청 쿼리</td>
	 		<td><%= request.getQueryString() %></td>
			<!-- 물음표 뒤에 어떠한 특정 값을 입력하면 가져온다. -->
			<!-- http://localhost:8088/02_JSP/views/objects/?userName=swimming&userAge=20 -->
	 	</tr>
	 	<tr>
	 		<td>웹 애플리케이션 경로</td>
	 		<td><%= request.getContextPath() %></td>
	 	</tr>
	 	<tr>
	 		<td>클라이언트 호스트명</td>
	 		<td><%= request.getRemoteHost() %></td>
	 	</tr>
	 	<tr>
	 		<td>클라이언트 IP 주소</td>
	 		<td><%= request.getRemoteAddr() %></td>
	 	</tr>
	 </table>
	 
	 <h2>2. response 객체</h2>
	 <p>
	 	웹 브라우저의 요청에 대한 응답 객체이다.
	 </p>
	 
	 <h3>1) Redirect</h3>
	 
	 <a href="redirect.jsp">View Details</a>
	 
	 <h2>3. pageContext 객체</h2>
	 <p>
	 	JSP에서 다른 내장 객체를 얻어내거나 현재 페이지의 요청과 응답의 제어권을 다른 페이지로 넘겨주는데 사용하는 객체이다.
	 </p>
	 
	 <h3>1) Forward</h3>
	 
	 <a href="forward.jsp">View Details</a>
	 
	 <h2>4. session</h2>
	 <p>
	 	웹 브라우저의 정보를 유지하기 위한 세션 정보를 저장하고 있는 객체이다.
	 </p>
	 
	 <%
// 	 	사용자에 대한 정보가 유지되어야 할 때 키 값을 넣고 사용
// 		브라우저가 종료되면 연결되어 있던 session도 종료된다.
// 		클라이언트와 서버의 관계(상태)를 유지해주는 기능이며, 이 기능을 사용할 수 있도록 제공하는 객체는 -> session 객체
	 	session.setAttribute("userId", "swimming");
// 		클라이언트의 요청이 없더라도 세션을 유지할 시간을 초 단위로 설정한다.
		session.setMaxInactiveInterval(10);

// 		서버에서 생성
		Cookie cookie = new Cookie("userName", "황수영");
		response.addCookie(cookie);
		
// 		Cookie[] cookies = request.getCookies();
// 		Arrays.stream(cookies).forEach(cookie -> System.out.println(cookie.getValue()));
	 %>
	 
	 세션 ID : <%= session.getId() %> <br>
	 isNew() : <%= session.isNew() %> <br>
	 생성 시간 : <%= new Date(session.getCreationTime()) %> <br>
	 최종 접속 시간 : <%= new Date(session.getLastAccessedTime()) %> <br>
	 userId : <%= session.getAttribute("userId") %>
	 
	 <h2>5. application 객체</h2>
	 <p>
	 	웹 애플리케이션(컨텍스트)의 실행 환경을 제공하는 서버의 정보를 저장하고 있는 객체이다.
	 </p>
	 
	 <table border="1">
	 	<tr>
	 		<td>컨테이너 정보</td>
	 		<td><%= application.getServerInfo()%></td>
	 	</tr>
	 	<tr>
	 		<td>웹 모듈 버전</td>
	 		<td><%= application.getMajorVersion() %>.<%= application.getMinorVersion() %></td>
	 	</tr>
	 	<tr>
	 		<td>웹 애플리케이션의 실제 파일 시스템 경로</td>
			<%-- <td><%= application.getRealPath("/") %></td> --%>
	 		<td><%= application.getRealPath("/views/error/error.jsp") %></td>
	 	</tr>
	 </table>
</body>
</html>