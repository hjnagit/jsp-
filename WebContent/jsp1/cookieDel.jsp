<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>cookieDel.jsp</h1>
<h2>서버</h2>

<%
	//쿠키 삭제(직접 HDD에 삭제x) -> 쿠키를 못쓰게 만들기
	//=> 쿠키의 유효기간을 재설정

	//쿠키값 가져오기(현재의 쿠키정보)
	Cookie[] cookies = request.getCookies();
	
	//생성한 해당 쿠키를 찾기
	if(cookies != null){
		for(int i = 0; i<cookies.length; i++){
			//생성한 쿠키이름을 사용 비교
			if(cookies[i].getName().equals("name")){
				//쿠키를 사용하지 못하게 하기
				//유효기간을 0으로
				cookies[i].setMaxAge(0);
				//변경된 쿠키정보를 전달
				response.addCookie(cookies[i]);
				
				
			}
		}
	}


%>
<script type="text/javascript">
	alert("쿠키값 삭제");
	location.href="cookieTest.jsp";

</script>



</body>
</html>