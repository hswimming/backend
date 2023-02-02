package com.kh.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Life.do")
public class LifeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LifeServlet() {
        System.out.println("LifeServlet 생성");
    
    }

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 메소드 호출");
	}

	@Override
	public void destroy() {
		System.out.println("destroy() 호출");
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("service() 호출");
		
		
		super.service(request, response);
//		요청 방식이 GET 인지, POST인지 확인 후 doGet() 또는 doPost() 메소드를 실행
//		상위에 있는 서비스를 호출해 주어야 doGet doPost 를 사용한다.
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 호출");
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() 호출");
		
		doGet(request, response);
	}

}
