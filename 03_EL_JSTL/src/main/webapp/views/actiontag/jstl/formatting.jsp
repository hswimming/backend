<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Formatting Library</title>
</head>
<body>
	<h1>JSTL Formatting Library</h1>
	
	톰캣 서버의 Locale : ${ pageContext.response.locale} <br>
	
	<%--
	<fmt:setLocale value="ja_JP"/>
	<fmt:setLocale value="en_US"/>
	--%>
	
	톰캣 서버의 Locale : ${ pageContext.response.locale} <br>
	
	<h2>1. fmt:formatNumber 태그</h2>
	<p>
		숫자 데이터의 출력 형식을 지정할 때 사용하는 태그이다.
	</p>
	
	<!-- groupingUsed : 숫자 단위의 구분자(,) 표시 여부 지정 (기본값 : true) -->
	숫자 그대로 출력 : <fmt:formatNumber value="123456789" groupingUsed="false" /><br>
	세자리씩 구분하여 출력 : <fmt:formatNumber value="123456789" groupingUsed="true" />
	
	<br><br>
	
	<!--
		pattern : 화면에 표시할 숫자 데이터의 패턴을 지정한다.
				  #, 0을 패턴 기호로 사용하여 지정한다.
				  패턴 기호가 부족한 부분에 대해서는 #은 표시하지 않지만 0은 0으로 표시한다.
				  패턴 기호를 초과하는 부분은 반올림 된다.
	-->
	<%-- <fmt:formatNumber value="1.23" pattern="#"/> --%>
	<%-- <fmt:formatNumber value="1.23" pattern="#.#"/> --%>
	<fmt:formatNumber value="1.23" pattern="#.###"/><br>
	
	<%-- <fmt:formatNumber value="1.23" pattern="0"/> --%>
	<%-- <fmt:formatNumber value="1.23" pattern="0.0"/> --%>
	<fmt:formatNumber value="1.23" pattern="0.000"/>
	
	<br><br>
	
	<fmt:formatNumber value="1.2346" pattern="#.###"/><br>
	<fmt:formatNumber value="1.2346" pattern="0.00000"/>
	
	<br><br>
	
	<!-- 
		type : number (숫자, 기본값), currency(통화), percent(백분율)
	-->
	숫자 : <fmt:formatNumber value="50000" /><br>
	숫자 : <fmt:formatNumber type="number" value="50000" /><br>
	통화 : <fmt:formatNumber type="currency" value="50000" /><br> <!-- 현재 지역에 따라 알맞게 기호가 사용된다. -->
	통화 : <fmt:formatNumber type="currency" value="50000" currencySymbol="$" /><br>
	백분율 : <fmt:formatNumber value="0.7" /><br>
	백분율 : <fmt:formatNumber type="percent" value="0.7" />
	
	<h2>2. fmt:formatDate 태그</h2>
	<p>
		날짜와 시간 데이터의 출력 형식을 지정할 때 사용하는 태그이다.
	</p>
	
	<c:set var="date" value="<%= new Date() %>"/>
	
	<ul>
		<li>날짜 : <fmt:formatDate value="${ date }"/></li>
		<li>날짜 : <fmt:formatDate type="date" value="${ date }"/></li>
		<li>시간 : <fmt:formatDate type="time" value="${ date }"/></li>
		<li>날짜와 시간 : <fmt:formatDate type="both" value="${ date }"/></li>
		<li>날짜와 시간 (short) : <fmt:formatDate type="both" value="${ date }" dateStyle="short" timeStyle="short"/></li>
		<li>날짜와 시간 (medium) : <fmt:formatDate type="both" value="${ date }" dateStyle="medium" timeStyle="medium"/></li>
		<li>날짜와 시간 (long) : <fmt:formatDate type="both" value="${ date }" dateStyle="long" timeStyle="long"/></li>
		<li>날짜와 시간 (full) : <fmt:formatDate type="both" value="${ date }" dateStyle="full" timeStyle="full"/></li>
		<li>날짜와 시간 (pattern) : <fmt:formatDate type="both" value="${ date }" pattern="yyyy-MM-dd(E) HH:mm:ss(a)"/> </li>
	</ul>
</body>
</html>