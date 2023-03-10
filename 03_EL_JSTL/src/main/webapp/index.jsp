<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>

<%
	// method="POST" 인 경우 인코딩 처리
	request.setCharacterEncoding("UTF-8"); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL / JSTL</title>
</head>
<body>
	<h1>EL / JSTL</h1>
	
	<h2>1. EL(Expression Language)</h2>
	
	<p>
		EL은 JSP 2.0 버전에서 추가된 표현 언어이다. <br>
		표현식 태그를 대신하여 클라이언트에 출력하고자 하는 값들을 좀 더 간결하게 출력할 수 있다.
	</p>
	
	<h3>1) EL</h3>
	
	<a href="el.do">View Details</a>
	
	<h3>2) EL 파라미터</h3>
	<!-- <form action="/elParam.jsp" method="GET"> /만 작성하면 톰캣 바로 밑 -->
	
	<!-- <form action="03_EL_JSTL/views/el/elParam.jsp" method="GET"> 폴더 그대로 경로 지정 -->
	
	<!-- contextPath가 배포하는 환경에 따라 바뀔 수 있기 때문에 EL 구문이나 표현식을 사용하여 경로 지정 -->
	<%-- <form action="${ pageContext.request.contextPath }/views/el/elParam.jsp" method="GET"> --%>
	
	<!-- method="POST" 인 경우 파라미터 값을 꺼내오기 전에 인코딩 처리를 해야 한글이 깨지지 않는다. -->
	<form action="${ pageContext.request.contextPath }/views/el/elParam.jsp" method="POST">
		<fieldset>
			<legend>제품 입력</legend>
			<input type="text" name="pName" placeholder="제품명을 입력하세요."> <br>
			<input type="number" name="pCount" placeholder="수량을 입력하세요."> <br>
			<input type="text" name="option" placeholder="옵션을 입력하세요."> <br>
			<input type="text" name="option" placeholder="옵션을 입력하세요.">
			
			<br><br>
			
			<input type="submit" value="전송">
		</fieldset>
	</form>
	
	<h3>3) EL 연산자</h3>
	
	<a href="views/el/elOperators.jsp">View Details</a>
	
	<h2>2. JSP Action Tag</h2>
	<p>
		JSP 페이지에서 자바 코드를 직접 입력하지 않고 특정 작업을 수행하는데 사용하는 태그이다. <br>
		액션 태그의 경우 웹 브라우저에서 실행되는 것이 아니라 웹 컨테이너에서 실행된다
	</p>
	
	<h3>1) 표준 액션 태그</h3>
	<p>
		JSP에서 기본으로 제공하는 액션 태그로 별도의 라이브러리 설치 없이 바로 사용할 수 있다.
	</p>
	
	<a href="${ contextPath }/views/actiontag/standard/include.jsp">jsp:include</a>
	<a href="${ contextPath }/views/actiontag/standard/forward.jsp">jsp:forward</a>
	
	<h3>2) JSTL(JSP Standard Tag Library)</h3>
	<p>
		JSP 페이지에서 자주 사용하는 코드들을 사용하기 쉽게 태그로 만들어 표준으로 제공한다.
	</p>
	
	<h4>2-1) JSTL Core Library</h4>
	
	<p>
		변수와 URL, 조건문, 반복문 등의 로직과 관련된 액션 태그를 제공한다.
	</p>
	
	<a href="${ contextPath }/views/actiontag/jstl/core.jsp">JSTL Core</a>
	
	<h4>2-2) JSTL Formatting Library</h4>
	<p>
		날짜, 시간, 숫자 데이터의 출력 형식을 지정할 때 사용하는 액션 태그를 제공한다.
	</p>
	
	<a href="${ contextPath }/views/actiontag/jstl/formatting.jsp">JSTL Formatting</a>
	
	<h4>2-3) JSTL Function Library</h4>
	<p>
		문자열 처리에 관한 메소드들을 EL 구문에서 사용할 수 있게 하는 라이브러리이다.
	</p>
	
	<a href="${ contextPath }/views/actiontag/jstl/function.jsp">JSTL Function</a>
	
</body>
</html>