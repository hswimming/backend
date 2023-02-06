<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    
<!-- isErrorPage="true" 속성이 들어가야 exception 내장 객체 생성 가능 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직접 errorPage 처리</title>
</head>
<body>
	<h1 style="color: red">에러가 발생했습니다. 관리자에게 문의해 주세요.</h1>
	
	<%= exception %>
	<%= exception.getMessage()%>
</body>
</html>