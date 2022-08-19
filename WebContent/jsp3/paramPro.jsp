<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>paramPro.jsp</h1>

<h2>전달된 객체 출력</h2>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	out.print("아이디 : " + id + "<br>");
	
	//String foods = request.getParameter("foods"); 한개의 값만 가져올 수 있다
	//배열로 여러 값 가져오기
	// 파라메타에 null이 넘어오면 오류가 난다 - 문제
	String[] foods =request.getParameterValues("foods");
	
%>

아이디 : <%=id %><br>

ID(EL) : ${id } (x)<br>
ID(EL) : ${param.id } <br>

foods : <%=foods[0] %><br>
foods : <%=foods[1] %><br>

foods : ${paramValues.foods[0] }<br>
foods : ${paramValues.foods[1] }<br>
foods : ${paramValues.foods[2] }<br>
* null값도 공백을 출력함<br>

<%
String[] hobby = request.getParameterValues("hobby");

if(hobby != null){
	for(int i=0; i<hobby.length; i++){
		%>
		hobby : <%=hobby[i] %><br>
		<%
	}
}

%>

hobby : ${paramValues.hobby[0] }<br>
hobby : ${paramValues.hobby[1] }<br>
hobby : ${paramValues.hobby[2] }<br>



</body>
</html>