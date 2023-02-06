<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영역(Scope) 객체</title>
</head>
<body>
	<h2>Session 영역과 Application 영역의 비교</h2>
	
	<!-- 저장한 값을 꺼내온다. -->
	현재 Session 영역에 저장된 데이터 : <%= session.getAttribute("address") %> <br>
	현재 Application 영역에 저장된 데이터 : <%= application.getAttribute("name") %>

</body>
</html>