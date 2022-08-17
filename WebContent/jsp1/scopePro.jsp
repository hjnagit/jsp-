<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		String id = request.getParameter("id");
	
	%>
	
	아이디 : <%=id %>
	
	<h2>영역객체의 속성(Attribute)</h2>
	
	[영역객체].setAttribute(키, 값);
	
	<%=pageContext.getAttribute("name") %>
	<hr>
	
	<%
		pageContext.setAttribute("pValue", "100");
		request.setAttribute("rValue", "request Value!!!");
		session.setAttribute("sValue", "session Value!!!");
		application.setAttribute("aValue", "application Value!!!");
	%>
	
	page영역의 공유데이터(Attribute) :<%=pageContext.getAttribute("pValue") %><br>
	request영역의 공유데이터(Attribute) :<%=request.getAttribute("rValue") %><br>
	session영역의 공유데이터(Attribute) :<%=session.getAttribute("sValue") %><br>
	application영역의 공유데이터(Attribute) :<%=application.getAttribute("aValue") %><br>
	
	<hr>
	<h2>페이지 이동</h2>
	
	<a href="scopeAction.jsp?id=<%=id%>&pw=1234">scopeAction 이동</a>
	
	<%-- <script type="text/javascript">
		alert("js:scopeAction.jsp 페이지 이동")
		location.href="scopeAction.jsp?id=<%=id%>&pw=1234";
		
	</script> --%>
	
	
	
	<%
	
	//	response.sendRedirect("scopeAction.jsp?id="+id+"&pw=1234");
	
	
	
	%>
	
	<jsp:forward page="scopeAction.jsp"/>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>