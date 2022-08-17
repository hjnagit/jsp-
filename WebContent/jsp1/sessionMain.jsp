<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>sessionMain.jsp</h1>

<%
	// 로그인정보 (세션값)사용
	String id = (String)session.getAttribute("id");
	// 제어하기
	if(id == null){
		response.sendRedirect("sessionLogin.jsp");
	}

%>
<%=id %>님 환영합니다.

<input type="button" value="로그아웃" onclick="location.href='sessionLogout.jsp';">

</body>
</html>