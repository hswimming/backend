<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL / JSTL</title>
</head>
<body>
	<h1>주문 내역</h1>
	<p>
		param : 전달된 파라미터 값을 받아올 때 사용하는 내장 객체이다. <br>
		paramValues : 전달된 파라미터 값들을 배열로 받아올 때 사용하는 내장 객체이다. (name 속성 값이 많을 때 사용)
	</p>
	
	<!-- param 내장 객체를 이용하여 접근 -->
	상품명 : ${ param.pName } <br>
	수량 : ${ param.pCount } <br>
	옵션 1 : ${ paramValues.option[0] } <br>
	옵션 2 : ${ paramValues.option[1] }
	
	<!-- 가장 첫번째에 있는 요소에만 접근 (하나의 값) -->
	<%-- 옵션 : ${ param.option } --%>
	
</body>
</html>