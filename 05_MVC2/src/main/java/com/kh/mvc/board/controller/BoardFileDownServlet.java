package com.kh.mvc.board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "boardFileDown", urlPatterns = { "/board/fileDown" })
public class BoardFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardFileDownServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String oname = request.getParameter("oname");
    	String rname = request.getParameter("rname");
    	
    	System.out.println(oname + ", " + rname);
    	
    	// 1. 클라이언트로 전송할 파일의 경로와 파일명을 가져온다.
    	
    	String filePath = getServletContext().getRealPath("/resources/upload/board/" + rname);
    	
    	// 2. 물리적인 경로에 저장되어 있는 파일을 메모리로 가져온다.
    	File downFile = new File(filePath);
    	
    	// 3. 메모리로 가져온 파일에 입력 스트림을 생성
    	// 보조 스트림은 단독으로 사용 할 수 없다. (BufferedInputStream -> 성능 향상 스트림)
    	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(downFile));
    	
    	// 4. 클라이언트로 내보낼 출력 스트림 생성
    	// response.getOutputStream(); -> 클라이언트와 연결된 아웃풋 스트림을 준다.
    	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream()); 
    	
    	// 5. 브라우저 별 인코딩 처리 (처리 해주지 않으면 파일명이 한글일 때 다운 받아지지 않는다. - 파일이 바로 열림)
    	String downName = null;
    	String userAgent = request.getHeader("user-agent");
    	downName = new String(oname.getBytes("UTF-8"), "ISO-8859-1"); // 문자열을 바이트의 배열로 가져온다.
    	boolean isMSIE = userAgent.indexOf("MSIE") != -1 || userAgent.indexOf("Trident") != -1; 
    	
    	if (isMSIE) {
    		downName = URLEncoder.encode(oname, "UTF-8").replace("\\+", "%20");
    		
    	} else {
    		downName = new String(oname.getBytes("UTF-8"), "ISO-8859-1");
    	}
    	
    	// 6. 응답 메세지 작성
    	// application/octet-stream -> 모든 종류의 2진 데이터를 뜻한다.
    	response.setContentType("application/octet-stream");
    	response.setHeader("Content-Disposition", "attachment;filename=" + downName);
    	
    	// 7. 파일을 클라이언트로 출력(전송)하기
    	int read = -1;
    	
    	while ((read = bis.read()) != -1) { // 읽을 파일이 없을 때 까지 실행
    		bos.write(read);
    	}
    	
    	bos.close();
    	bis.close();
	}
}