<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP(Java Server Page)</title>
</head>
<body>
	<h1>JSP(Java Server Page)</h1>
	
	<h2>1. JSP</h2>
	<p>
		JSP는 HTML 코드 안에서 스크립트 형태로 자바 언어를 사용하여 동적인 페이지를 구현한다. <br>
		서블릿에서 java 코드로 응답 HTML을 구현했던 복잡함을 간단하게 작성할 수 있다.
	</p>
	
	<h2>2. JSP 스트립트 요소</h2>
	<p>
		JSP 페이지에서 자바 코드를 직접 기술할 수 있게 해주는 요소이다.
	</p>
	
	<ol>
		<li>선언문 태그</li>
		<li>스크립트 릿</li>
		<li>표현식</li>
	</ol>
	
	<a href="views/elements">View Details</a>
	
	<h2>3. 지시자 태그</h2>
	<p>
		JSP 페이지 전체에 영향을 미치는 정보를 기술할 때 사용한다.
	</p>
	<ol>
		<li>page : JSP 페이지에 대한 속성을 지정한다.</li>
		<ul>
			<li>language : JSP 페이지 내부에서 사용할 스크립트 언어를 지정한다.</li>
			<li>contentType : 웹 브라우저에게 페이지 형식, 인코딩 방식을 지정해준다.</li>
			<li>pageEncoding : JSP 파일에 인코딩 방식을 지정한다.</li>
			<li>import : 자바의 import와 같은 의미로 JSP 페이지에서 사용할 클래스를 import 하는데 사용된다.</li>
			<li>errorPage : JSP 페이지에서 예외가 발생했을 때 해당 예외를 처리할 페이지(HTML, JSP)를 지정한다.</li>
			<li>isErrorPage : 현재 JSP 페이지가 예외를 처리하는 페이지라는 걸 지정한다.</li>
		</ul>
		
		<li>include : 다른 페이지(JSP, HTML)를 포함할 때 사용하는 지시자이다.</li>
		<li>taglib : JSP에서 사용할 태그 라이브러리를 지정한다.</li>
	</ol>
	
	<a href="views/directive">View Details</a>
	
	<h2>4. JSP 내장 객체</h2>
	<p>
		JSP 파일이 자바 코드로 생성될 때 (서블릿으로 생성될 때) 자동으로 추가되는 객체들을 내장 객체라고 한다. <br>
		즉, JSP 파일 내부에서 개발자가 직접 선언하지 않아도 바로 사용이 가능한 객체를 내장 객체라 한다.
	</p>
	<ol>
		<li>request</li>
		<li>response</li>
		<li>out</li>
		<li>session</li>
		<li>application</li>
		<li>page</li>
		<li>pageContext</li>
		<li>exception</li>
	</ol>
	
	<%-- <%= session.getAttribute("userId") %> <br>
	<%
		Cookie[] cookies = request.getCookies();
		Arrays.stream(cookies).forEach(cookie -> System.out.println(cookie.getValue()));
	%>
	--%>
	
	<a href="views/objects">View Details</a>
	
	<h2>5. 영역 객체</h2>
	<p>
		JSP에서 제공하는 내장 객체들 중에 pageContext, request, session, application 객체는 해당 객체에 정의된 유효한 범위를 갖는다. 
		해당 객체들은 유효한 범위 안에서 필요한 데이터를 서로 공유할 수 있고 이 공유되는 데이터를 속성(Attribute)이라 한다.
	</p>
	
	<ol>
		<li>Page 영역</li>
		<li>Request 영역</li>
		<li>Session 영역</li>
		<li>Application 영억</li>
	</ol>
	
	<a href="views/scope">View Details</a>
	
</body>
</html>