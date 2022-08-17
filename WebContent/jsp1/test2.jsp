<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSP 구성요소</h1>
	
	<h2>1. jsp 지시어</h2>
	<%--
		<%@ %> : jsp페이지가 실행때 필요한 설정을 작성하는 코드 p.150
		
	 --%>
	<h2>2. 선언문</h2> 
	 <%! // java 코드 작성
	 	int a;
	 
	 
	 
	 
	 %>
	
	<h2>3. 스크립트릿(Scriptlet)</h2>
	<%-- 
	<% 	%> : jsp코드 작성(지역변수)
	
	--%>
	<%
		int b;
	%>
	
	<h2> 4. 표현식</h2>
	<%--
	
		<%= %>
	
	 --%>
	
	<%=1000 %>
	2000(html)
		
		
	<h1>JSP 내장객체</h1>
	
	<hr>
	서버 도메인명 : <%=request.getServerName() %><br>
	서버 포트번호 : <%=request.getServerPort() %><br>
	URL(모두 포함하는 인터넷 주소) : <%=request.getRequestURL() %><br>
	URI(프로토콜, 도메인명, 포트번호가 없는 주소) : <%=request.getRequestURI() %><br>
	
	<hr>
	<%
		//response.setHeader(arg0, arg1);
		//response.addCookie(arg0);
		//response.setContentType(arg0);
		//response.sendRedirect(페이지 주소); 페이지 이동시켜주는
		//response.addHeader("Refresh", "3; url=https://www.naver.com");
	%>
	
	세션 객체 : <%=session.getId() %> <br>
	세션 생성시간 : <%=session.getCreationTime() %> <br>
	세션 최종 접속 시간 : <%=session.getLastAccessedTime() %><br>
	세션 유지시간(1800초 30분) : <%=session.getMaxInactiveInterval() %><br>
	
	<%
		session.setMaxInactiveInterval(3600);
	
	
	%>
	세션 유지시간(3600초 60분) : <%=session.getMaxInactiveInterval() %><br>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


</body>
</html>