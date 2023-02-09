package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;

@WebServlet(name = "login", urlPatterns = { "/login" })
//@WebServlet(name = "login", urlPatterns = { "/login", "/log", "/in" }) // 여러개일 경우
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public LoginServlet() {
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String userId = request.getParameter("userId");
    	String userPwd = request.getParameter("userPwd");
    	
    	System.out.println(userId + ", " + userPwd);
    	
    	Member loginMember = new MemberService().login(userId, userPwd);
    	
    	System.out.println(loginMember);
    	
    	response.sendRedirect(request.getContextPath() + "/");
	}
}