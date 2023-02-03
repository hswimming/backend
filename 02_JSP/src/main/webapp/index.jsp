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
	
</body>
</html>