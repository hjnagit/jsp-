<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test1.jsp</h1>
	<!-- 아녕 원래 이렇게 주석처리 했는데 이건 html주석 
	ctrl shift / 주석 ctrl shift \ 주석해제-->
	<% 
		// 안녕하세요.
		// 바디안에서 // 주석 처러를 할 수 있다	
		// jsp = java + html(javascript)
	%>
	<%-- <% 1234 jsp 주석 %> --%>
	
	<script type="text/javascript">
		// javascript 주석
	</script>
	<%
	
	
	%>
	
	<%
	
	//스크립틀릿 : java 코드 작성영역 -퍼센트태그
	// 이 태그는 나눠져있는 것처럼 보이지만 연결되어 있다.
	// int a = 100; => 지역변수이다 
	//문자열 배열 생성 -> 데이터 입력, 출력
	
	String[] s = new String[3];
	s[0] = "a";
	s[1] = "ab";
	s[2] = "abc";
	
	for(int i = 0; i < s.length; i++){
		System.out.println(s[i]);
	}
	for(int i = 0; i < s.length; i++){
		out.println(s[i] + "<br>");
		out.println("<h3>" + s[i] + "</h3>");
	}
	for(int i = 0; i < s.length; i++){
	//여기는 자바
	%>
	<!-- 여기는 html 자바 사이에 html을 넣을 수 있다-->
	<hr>
	<%
		out.println(s[i] + "<br>");
		out.println("<h3>" + s[i] + "</h3>");
	}
	
	
	
	for(int i = 0; i < s.length; i++){
	%>
	
		<%=s[i] %><br>
	
	<%
	}
	
	%>
	
	
	
	
	
	
	
	
	
	

	
	
	
</body>
</html>