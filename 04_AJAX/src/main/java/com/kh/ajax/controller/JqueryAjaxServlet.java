package com.kh.ajax.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/jqAjax1.do")
public class JqueryAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JqueryAjaxServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String input = request.getParameter("input");
    	
    	System.out.println("입력 값 : " + input);
    	
    	response.setContentType("text/html;charset=UTF-8");
    	response.getWriter().printf("입력 값  : %s, 길이 : %d 입니다.", input, input.length());
    	
//    	response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	request.setCharacterEncoding("UTF-8"); 작성하지 않아도 깨지지 않는다. (위에서 charset=UTF-8 넣어줬기 때문)
    	
    	String name = request.getParameter("name");
    	String age = request.getParameter("age");
    	
    	System.out.println(name + ", " + age);
    	
    	response.setContentType("text/html;charset=UTF-8");
    	response.getWriter().print(name + ", " + age);
	}
}