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
   <h1>insert.jsp</h1>
   
   <%!
     static final String DRIVER = "com.mysql.cj.jdbc.Driver";
     static final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
     static final String DBID = "root";
     static final String DBPW = "1234";
   
   %>
   <%
     // 0. 드라이버 설치
     // 1. 드라이버 로드
     Class.forName(DRIVER);
     System.out.println(" 드라이버 로드 성공! ");

     // 2. 디비연결 -  반환타입이 커넥션이라 저장한다
     DriverManager.getConnection( DBURL,DBID ,DBPW );
     System.out.println(" 디비 연결 성공! ");
     
     
   
   %>
   
   
   
</body>
</html>