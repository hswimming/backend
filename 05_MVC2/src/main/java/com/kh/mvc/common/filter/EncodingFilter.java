package com.kh.mvc.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/*
 * 서블릿 필터
 * 	- request, response가 서블릿이나 JSP 등에 도달하기 전에 필요한 전/후 처리 작업을 실행한다.
 * 	- FilterChain을 통해서 여러 개의 필터를 연속적으로 사용이 가능하다.
 * 
 * 서블릿 필터 등록 및 매핑
 * 	- WEB-INF/web.xml 파일에 필터를 등록해서 사용한다.
 * 	- @WebFilter 어노테이션으로 필터를 등록해서 사용한다.
 */

// 등록 할 필터의 이름
@WebFilter(filterName = "encoding", urlPatterns = "/*") // 모든 요청에 대해 필터를 적용시키겠다는 뜻 : /*
public class EncodingFilter implements Filter {
	
	public EncodingFilter() {
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("인코딩 필터가 생성되어 초기화 진행");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("서블릿 동작 전 코드 실행");
		
		String requestMethod = ((HttpServletRequest)request).getMethod();
		
		if (requestMethod.equals("POST")) {
			request.setCharacterEncoding("UTF-8");
			
			System.out.println(request.getCharacterEncoding() + " 인코딩 완료");
		}
		
		// doFilter 기준으로 서블릿 동작 전 코드 작성
		
		// 다음 필터를 호출하거나, 마지막 필터면 Servlet, JSP를 호출한다.
		// 호출 전 -> 서블릿 동작 전 / 호출 후 -> 소블릿 동작 후
		chain.doFilter(request, response);
		
		// doFilter 기준으로 서블릿 동작 후 코드 작성
		
//		response.setContentType("text/html;charset=UTF-8"); // 서블릿으로만 요청할 경우 설정을 넣어주면 좋다.
		
		System.out.println("서블릿 동작 후 코드 실행");
	}
	
	@Override
	public void destroy() {
		System.out.println("인코딩 필터가 소멸됨");
	}

}