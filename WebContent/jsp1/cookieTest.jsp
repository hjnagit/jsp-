<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>cookieTest.jsp</h1>

<%
	//클라이언트 페이지
	//쿠키값 가져오기
	Cookie[] cookies = request.getCookies();

	// 쿠키값이 있는지 제어
	if(cookies != null){
		//쿠키값이 존재한다
		// 쿠키배열을 처음부터 끝까지 검사한다
		//쿠키의 이름과 같을 때
		for(int i = 0;i<cookies.length; i++){
			if(cookies[i].getName().equals("name")){
				out.println("쿠키이름 : " + cookies[i].getName()+ "<br>");
				out.println("쿠키값 : " +cookies[i].getValue() + "<br>");
			}
		}
		
		
		
	}

%>
<h2>클라이언트</h2>
<input type="button" value="쿠키 생성" onclick="location.href='cookieSet.jsp';">
<input type="button" value="쿠키 삭제" onclick="location.href='cookieDel.jsp';">


</body>
</html>