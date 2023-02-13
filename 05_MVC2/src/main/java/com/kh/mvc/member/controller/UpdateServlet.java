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

@WebServlet(name = "update", urlPatterns = { "/member/update" })
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateServlet() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		Member member = null;
		
		// 1. 로그인 된 사용자인지 체크
		HttpSession session = request.getSession(false); // 로그인 정보가 session에 담겨있다.
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
		if (loginMember != null) {
			// 2. 사용자가 수정한 내용을 가지고 Member 객체를 생성
			member = new Member();
			
			// 수정하기 위해서는 아이디나 no를 가져와야 한다. (session 영역에 저장된 프라이머리 키 값 가져오기)
			member.setNo(loginMember.getNo());
			
			// 회원 정보를 수정하기 위해 만든 member
			member.setName(request.getParameter("userName"));
			member.setPhone(request.getParameter("phone"));
			member.setEmail(request.getParameter("email"));
			member.setAddress(request.getParameter("address"));
			
			String hobby = request.getParameterValues("hobby") != null ?
					String.join(",", request.getParameterValues("hobby")) : null;
			
			member.setHobby(hobby);
			
			// 3. 회원 정보 수정
			result = new MemberService().save(member); // 정수값 반환
			
			if (result > 0) {
				// 회원 정보 수정 성공
				// 세션을 갱신한다. (로그인 한 이후의 정보를 가지고 있기 때문에 수정된 데이터를 가져오도록)
				session.setAttribute("loginMember", new MemberService().findMemberById(loginMember.getId()));
				
				request.setAttribute("msg", "회원 정보 수정 완료");
				request.setAttribute("location", "/member/myPage");
				
			} else {
				// 회원 정보 수정 실패
				request.setAttribute("msg", "회원 정보 수정 실패");
				request.setAttribute("location", "/member/myPage");
			}
			
		} else {
			request.setAttribute("msg", "로그인 후 수정 해주세요.");
			request.setAttribute("location", "/");
			
		}
		
		// if 문 안에 각각 넣어주는 것이 아니라 가장 마지막에 수행될 수 있도록 (결과값에 따라 메세지 생성 후 마지막에 포워딩)
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}
}