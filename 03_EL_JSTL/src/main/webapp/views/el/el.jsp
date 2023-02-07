<%@page import="com.kh.el.model.vo.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 	상위 클래스 참조 불가, 형변환 필요
// 	Request 영역에 저장된 속성(Atribute)을 가져온다.
// 	String classRoom = (String) request.getAttribute("classRoom");
// 	Student student = (Student) request.getAttribute("student");

// 	Session 영역에 저장된 속성(Atribute)을 가져온다.
// 	String classRoom = (String) session.getAttribute("classRoom");
// 	Student student = (Student) session.getAttribute("student");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL</title>
</head>
<body>
	<h1>EL</h1>
	
	<h2>1. 기존 방식으로 request, session 객체에 담겨있는 데이터를 출력</h2>
	<%--
	강의장 : <%= classRoom %> <br>
	수강생 : <%= student.getName() %>, <%= student.getAge() %> <br>
	--%>
	
	<h2>2. EL 방식으로 request, session 객체에 담겨있는 데이터를 출력</h2>
	
	<%-- $ 와 { } 사이에 띄어쓰기를 하면 문자열로 인식하지 못한다. --%>
	<!--
		1. EL은 영역 객체에 저장된 속성명을 검색해서 존재하는 경우 값을 가져온다.
			- Page 영역 -> Request 영역 -> Session 영역 -> Application 영역 순으로 해당 속성을 찾아서 값을 가져온다. 
			
		2. EL은 인스턴스의 필드에 직접 접근하는 것 처럼 보이지만 내부적으로는 해당 인스턴스의 Getter 메소드로 접근해서 값을 읽어온다.
	-->
	강의장 : ${ classRoom } <br>
	수강생 : ${ student.name }, ${ student.age } <br>
	
	<br><br>
	
	강의장 : ${ sessionScope.classRoom } <br>
	수강생 : ${ sessionScope.student.name }, ${ sessionScope.student.age } <br>
	
	<h2>3. EL 사용 시 내장 객체에 저장된 속성명이 같은 경우</h2>
	<%
		pageContext.setAttribute("scope", "Page 영역");
	%>
	
	scope : ${ scope } <br>
	pageScope : ${ pageScope.scope } <br>
	requestScope : ${ requestScope.scope } <br>
	sessionScope : ${ sessionScope.scope } <br>
	applicationScope : ${ applicationScope.scope } <br>
	
	<h2>4. ContextPath 가져오기</h2>
	<h3>1) 표현식 태그를 사용하는 방법</h3>
	ContextPath : <%= request.getContextPath() %> <br> <%-- 웹 애플리케이션을 찾는 경로 --%>
	
	<h3>2) EL을 사용하는 방법</h3>
	<!-- EL에는 request에 직접 접근할 수 있는 내장 객체가 없다. -->
	<!-- pageContext라는 내장 객체에 접근, contextPath를 이용하여 get -->
	ContextPath : ${ pageContext.request.contextPath } <br>
	
	<h2>5. 헤더에 접근하기</h2>
	
	<h3>1) 표현식 태그를 사용하는 방법</h3>
	Host : <%= request.getHeader("Host") %> <%-- 읽고 싶은 헤더의 네임 값 --%> <br>
	User-Agent : <%= request.getHeader("User-Agent") %>
	
	<h3>2) EL을 사용하는 방법</h3>
	<!-- 헤더에 직접 접근할 수 있는 내장 객체 사용 후 헤더의 속성 값으로 접근 -->
	Host : ${ header.host } <br>
	<!-- 이름 값에 특수문자가 있을 경우 자바스크립트 처럼 -->
	User-Agent : ${ header['User-Agent'] }
	
	<!-- EL은 브라우저에서 처리되지 않고 서버에서 처리된다. -->
	
</body>
</html>