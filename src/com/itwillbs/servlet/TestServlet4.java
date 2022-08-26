package com.itwillbs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test4")
public class TestServlet4 extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Phone 객체 생성
		Phone samsung = new Phone();
		samsung.setModel("폴드4");
		samsung.setColor("pink");
		samsung.setPrice(200);
		
		//사람의 정보 생성
		Person lee = new Person();
		lee.setName("이서하");
		lee.setAge(26);
		lee.setPhone(samsung);
		
		
		//사람의 정보를 Beans.jsp 생성해서 정보전달후 출력
		// request.
		request.setAttribute("lee", lee); // 일단 정보 저장
		//정보 옮기기
		RequestDispatcher dis = request.getRequestDispatcher("servlet/beans.jsp");
		dis.forward(request, response);
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	
	
	
	
	
}
