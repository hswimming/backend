package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 서블릿을 등록 URL 매핑

//@WebServlet("/Second.do")
@WebServlet(name = "second", urlPatterns = "/second.do")
public class SecondServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SecondServlet() {
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println(request.getContextPath());
		System.out.println(request.getServletPath());
		System.out.println(request.getServerName());
		System.out.println(request.getServerPort());
		System.out.println(request.getRemoteAddr());
		
//		response.getWriter().append("Serverdata : ").append(request.getContextPath());
		
//		한글이 깨지는 것 방지하기 위해 ContentType 응답 헤더를 설정하는 메소드이다.
		response.setContentType("text/html;charset=utf-8");

//		응답 화면을 출력하기 위한 출력 스트림을 얻어온다.
		PrintWriter out = response.getWriter();
		
		out.write("<html>");
		out.write("<body>");
		out.write("<h1>우리가 만든 두 번째 서블릿이 반환한 내용</h1>");
		out.write("</body>");
		out.write("</html>");
	}

}
