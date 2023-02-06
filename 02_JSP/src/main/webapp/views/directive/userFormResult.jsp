<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");

	// 폼 파라미터 값 읽어오기
	String userName = request.getParameter("userName");
	String userAge = request.getParameter("userAge");
	String gender = request.getParameter("gender");
	String[] foods = request.getParameterValues("food");

	System.out.println(userName);
	System.out.println(userAge);
	System.out.println(gender);
// 	Arrays.stream(foods).forEach(System.out::println);
// 	Arrays.stream(foods).forEach((String food) -> { System.out.println(food); });
	Arrays.stream(foods).forEach(food -> System.out.println(food));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 정보 출력</title>
</head>
<body>
	<h2>개인 정보 출력</h2>
	<%= userName %>님은 <%= userAge %>세 이고 성별은 <%= gender %>입니다. <br>
	좋아하는 음식은
	<%
		for(String food : foods) {
	%>
		<span style="color : red">
			<%= food %>		
		</span>
	<%
		}
	%>
	입니다.
</body>
</html>