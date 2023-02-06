<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("age", "28");
	request.setAttribute("gender", "여자");
	
	System.out.println(pageContext.getAttribute("age"));
	
// 	pageContext.forward("scopeTest3.jsp");
	response.sendRedirect("scopeTest3.jsp");
%>