<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>세션</h1>
	HTTP 통신의 특성상 상태유지가 불가능 하기 때문에 상태를 유지하기 위해서 사용하는 개념
	=> 서버측에서 관리하는 데이터
	=> 브라우저 1개당 1개의 세션 생성
	=> 세션 생성 : session.setAttribute("키", 값);
	=> 세션 사용 : session.getAttribite("키");
	=> 세션 삭제 : session.removeAttribute("키");
	=> 세션 초기화 : session.invalidate(); -> 세션 초기화를 더 많이 사용한다 - 데이터가 다 사라지는 것
	
	<hr>
	
	<%
		String name = (String)session.getAttribute("name");
		String id = (String)session.getAttribute("id");
		if(name == null){
			name = "세션값 없음";
		}
		if(id == null){
			id = "세션값 없음";
		}
		
	%>
	
	세션값 : <%=name %>
	세션값 : <%=id %>
	
	<input type="button" value="세션값 생성" onclick="location.href='sessionSet.jsp';"><br>
	<input type="button" value="세션값 삭제" onclick="location.href='sessionDel.jsp';"><br>
	<input type="button" value="세션값 초기화" onclick="location.href='sessionInv.jsp';"><br>
	
	
	
	
	
</body>
</html>