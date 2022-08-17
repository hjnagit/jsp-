<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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

	//0. 드라이버 설치
	//1. 드라이버 로드
	Class.forName(DRIVER);
	System.out.println("드라이버 로드 성공");
	//2. 디비연결
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println("디비 연결 성공");
	System.out.println("con : " + con);
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//3. sql 작성 & stmt 객체
//	String sql = "insert into itwill_member values ('"+id+"' ,'"+pw+"', '사용자1', 20, '남', 'adim@adim.com', '2022-08-03')";
	String sql = "insert into itwill_member(id, pw,name, age,gender,email, regdate) values (? ,?, ?, ?, ?, ?, ?)";
	
	//sql 실행하는 객체
//	Statement stmt = con.createStatement();
	
	//prepare는 sql을 미리 가져간다 - 쿼리를 가지고 있는
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//?처리하기-쿼리에 넣을 값을 직접 넣는다
	//pstmt.setString(?위치, 값); => 컬럼병의 타입에 따라서 메서드가 변경됨.
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	pstmt.setString(3, "홍길동");
	pstmt.setInt(4, 11);
	pstmt.setString(5, "남");
	pstmt.setString(6, "adim@naver.com");
	pstmt.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
	
	//4. sql 실행
	//stmt.executeUpdate(sql);
	
	pstmt.executeUpdate();
	
	System.out.println("회원가입 완료!");
	
	
%>






</body>
</html>