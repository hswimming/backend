<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Function Library</title>
</head>
<body>
	<h1>JSTL Function Library</h1>
	<c:set var="str" value="java oracle HTML5 CSS3 Javascript jQuery Servlet JSP" />
	
	원본 : ${ str } <br>
	
	<br><br>
	
	문자열 길이 : ${ fn:length(str) } <br>
	대문자로 변경 : ${ fn:toUpperCase(str) } <br>
	소문자로 변경 : ${ fn:toLowerCase(str) } <br>
	CSS3의 위치 : ${ fn:indexOf(str, 'CSS3') } <br>
	JSP를 JSTL로 변경 : ${ fn:replace(str, 'JSP', 'JSTL') } <br>
	
	<br><br>
	
	원본 : ${ str } <br>
	
</body>
</html>