<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<title>AJAX(Asynchronous Javascript And XML)</title>
</head>
<body>
	<h1>AJAX(Asynchronous Javascript And XML)</h1>
	
	<h2>1. Javascript를 이용한 AJAX 테스트</h2>
	<h3>1) GET 방식으로 서버에 데이터 전송 및 응답</h3>
	
	<button onclick="jsAjaxTest1();">GET 방식 전송</button>
	
	<p id="p1" style="border: 1px solid; width: 400px; height: 100px"></p>
	
	<script>
		function jsAjaxTest1() {
// 			alert("버튼 클릭!");

			// 1. XMLHttpRequest 객체 생성
			let xhr = new XMLHttpRequest();
			
// 			if (window.XMLHttpRequest) { // 모질라, 사파리, IE7+ ...
// 			    xhr = new XMLHttpRequest();
// 			} else if (window.ActiveXObject) { // IE 6 이하
// 			    xhr = new ActiveXObject("Microsoft.XMLHTTP");
// 			} else {
// 				xhr = null;
// 			}

			// 2. onreadystatechange 속성에 콜백 함수 지정
			xhr.onreadystatechange = function() {
				// 1) 서버 응답 상태 확인
				//	  0 : 요청이 초기화 되지 않은 상태
				//	  1 : 서버와 연결이 설정된 상태
				// 	  2 : 서버가 요청을 받은 상태 
				//	  3 : 서버가 요청을 처리하는 상태
				//	  4 : 서버가 요청에 대한 처리를 끝내고 응답을 준비하는 상태
				
				console.log('readyState : ' + xhr.readyState)
				
				if(xhr.readyState === 4) {
					// 2) HTTP 응답 상태 코드 확인
					//	  200 : OK
					//	  404 : Not Found
					//	  500 : Internal Server Error
					//	  ...
					
					console.log('status : ' + xhr.status);
					
					if(xhr.status === 200) {
						// 서버에서 응답한 데이터를 담고있는 속성(프로퍼티)
						console.log(xhr.responseText)
// 						console.log('통신 성공 : ' + xhr.status)

						document.getElementById('p1').innerHTML = xhr.responseText;
					} else {
						console.log('통신 실패 : ' + xhr.status)
					}
				}
			};
			
			// 3. open() 호출
			xhr.open('GET', "${pageContext.request.contextPath}/jsAjax.do?name=황수영&age=20", true);
			
			// 4. send() 호출
			xhr.send(); // send() 호출함으로서 실질적으로 서버에 요청
		}
	</script>
	
	<h3>2) POST 방식으로 서버에 데이터 전송 및 응답</h3>
	
	<button onclick="jsAjaxTest2();">POST 방식 전송</button>
	
	<p id="p2" style="border: 1px solid; width: 400px; height: 100px"></p>
	
	<script>
		function jsAjaxTest2() {
// 			alert("버튼 클릭!");

			// 1. XMLHttpRequest 객체 생성
			let xhr = new XMLHttpRequest();
			
			// 2. onreadystatechange 속성에 콜백 함수 지정
			xhr.onreadystatechange = () => { // this에 접근하는 게 아닐 경우 애로우 펑션 사용 가능
// 				console.log(xhr.readyState);
			
				if (xhr.readyState === XMLHttpRequest.DONE) {
					if (xhr.status === 200) {
						console.log('통신 성공' + xhr.status);
						
						document.getElementById('p2').innerHTML = xhr.responseText;
					} else {
						console.log('통신 실패' + xhr.status);
					}
				}
			};
			
			// 3. open() 호출
			xhr.open('POST', '${pageContext.request.contextPath}/jsAjax.do', true);
			
			// * POST 요청의 겅우 send() 호출 전에 아래와 같이 요청 헤더를 추가해야 한다.
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			
			// 4. send() 호출
			xhr.send("name=황수영&age=20");
		};
	</script>
	
	<h2>2. jQuery를 이용한 AJAX 테스트</h2>
	<h3>1) GET 방식으로 서버에 데이터 전송 및 응답</h3>
	<label for="input">입력 : </label>
	<input type="text" id="input" size="30">
	
	<br>
	
	<label for="output">출력 : </label>
	<input type="text" id="output" size="30" readonly>
	
	<br><br>
	
	<button id="btn1">GET 방식 전송</button>
	
	<h3>2) POST 방식으로 서버에 데이터 전송 및 응답</h3>
	<label for="name">이름 : </label>
	<input type="text" id="name">
	
	<br>
	
	<label for="age">나이 : </label>
	<input type="text" id="age">
	
	<br>
	
	<label for="output2">출력 : </label>
	<input type="text" id="output2" size="30" readonly>
	
	<br><br>
	
	<button id="btn2">POST 방식 전송</button>
	
	<script>
		$(document).ready(function() {
			$('#btn1').on('click', function() {
				let input = $('#input').val();
				
				$.ajax({
					// type 속성 : 전송 방식(GET, POST)
					type: 'GET',
					
					// 요청 URL (서버에 요청하는 URL, 필수 작성)
					url: '${ pageContext.request.contextPath }/jqAjax1.do',
					
					// 요청 시 전달할 파라미터 설정 (data 뒤에 객체 형태로 넣는다.)
					data: {
						input // 프로퍼티명이 input, 실제 값은 input 값 ('input' : input) 변수명이 동일하기 때문에 한번만 작성
					},
					
					// AJAX 통신 성공 시 실행될 콜백 함수
					success: function(data) { // 서버에서 전달해주는 data
						console.log(data);
					
						$('#output').val(data); // 서버로부터 받은 data
					},
					
					// AJAX 통신 실패 시 실행될 콜백 함수
					error: function(error) { // error에 대한 정보를 담고 있는 객체를 매개값으로 전달
						console.log(error);
					},
					
					// AJAX 통신 (성공/실패) 여부와 상관없이 실행될 콜백 함수
					complete: function() {
						console.log('complete 콜백 함수 실행');
					}
				});
// 				alert('안녕하세요^^' + ' ' + input);
			});
			
			$('#btn2').on('click', function() {
				let name = $('#name').val();
				let age = $('#age').val();
				
				$.ajax({ // 객체 형태로 요청 정보만 넘기면 된다.
					type: 'POST',
					url: '${ pageContext.request.contextPath }/jqAjax1.do',
					data: {
						'name': name,
						age // 객체의 속성명과 값의 변수명이 동일 할 경우 한번만 작성 가능 ('age' : age)
					},
					
					success: (data) => {
						console.log(data);
						
						$('#output2').val(data);
					},
					
					error: () => {
						console.log(error);
					}
				});
// 				alert('버튼 클릭!' + ' ' + name + ', ' + age);
			});
		});
	</script>
</body>
</html>