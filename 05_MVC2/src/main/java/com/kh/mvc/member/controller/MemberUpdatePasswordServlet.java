package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;

@WebServlet(name = "updatePwd", urlPatterns = { "/member/updatePwd" })
public class UpdatePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdatePasswordServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/member/updatePwd.jsp").forward(request, response);
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	String userPwd = request.getParameter("userPwd");
    	
    	HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
		if (loginMember != null) {
			
			result = new MemberService().updatePassword(loginMember.getNo(), userPwd);
			
			if (result > 0) {
				session.setAttribute("loginMember", new MemberService().findMemberById(loginMember.getId()));
				
				request.setAttribute("msg", "비밀번호 변경이 완료되었습니다.");
				request.setAttribute("script", "self.close()");
				
			} else {
				request.setAttribute("msg", "비밀번호 변경을 실패하였습니다.");
				request.setAttribute("location", "/member/updatePwd");
			}
			
		} else {
			request.setAttribute("msg", "로그인 후 수정 해주세요.");
			request.setAttribute("location", "/");
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	
	}
}