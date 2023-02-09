package com.kh.ajax.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

//import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.ajax.model.vo.User;


@WebServlet("/jsonAjax.do")
public class JsonAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JsonAjaxServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자 정보가 저장되어 있는 List 객체 생성
		List<User> list = new ArrayList<>();
		
		list.add(new User(1, "황수영", 20, "여자"));
		list.add(new User(2, "짱구", 5, "남자"));
		list.add(new User(3, "짱아", 3, "여자"));
		list.add(new User(4, "흰둥이", 10, "남자"));
		list.add(new User(5, "철수", 5, "남자"));
		list.add(new User(6, "유리", 5, "여자"));
		
//		request.getParameter("userNo");
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		User findUser = list.stream()
						.filter(user -> user.getNo() == userNo)
						.findFirst().orElse(null); // optional이라 값이 있을수도 있고 없을수도 있기 때문에 orElse(null) 
		
		System.out.println(findUser);
		
		// toJson : 문자열 생성
		System.out.println(new Gson().toJson(findUser));
		
		// fromJson : 문자열을 객체로 변환
		System.out.println(new Gson().fromJson("{\"no\":1,\"name\":\"황수영\",\"age\":20,\"gender\":\"여자\"}", User.class));
		
		
		response.setContentType("application/json;charset=UTF-8");
		
		// 문자열을 받아서 개발자도구의 네트워크 응답헤더 Content-Type이 json이면 자바스크립트 객체로 자동 변환
		// response.getWriter().write("{\"no\": 1, \"name\": \"황수영\"}"); // 자바스크립트 표현법으로 객체(프로퍼티) 생성
		//response.getWriter().printf("{\"no\": %d, \"name\": \"%s\"}", findUser.getNo(), findUser.getName());
		
		// 필드가 많아지면 문자열을 생성하기가 힘들어진다. -> Gson() 사용
		//new Gson().toJson(findUser, response.getWriter());
		response.getWriter().write(new Gson().toJson(findUser));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자 정보가 저장되어 있는 List 객체 생성
		List<User> list = new ArrayList<>();
				
		list.add(new User(1, "황수영", 20, "여자"));
		list.add(new User(2, "짱구", 5, "남자"));
		list.add(new User(3, "짱아", 3, "여자"));
		list.add(new User(4, "흰둥이", 10, "남자"));
		list.add(new User(5, "철수", 5, "남자"));
		list.add(new User(6, "유리", 5, "여자"));
		
		String gender = request.getParameter("gender");
		
		List<User> findUsers = list.stream()
				.filter(user -> user.getGender().equals(gender))
				.collect(Collectors.toList()); // 여러명이 조회되기 때문에 Collectors 사용
		
		System.out.println(findUsers);
		// list 객체를 toJson의 매개값으로 넘기면 자바스크립트의 배열을 만드는 문법으로 Json 문자열로 만들어준다.
		System.out.println(new Gson().toJson(findUsers));
		
		response.setContentType("application/json;charset=UTF-8");
		new Gson().toJson(findUsers, response.getWriter());
	}
}