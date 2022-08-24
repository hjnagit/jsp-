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
<h1>Arrays.jsp</h1>

number : ${number }<br>

<hr>
<!-- 서블릿에서 배열의 정보 출력 -->
food : ${menu[0] }, ${menu[1] }, ${menu[2] }, ${menu[3] },...<br>


<%
	String[] menuArr = (String[]) request.getAttribute("menu");
	
	if(menuArr != null){
		for(int i=0; i<menuArr.length; i++){
			out.println("메뉴 : " + menuArr[i]);
		}
	}
	
	for(String s : menuArr){
		out.println(s);
	}
	
%>


<h4>오늘의 추천 메뉴</h4>
<c:forEach var="menu" items="${menu }">
 ${menu }<br>
</c:forEach>


<hr>
<hr>
<hr>

${movies }<br>

<c:forEach var="m" items="${movies }">
	<h5>${m }</h5>
</c:forEach>





</body>
</html>