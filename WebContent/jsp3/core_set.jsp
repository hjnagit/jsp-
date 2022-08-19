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
<h1>core_set.jsp</h1>

<c:out value="안녕하세요"></c:out> <br>
<c:out value="안녕하세요"/> <br>

<%
	int num1 = 10;
	int num2 = 20;
	
%>

합 : <%=num1+num2 %> <br>
합el : ${num1 + num2 }<br>

합jstl : <c:out value="num1+num2"/> => 문자로 취급해서 답이 안나온다 <br>
합jstl : <c:out value="<%=num1+num2 %>"/><br>
합jstl : <c:out value="${num1+num2 }"/>=> 변수 꺼내서 사용할 수 없다 여기서도 못함<br> 


합jstl : <c:out value="${20 + 30 }"/><br>


<hr>

@@<c:out value="${itwill.name }"/>@@
@@<c:out value="${itwill.name }" default="NULL값 대신 사용"/>@@

<hr>


< abc >태그는 abc 입니다. <br>

&lt;abc>태그는 abc 입니다. <br>

<c:out value="<abc>태그는 abc 입니다."/>



<hr>

<h2>JSTL - 변수</h2>

<%
	// 자바코드 변수 : 다른 페이지에서 사용불가
	int a = 100;
	int b = 200;
	int sum1 = a+b;


%>

a+b = <%=sum1 %><br>

<%
	pageContext.setAttribute("c", 1000);

%>

<c:set var="c"  value="1000" />
<c:set var="d"  value="2000" />


<c:set var="sum2"  value="${c+d }" />


${sum2 }<br>

<hr>

<c:set var="name" value="phone" scope="request"/>
<c:set var="price" value="10000" scope="request"/>
<c:set var="color" value="black" scope="request"/>

<%
//	request.setAttribute("price", 10000);
	session.setAttribute("test", "itwill");

%>

${name }<br>

<!-- 페이지 이동 : request 영역 값 -->

<jsp:forward page="core_set2.jsp"/>





















</body>
</html>