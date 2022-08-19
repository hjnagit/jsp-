<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>core_set2.jsp</h1>

<%

	//전달된 정보 저장
	
	String name = (String)request.getAttribute("name");
	int price = Integer.parseInt((String)request.getAttribute("price"));
	String color = (String)request.getAttribute("color");
	
	String test = (String)session.getAttribute("test");
	

%>

이름 : <%=name %><br>
가격 : <%=price %><br>
색깔 : <%=color %><br>

test : <%=test %>

<h2>el 표현식</h2>

이름 : ${requestScope.name }<br>
이름 : ${sessionScope.name }<br>
이름 : ${name }<br>
가격 : ${price }<br>
색상 : ${color }<br>

test : ${test }<br>

<c:remove var="test" scope="session"/>

test : ${sessionScope.test }<br>






</body>
</html>