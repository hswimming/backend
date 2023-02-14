package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.member.model.vo.Member;

@WebServlet(name = "myPage", urlPatterns = { "/member/myPage" })
public class MemberMyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberMyPageServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false); // 로그인 정보가 session에 담겨있다.
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember"); // member가 object 타입이므로 형변환 해준다.
		
		if (loginMember != null) {
			request.getRequestDispatcher("/views/member/myPage.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "로그인 후 수정 해주세요.");
			request.setAttribute("locattion", "/");
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
	}
}