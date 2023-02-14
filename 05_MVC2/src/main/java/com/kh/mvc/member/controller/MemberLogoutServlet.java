package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Logout", urlPatterns = { "/logout" })
public class MemberLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberLogoutServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그아웃 순서
    	
    	// 1. 세션을 얻어온다.
    	// 	  현재 세션 객체가 있으면 가져오고 없으면 null을 리턴한다.
    	HttpSession session = request.getSession(false);
    	
    	// 2. 세션을 삭제한다.
    	// 	  세션이 null일 수도 있으므로 삭제하기 전 체크
    	if (session != null) {
    		session.invalidate(); // 세션을 삭제하는 메소드
    	}
    	
    	// 3. 삭제 후 홈 화면으로 리다이렉트
    	response.sendRedirect(request.getContextPath() + "/");
	}
}