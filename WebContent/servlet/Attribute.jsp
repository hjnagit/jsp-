<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Attribute.jsp</h1>

<h2> TestServlet2(서블릿)과 연결 </h2>
<h2> TestServlet2(서블릿)에서 정보 공유 가능(java코드 - jsp코드) </h2>

<%
	// 변수 - 해당 페이지에서만 사용가능
	int cnt = 100;

	//request영역에 저장된 정보사용
	int cnt2 = (int)request.getAttribute("cnt");
%>

cnt 값(변수) : <%=cnt+200 %><br>

cnt2 값(속성) : <%=cnt2+2000 %><br>

cnt 값 el : ${cnt }<br>
cnt 값 el : ${requestScope.cnt+500 }<br>

cnt값 request : ${requestScope.cnt }<br>
cnt값 session : ${sessionScope.cnt }<br>

???영역의 cnt : ${cnt }<br>

</body>
</html>