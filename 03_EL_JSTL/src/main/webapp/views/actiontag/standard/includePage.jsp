<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String year = "2023";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp:include 액션 태그</title>
</head>
<body>
	<h2>Include 페이지</h2>
	
	includePage.jsp의 year 변수 값은 <%= year %> 입니다.
	
	<br><br>
	
	pName : ${ param.pName } <br>
	
</body>
</html>