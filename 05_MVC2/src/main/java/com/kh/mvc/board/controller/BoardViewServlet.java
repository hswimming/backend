package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.board.model.service.BoardService;
import com.kh.mvc.board.model.vo.Board;

@WebServlet(name = "boardView", urlPatterns = { "/board/view" })
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardViewServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Board board = null;
    	int no = Integer.parseInt(request.getParameter("no")); // 사용자에게 게시글 번호를 받는다.
    	
    	System.out.println("게시글 번호 : " + no);
    	
    	board = new BoardService().getBoardByNo(no);
    	
    	System.out.println(board);
    	
    	request.setAttribute("board", board);
    	request.getRequestDispatcher("/views/board/view.jsp").forward(request, response);
	}

}