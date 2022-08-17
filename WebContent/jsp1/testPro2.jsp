<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testPro2.jsp</h1>
	
	<%
		
		request.setCharacterEncoding("UTF-8");
		
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String[] hobby = request.getParameterValues("hobby");
		int room = Integer.parseInt(request.getParameter("room"));
	
	%>
	
	이름 : <%=name %>, 나이 : <%=age %><br>
	성별 : <%=gender %><br>
	취미 : 
	<%
	if(hobby != null){

		for(int i = 0; i < hobby.length; i++){
			out.println(hobby[i]);
		}
	}
	%><br>
	강의장 : <%=room %>강의장<br>
	
	
	
	
	<%
	if(hobby != null){
		for(int i = 0; i < hobby.length; i++){
	%>
			취미 : <%=hobby[i] %><br>
	<%
		}
	}
	%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 20살 이상 "성인입니다", 20살 미만 "미성년자입니다" -->
	
	<%
	if(age >= 20){
		out.println("성인입니다");
	}else out.println("미성년자입니다");
	
	if(age >= 20){
		%>
		<h1>성인입니다</h1>
		<%
	}else {
		%>
		<h1>미성년자입니다</h1>
		<%
	}
	
	%>
	
	
	
	
	
</body>
</html>