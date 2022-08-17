<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testPro1.jsp</h1>
	<%
		//주소에 전달되는 정보 => 파라미터
		//파라메터를 가져오는
		//파라미터는 무조건 String타입이다
		//HTTP요청정보는 파라미터 형태로 정달될때 항상 String타입
		int num = Integer.parseInt(request.getParameter("num")); //int로 바꿔서 저장
		//이렇게 하면 출력된다
	%>
	<%=num %><br>
	<%=request.getParameter("num")+100 %>
	
	
	
	
</body>
</html>