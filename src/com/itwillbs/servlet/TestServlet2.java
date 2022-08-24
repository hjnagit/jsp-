package com.itwillbs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//http://localhost:8088/JSP6/test2

public class TestServlet2 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 호출");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() 호출");
		
		//request 영역에 정보 저장
		request.setAttribute("cnt", 1000);
		
		//session영역에 정보 저장
		//session정보가 없음 java파일이라
		
		//session 객체 생성
		HttpSession session = request.getSession();
		
		session.setAttribute("cnt", 2000);
		
		
		//servlet/Attribute.jsp 페이지 이동 (forward)
		RequestDispatcher dis = request.getRequestDispatcher("servlet/Attribute.jsp");
		dis.forward(request, response);
		
	}
	
	
	
	
	
	
}
