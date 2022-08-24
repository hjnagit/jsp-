package com.itwillbs.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test3")
public class TestSurvlet3 extends HttpServlet{
	
	//http://localhost:8088/JSP6/test3
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//dopost 는 강제로 호출해야 하므로 doget하나만 만든다
		
		System.out.println("doGet() 호출!!");
		
		//request 영역에 number-100값을 Arrays.jsp에 출력
		request.setAttribute("number", 100);
		
		//request영역에 배열정보 전달
		String[] menu = {"밀면", "햄버거", "피자", "한식", "초밥", "도시락"};
		request.setAttribute("menu", menu);
		
		//ArrayList 보내기
		ArrayList<String> movies = new ArrayList<String>();
		movies.add("곡성");
		movies.add("쏘우");
		movies.add("장화홍련");
		movies.add("암살");
		movies.add("모가디슈");
		
		request.setAttribute("movies", movies);
		
		
		
		
		//페이지 이동
		RequestDispatcher dis = request.getRequestDispatcher("servlet/Arrays.jsp");
		dis.forward(request, response);
		
	}

	
}
