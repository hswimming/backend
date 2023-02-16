package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;
import com.kh.mvc.member.model.vo.Member;

@WebServlet(name = "boardDelete", urlPatterns = { "/board/delete" })
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardDeleteServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Board board = null;
		int result = 0;
		
		// 로그인 체크 & 본인 게시글 여부 확인 (직접 적용키셔 보세요.)
		int no = Integer.parseInt(request.getParameter("no"));
		
		
		/* 작성중
		board = new BoardService().getBoardByNo(no);
		
		if (loginMember != null) {
			Board board = new BoardService().getBoardByNo(Integer.parseInt(request.getParameter("no")));
			
			if (board != null && loginMember.getId().equals(board.getWriterId())) {
				request.setAttribute("board", board);
				request.getRequestDispatcher("/views/board/update.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "잘못된 접근입니다.");
				request.setAttribute("location", "/board/list");
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			}
			
		} else {
			request.setAttribute("msg", "로그인 후 수정 해주세요.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		*/
		
		
		System.out.println("게시글 번호 : " + no);
		
		result = new BoardService().delete(no);
		
		if (result > 0) {
			request.setAttribute("msg", "게시글 삭제 성공");
			request.setAttribute("location", "/board/list");
			
		} else {
			request.setAttribute("msg", "게시글 삭제 실패");
			request.setAttribute("location", "/board/view?no=" + no);
		}
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
}