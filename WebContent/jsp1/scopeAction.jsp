<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- page,request의 데이터는 여기까지 가져오지 못 함  -->
	<h2>영역객체의 속성(Attribute)</h2>
	
	page영역의 공유데이터(Attribute) :<%=pageContext.getAttribute("pValue") %><br>
	request영역의 공유데이터(Attribute) :<%=request.getAttribute("rValue") %><br>
	session영역의 공유데이터(Attribute) :<%=session.getAttribute("sValue") %><br>
	application영역의 공유데이터(Attribute) :<%=application.getAttribute("aValue") %><br>
	
	<!-- id도 여기까지 못가져온다 -->
	<!-- 가져오는 방법을 알아보자 -->
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	
	아이디 : <%=id %>
	비밀번호 : <%=pw %>


</body>
</html>