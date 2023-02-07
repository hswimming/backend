<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.el.model.vo.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL / JSTL</title>
</head>
<body>
	<h1>EL 연산자</h1>
	
	<h2>1. 산술 연산자</h2>
	10 + 5 = ${ 10 + 5 } <br>
	10 - 5 = ${ 10 - 5 } <br>
	10 * 5 = ${ 10 * 5 } <br>
	<%-- 10 / 5 = ${ 10 / 5 } 또는 ${ 10 div 5 } <br> --%>
	10 % 7 = ${ 10 % 7 } 또는 ${ 10 mod 7 } <br>
	
	<h2>2. 논리 연산자</h2>
	true && false = ${ true && false } 또는 ${ true and false } <br>
	true || false = ${ true || false } 또는 ${ true or false } <br>
	!(10 > 5) = ${ !(10 > 5) } 또는 ${ not(10 > 5) } <br>

	<h2>3. 비교 연산자</h2>	
	<h3>1) 객체 동등 비교</h3>
	<%
		// EL은 영역 객체의 속성(Attribute)에 접근해서 값을 가져오기 때문에 스크립트릿에 선언된 변수는 가져올 수 없다.
		String str1 = "안녕";
		String str2 = new String("안녕");
		
		Student student1 = new Student("홍길동", 20, 80, 80);
// 		Student student2 = new Student("황수영", 19, 70, 70);
		Student student2 = new Student("홍길동", 20, 80, 80);
		
		System.out.println(str1 == str2);
		System.out.println(str1.equals(str2));
		
		// Page 영역에 데이터를 저장
		pageContext.setAttribute("str1", str1);
		pageContext.setAttribute("str2", str2);
		pageContext.setAttribute("student1", student1);
		pageContext.setAttribute("student2", student2);
	%>
	
	<%--
	<!-- 영역 객체 안에 해당하는 속성으로 들어가 있어야 출력 -->
	<!-- str1, str2 는 영역 객체 안에 있지 않기 때문에 setAttribute로 추가시켜야 된다. -->
	str1 : ${ str1 } <br>
	str2 : ${ str2 } <br>
	student 1 : ${ student1 } <br> 
	student 2 : ${ student2 } <br> 
	--%>
	
	<table border="1">
		<tr>
			<th>비교식</th>
			<th>표현식 태그</th>
			<th>EL</th>
		</tr>
		<tr>
			<td>str1 == str2</td>
			<!-- 주소값을 비교하기 때문에 false -->
			<td><%= str1 == str2 %></td>
			<!-- EL의 == 연산은 equals()와 같은 동작을 한다. (실제 값을 비교) -->
			<td>${ str1 == str2 } 또는 ${ str1 eq str2 }</td>
		</tr>
		<tr>
			<td>str1 != str2</td>
			<td><%= str1 != str2 %></td>
			<td>${ str1 != str2 } 또는 ${ str1 ne str2 }</td>
		</tr>
		<tr>
			<td>student1 == student2</td>
			<td><%= student1 == student2 %></td>
			<td>${ student1 == student2 } 또는 ${ student1 eq student2 }</td>
		</tr>
		<tr>
			<td>student1 != student2</td>
			<td><%= student1 != student2 %></td>
			<td>${ student1 != student2 } 또는 ${ student1 ne student2 }</td>
		</tr>
	</table>
	
	<h3>2) 숫자 비교 연산</h3>
	<%
		// 숫자 타입으로 자동 형변환이 일어난다.
// 		pageContext.setAttribute("big", "10");
		// 숫자 타입으로 자동 형변환이 될 수 없기 때문에 에러 발생
// 		pageContext.setAttribute("big", "a");
		// a라는 문자의 아스키코드 값과 연산 (97)
// 		pageContext.setAttribute("small", 'a');
		pageContext.setAttribute("big", 10);
		pageContext.setAttribute("small", 3);
	%>
	
	<%--
	<!-- object 타입끼리는 연산이 되지 않기 때문에 형변환을 해줘야 한다. -->
	<!-- 나중에 언박싱이 되기 때문에 Integer로 형변환 가능 (꺼낼때 다시 object) -->
	표현식 태그 : <%= (Integer)pageContext.getAttribute("big") + (Integer)pageContext.getAttributesScope("small") %>
	
	<br>
	
	표현식 태그 : <%= (Integer)pageContext.getAttribute("big") > (Integer)pageContext.getAttributesScope("small") %>
	--%>
	
	<br><br>
	
	<!-- object 타입을 자동으로 형변환하여 연산 진행 (Attribute의 name 값을 가진다.)  -->
	EL : ${ big + small }
	
	<br>
	
	EL : ${ big > small }
	
	<br><br>
	
	<!-- 태그로 인식할 수 있기 때문에 엔티티 기호표 이용 -->
	big &gt; small : ${ big > small } 또는 ${ big gt small } <br>
	big &lt; small : ${ big < small } 또는 ${ big lt small } <br>
	big &ge; small : ${ big >= small } 또는 ${ big ge small } <br>
	big &le; small : ${ big <= small } 또는 ${ big le small } <br>
	
	<h3>3) 객체가 null 또는 비어있는지 체크하는 연산자</h3>
	<%
		String str3 = null;
		List<String> list = new ArrayList<>(); // 비어있는 객체
		
		list.add("안녕하세요^^"); // 요소 추가
		
		pageContext.setAttribute("str3", str3);
		pageContext.setAttribute("list", list);
		
// 		컬렉션으로 가지고 있는 요소가 있는지 없는지 체크
// 		System.out.println(list.isEmpty());
	%>
	
	표현식 태그 : <%= str3 == null %>, <%= list.isEmpty() %>
	
	<br><br>
	
	<!-- empty : null 체크와 is Empty (비어있는지) 한번에 체크 가능 -->
	EL : ${ str3 == null }, ${ empty str3} <br>
	EL : ${ list == null }, ${ empty list }
	
	<br><br>
	
	EL : ${ str3 != null }, ${ not empty str3} <br>
	EL : ${ list != null }, ${ not empty list } <br>
	
</body>
</html>