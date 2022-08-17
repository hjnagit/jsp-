<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>dbConnent.jsp</h1>

<%
	//JDBC : Java와 DataBase를 연결하는 API
	
	// 0. mysql 드라이버(라이브러리) 설치
	// WEB-INF/lib/mysql-connector-java-8.0.30.jar 복사 추가
	// 프로젝트당 1번 설치해야한다
	
	// 1. 설치된 드라이버를 로드(리플렉션) -> 저장된 데이터를 불러오는 것
	//""의 드라이버를 불러온다
	Class.forName("com.mysql.cj.jdbc.Driver");
	//코드는 위에서 아래로 실행하니까 위의 코드가 성공하면 아래의 내용이 출력될 것이다.
	System.out.println("드라이버 로드 성공");
	
	// 2. 드라이버를 사용해서 DB접속 
	// mysql에서 디비 하나 jsp수업용을 생성해서 연결했다 jspdb
	// 서버 시간 추가하기?servertimeZone=Asia/Seoul; => 서버시간 오류가 생긴다면 추가한다
	DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb?servertimeZone=Asia/Seoul;", "root", "1234");
	System.out.println("디비 연결 성공");
	// 성공하면 디비에 들어와 있는 상태이다.
	
	// CRUD
	

%>




</body>
</html>