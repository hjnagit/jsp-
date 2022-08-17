<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>select.jsp</h1>
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
	
	//3. sql & pstmt
	//sql - 전체 회원목록 조회
	String sql = "select * from itwill_member";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//4.sql 실행
	ResultSet rs = pstmt.executeQuery();
	//pstmt.executeUpdate(); => insert, update, delete
	//pstmt.executeQuery(); => select
	%>
		<table border="1">
		
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>나이</td>
			<td>성별</td>
			<td>이메일</td>
			<td>회원가입일</td>
		</tr>
	
	
	
	<%
	
	//5. 데이터 처리(select)
	// 데이터가 있다(커서가 보고있는 값이 존재한다)
	//커서가 내려오면서 데이터가 활성화된다. 행기준
	
	
	
	while(rs.next()){
		//커서는 행기준으로  데이터를 조회 가능
		//커서가 보고있는 것 중에서 이름이 id인 것을 가져와라
/* 		out.println("아이디 : " + rs.getString("id") + "<br>"); 
		out.println("비밀번호 : " + rs.getString("pw") + "<br>");
		out.println("이름 : " + rs.getString("name") + "<br>");
		out.println("나이 : " + rs.getInt("age") + "<br>");
		out.println("성별 : " + rs.getString("gender") + "<br>");
		out.println("이메일 : " + rs.getString("email") + "<br>");
		out.println("회원가입일 : " + rs.getTimestamp("regdate") + "<br>"); */
		
		//select 결과데이터 가져오기
		//rs.getXXXX("컬럼명");
		//rs.getXXXX(인덱스);
		
		//String id = rs.getString("id");
		//컬럼의 인덱스는 1번부터
		
		String id = rs.getString("id");
		String pw = rs.getString("pw");
		String name = rs.getString("name");
		String age = rs.getString("age");
		String gender = rs.getString("gender");
		String email = rs.getString("email");
		Timestamp regdate = rs.getTimestamp("regdate");
		if(id.equals("admin"))
			continue;
		
		
		%>
		
		<tr>
			<td><%=id %></td>
			<td><%=pw %></td>
			<td><%=name %></td>
			<td><%=age %></td>
			<td><%=gender %></td>
			<td><%=email %></td>
			<td><%=regdate %></td>
		</tr>
	
	
	
	<%
	
	}
	
	
	
	System.out.println("회원목록 조회 성공!");
	

%>
	</table>

</body>
</html>