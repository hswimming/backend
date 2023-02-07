<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp:include 액션 태그</title>
</head>
<body>
	<h1>jsp:include 액션 태그</h1>
	<p>
		include 액션 태그는 다른 페이지를 포함 시킬 때 사용하는 액션 태그이다.
	</p>
	
	<h2>1. include 지시어</h2>
	<p>
		다른 페이지를 포함하는 JSP 파일이 컴파일 되기 전에 아래의 페이지가 삽입된다.
	</p>
	<%--
	<%@ include file="includePage.jsp" %>
	
	<%
		// 현재 페이지와 포함하는 페이지 (includePage.jsp) 변수명 중복, 에러 발생
		String year = "2024";
	%>
	--%>
	
	<h2>2. include 액션 태그</h2>
	<p>
		다른 페이지를 포함하는 JSP 파일이 화면에 출력되는 시점(런타임)에 삽입된다.
	</p>
	
	<!-- 페이지로 호출이 넘어간다. -->
	<jsp:include page="includePage.jsp" />
	
	<%
		String year = "2024";
	%>
	
	include.jsp 페이지의 year 변수 값은 <%= year %> 입니다.
	
	<br><br>
	
	<!-- jsp:param 액션 태그를 이용해서 포함되는 페이지로 값을 전달할 수 있다. -->
	<jsp:include page="includePage.jsp">
		<jsp:param name="pName" value="아이폰13pro"/>
	</jsp:include>
	
</body>
</html>