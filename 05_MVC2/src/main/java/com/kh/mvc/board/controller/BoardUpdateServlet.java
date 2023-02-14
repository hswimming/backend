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
import com.kh.mvc.common.util.FileRename;
import com.kh.mvc.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

@WebServlet(name = "boardUpdate", urlPatterns = { "/board/update" })
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardUpdateServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
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
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
		if (loginMember != null) {
			// 파일이 저장 될 경로
	    	String path = getServletContext().getRealPath("/resources/upload/board");
	    	
	    	// 파일의 최대 사이즈 지정 (10MB)
	    	int maxSize = 10485760;
	    	
	    	// 파일 인코딩 설정
	    	String encoding = "UTF-8";
	    	
	    	// DefaultFileRenamePolicy : 중복되는 이름 뒤에 1 ~ 9999 붙인다.
//	    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new DefaultFileRenamePolicy());
	    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
	    	
	    	if (loginMember.getId().equals(mr.getParameter("writer"))) {
	    		Board board = new Board();
	    		
	    		board.setNo(Integer.parseInt(mr.getParameter("no")));
	    		board.setTitle(mr.getParameter("title"));
	    		board.setContent(mr.getParameter("content"));
	    		
	    		int result = new BoardService().save(board); // 영향 받은 행의 개수를 리턴
	    		
	    		if (result > 0) {
	    			request.setAttribute("msg", "게시글 수정 성공");
	    			request.setAttribute("location", "/board/view?no=" + board.getNo());
	    			
	    		} else {
	    			request.setAttribute("msg", "게시글 수정 실패");
	    			request.setAttribute("location", "/board/update?no=" + board.getNo());
	    		}
	    		
	    	} else {
	    		request.setAttribute("msg", "잘못된 접근입니다.");
				request.setAttribute("location", "/board/list");
	    	}
	    	
		} else {
			request.setAttribute("msg", "로그인 후 수정 해주세요.");
			request.setAttribute("location", "/");
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}
}