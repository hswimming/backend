package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Method.do")
public class MethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MethodServlet() {
        
    
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		사용자가 보낸 데이터들은 request 객체 안에 키(name 속성의 값), 값(value 속성의 값) 형태로 담겨있다.
//		request.getParameter("name 속성의 값") : 해당 name 속성의 값을 가지는 요소의 value 값을 문자열로 읽어온다.
		String userName = request.getParameter("userName");
		String userAge = request.getParameter("userAge");
		String gender = request.getParameter("gender");
//		String food = request.getParameter("food");
		
		String[] foods = request.getParameterValues("food");
//		체크 박스와 같이 하나의 name 속성에 여러 값이 존재하는 경우 getParameterValues("name 속성의 값") 메소드를 사용한다.
//		해당 name 속성을 가지는 요소들의 value 값들을 문자열의 배열로 읽어온다.
//		or 반환값이 여러 개여서 배열로 리턴한다
		
		System.out.println(userName);
		System.out.println(userAge);
		System.out.println(gender);
//		System.out.println(food);
		Arrays.stream(foods).forEach(System.out::println);
		
//		응답 화면 생성
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<title>개인 정보 출력");
		out.println("</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2>개인 정보 출력</h2>");
		out.printf("%s님은 %s세 이고 성별은 %s 입니다.", userName, userAge, gender);
		out.print("좋아하는 음식은 ");
		Arrays.stream(foods).forEach(food -> out.print(food + " "));
		out.print("입니다");
		out.println("</body>");
		out.println("</html>");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		POST 방식으로 넘겨받는 데이터가 영어 or 숫자가 아닌 경우에 인코딩 처리를 해야한다.
//		request에서 파라미터 값을 가져오기 전에 UTF-8로 인코딩 설정을 한다.		
		
		request.setCharacterEncoding("UTF-8");
//		읽어오는 데이터가 영어나 숫자가 아니면  doPost에서는 request.setCharacterEncoding("UTF-8"); 작성하여 인코딩처리를 해야한다.

		doGet(request, response);
	}

}
