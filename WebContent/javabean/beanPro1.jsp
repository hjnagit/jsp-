<%@page import="com.itwillbs.test.JavaBean1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>beanPro1.jsp</h1>

<%
	String id = request.getParameter("id");
	
%>
아이디 : <%=id %><br>

<%
	JavaBean1 jb1 = new JavaBean1();


	jb1.setId(request.getParameter("id"));
	jb1.setName(request.getParameter("name"));
	jb1.setAddr(request.getParameter("addr"));


%>
아이디 : <%=jb1.getId() %><br>
이름 : <%=jb1.getName() %><br>
주소 : <%=jb1.getAddr() %><br>

<hr>
<h2>액션태그 - 자바빈객체를 사용</h2>

<jsp:useBean id="jb2" class="com.itwillbs.test.JavaBean1"/>

<%-- <jsp:setProperty property="id" name="jb2"/>
<jsp:setProperty property="name" name="jb2"/>
<jsp:setProperty property="addr" name="jb2"/>

<jsp:setProperty property="*" name="jb2" param="*"/> --%>
<jsp:setProperty property="*" name="jb2"/>

<hr>
아이디 : <jsp:getProperty property="id" name="jb2"/><br>
이름 : <jsp:getProperty property="name" name="jb2"/><br>
주소 : <jsp:getProperty property="addr" name="jb2"/><br>







</body>
</html>