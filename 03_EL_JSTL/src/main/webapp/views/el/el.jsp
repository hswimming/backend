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
	
</body>
</html>