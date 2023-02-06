package com.kh.el.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.el.model.vo.Student;

@WebServlet("/el.do")
public class ELServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ELServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서블릿에서 직접 request, session, application 객체를 얻어와서 데이터를 setAttribute()에 담아서 el.jsp에 전달
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		ServletContext application = request.getServletContext();

		// Request 영역에 데이터를 저장
		request.setAttribute("classRoom", "R 강의장");
		request.setAttribute("student", new Student("황수영", 19, 80, 80));
		request.setAttribute("scope", "Request 영역");
		
		// Session 영역에 디이터를
		session.setAttribute("classRoom", "S 강의장");
		session.setAttribute("student", new Student("문인수", 24, 60, 70));
		session.setAttribute("scope", "Session 영역");
		
		// Application 영역에 데이터를 저정
		application.setAttribute("classRoom", "T 강의장");
		application.setAttribute("student", new Student("홍길동", 25, 80, 90));
		application.setAttribute("scope", "Application 영역");
		
		request.getRequestDispatcher("views/el/el.jsp").forward(request, response);
	}
}