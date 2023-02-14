package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;

@WebServlet(name = "enroll", urlPatterns = { "/member/enroll" })
public class MemberEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberEnrollServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 회원가입 페이지로 포워드하는 기능
		// mvc 패턴 자체가 모든 요청을 컨트롤러 역할을 하는 서블릿이 받기 때문에 jsp를 열 때도 서블릿을 통해 열도록
		request.getRequestDispatcher("/views/member/enroll.jsp").forward(request, response);
	}

	// 회원가입 시 POST 요청이 들어오는 곳
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
		
		Member member = new Member();
		
		member.setId(request.getParameter("userId"));
		member.setPassword(request.getParameter("userPwd"));
		member.setName(request.getParameter("userName"));
		member.setPhone(request.getParameter("phone"));
		member.setEmail(request.getParameter("email"));
		member.setAddress(request.getParameter("address"));
//		member.setHobby(String.join(",", request.getParameterValues("hobby")));
		// 취미가 여러개일 경우 문자열이 배열로 옴 -> 구분자 지정(","), 하나의 문자열로 만들어 주는 메소드 사용
		
		String hobby = request.getParameterValues("hobby") != null ?
				String.join(",", request.getParameterValues("hobby")) : null;
		
		member.setHobby(hobby);
		
		System.out.println(member);
		
		int result = new MemberService().save(member);
		
		System.out.println(result);
		
		if (result > 0) {
			// 회원 가입 완료
			request.setAttribute("msg", "회원 가입 성공");
			request.setAttribute("location", "/"); // location : 홈, / : 메인
		} else {
			request.setAttribute("msg", "회원 가입 실패");
			request.setAttribute("location", "/member/enroll"); // GET 요청으로 보내서 위의 서블릿을 통해 열리도록
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}
}