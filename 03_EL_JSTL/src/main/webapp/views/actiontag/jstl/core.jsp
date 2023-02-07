<%@page import="com.kh.el.model.vo.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 코어 라이브러리에서 제공하는 태그를 사용하기 위해 prefix="c" 지정 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core Library</title>
</head>
<body>
	<h1>JSTL Core Library</h1>
	
	<h2>1. 변수</h2>
	
	<h3>1) 변수 선언</h3>
	<p>
		변수를 선언하고 초기값을 대입하는 태그이다.
	</p>

	<%-- pageContext.setAttribute("num1", "10"); EL 구문이 사용 가능하다는건 아래와 같은 의미 --%>
	<!-- var : 변수명 / value : 값 -->
	<c:set var="num1" value="10"/>
	
	<%-- pageContext.setAttribute("num2", "20") 같은 역할을 하는 action tag 사용 --%>
	<c:set var="num2" value="20" scope="request"/>
	
	<%-- 다른 영역에 저장하고 싶을 경우 scope 속성을 사용 --%>
	<c:set var="result" value="${ num1 + num2 }" scope="session"/>
	
	<c:set var="array" scope="application">
		red, orange, yellow, green, blue <!-- ,(콤마)로 구분하면 배열로 선언 -->
	</c:set>
	
	<!-- EL 구문 사용 가능 -->
	num1 변수의 값 : ${ num1 } <br>
	num2 변수의 값 : ${ num2 } 또는 ${ requestScope.num2 } 또는 <%= request.getAttribute("num2") %> <br>
	result 변수의 값 : ${ result } 또는 ${ sessionScope.result } <br>
	array 배열의 값 : ${ array } <br>
	
	<h3>2) 변수 삭제</h3>
	<p>
		c:set 태그로 선언 변수를 삭제할 때 사용하는 태그이다.
	</p>
	
	<c:set var="result" value="99999" /> <!-- 페이지 스코프에 기본적으로 저장 -->
	<c:set var="result" value="10000" scope="request"/>
	
	삭제 전 : ${ result }
	
	<br><br>
	
	<c:remove var="result" scope="page"/>
	
	삭제 후 : ${ result }
	
	<c:remove var="result"/>
	
	<br><br>
	
	삭제 후 : ${ result }
	
	<h2>2. 출력</h2>
	<p>
		클라이언트로 데이터 출력할 때 사용하는 태그이다.
	</p>
	
	태그를 문자열로 출력 : <c:out value="<b>태그로 출력하기</b>" escapeXml="true" /> <br>
	태그로 해석되어 출력 : <c:out value="<b>태그로 출력하기</b>" escapeXml="false" /> <br>
	기본 값 출력 : <c:out value="${ result }" default="값이 없음"/>
	<!-- default : 없는 영역의 값을 조회할 경우 -->
	
	<h2>3. 조건문</h2>
	<h3>1) c:if 태그</h3>
	<p>
		자바의 if 구문과 같은 역할을 하는 태그이다.
		조건식은 test 속성에 EL 구문으로 기술해야 한다.
	</p>
	
	<c:if test="${ num1 > num2 }">
		<b>num1이 num2보다 크다</b>
	</c:if>
	
	<!-- 조건을 만족하는 경우에만 출력 -->
	<c:if test="${ num1 < num2 }">
		<b>num1이 num2보다 작다</b>
	</c:if>
	
	<%-- 위 코드가 아래 코드보다 간결하다.
	<%
		if(10 > 20) {
	%>
		<b>10이 20보다 크다</b>	
	<%
		}
	%>	
	--%>
	
	<h3>2. c:choose 태그</h3>
	<p>
		자바의 switch 구문과 같은 역할을 하는 태그이다. <br>
		하위 태그인 c:when, c:otherwise 태그와 함께 사용되는데, 각각 switch 구문의 case, default 절과 비슷한 역할을 한다.
	</p>
	
	<c:choose>
		<c:when test="${ num1 > num2 }">
			<b>num1이 num2보다 크다</b>
		</c:when>
		
		<c:when test="${ num1 < num2 }">
			<b>num1이 num2보다 작다</b>
		</c:when>
	
		<c:otherwise>
			<b>num1과 num2가 같다.</b>
		</c:otherwise>
	</c:choose>
	
	<!--
	if 구문과 choose 구문의 차이?
	if 구문은 조건을 만족해도 아래 조건들도 확인하지만, choose 구문은 조건이 만족하면 아래 조건들을 확인하지 않는다.
	-->
	
	<h2>4. 반복문</h2>
	<h3>1) c:forEach</h3>
	<p>
		자바의 for 구문에 해당하는 역할을 하는 태그이다.
	</p>
	
	<h4>자바의 for 구문처럼 사용하기</h4>
	
	<!-- step : 0 보다 작거나 같은 값이 올 수 없다. -->
	<c:forEach var="i" begin="1" end="6" step="2">
		<%--
		${ i } <br>
		--%>
		<%-- 태그 안에도 EL 적용 가능 --%>
		<h${ i }>반복 확인 ${ i }</h${ i }>
	</c:forEach>
	
	<h4>자바의 향상된 for 구문처럼 사용하기</h4>
	<c:forEach var="color" items="${ array }">
		<span style="color : ${ color };">배열 확인 : ${ color }</span> <br>
	</c:forEach>
	
	<%
		List<Student> list = new ArrayList<>();
	
		list.add(new Student("황수영", 28, 80, 80));
		list.add(new Student("짱구", 5, 70, 90));
		list.add(new Student("짱아", 3, 70, 70));
		list.add(new Student("흰둥이", 10, 100, 100));
		
		pageContext.setAttribute("list", list);
	%>
	
	<h5>학생 목록 조회</h5>
	<table border="1">
		<tr>
			<th>인덱스</th>
			<th>순번</th>
			<th>이름</th>
			<th>나이</th>
			<th>수학 점수</th>
			<th>영어 점수</th>
			<th>First</th>
			<th>Last</th>
		</tr>
		<c:forEach var="student" items="${ list }" varStatus="status">
			<tr>
				<td>${ status.index }</td>
				<td>${ status.count }</td>
				<td>${ student.name }</td>
				<td>${ student.age }</td>
				<td>${ student.math }</td>
				<td>${ student.english }</td>
				<td>${ status.first }</td> <!-- 첫번째 반복인지 확인 -->
				<td>${ status.last }</td> <!-- 마지막 반복인지 확인 -->
			</tr>
		</c:forEach>
	</table>
	
		<%-- 원래 형태
		<%
			for(Student s : list) {
		%>
		<%
			}
		%>
		--%>
	
</body>
</html>