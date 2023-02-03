<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../error/error.jsp"%>
    
<%
	LocalDateTime now = LocalDateTime.now();
	String today = now.format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일"));
	
// 	에러페이지 확인을 위한 코드
// 	int result = 10 / 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지시자 태그</title>
</head>
<body>
	<header>
		<h1>지시자 태그</h1>
		오늘은 <%= today %> 입니다.
	</header>