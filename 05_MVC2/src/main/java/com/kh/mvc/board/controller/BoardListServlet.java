package com.kh.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.mvc.common.util.PageInfo;

@WebServlet(name = "boardList", urlPatterns = { "/board/list" })
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardListServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int page = 0;
    	PageInfo pageInfo = null;
    	
    	try {
    		page = Integer.parseInt(request.getParameter("page"));
    		
		} catch (NumberFormatException e) {
			page = 1;
		}
    	
    	pageInfo = new PageInfo(page, 10, 222, 10); // 222 : DB 개수
    	
    	request.setAttribute("pageInfo", pageInfo);
    	
    	request.getRequestDispatcher("/views/board/list.jsp").forward(request, response);
	}

}