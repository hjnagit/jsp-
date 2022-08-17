<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>cookieSet.jsp</h1>
	
<h2>서버</h2>

<%
	// 서버
	System.out.println("서버 : 클라이언트의 요청 받음");
	System.out.println("서버 : 클라이언트와의 상태를 유지하기 위해 쿠키 객체 생성");

	
	//서블릿 API사용
	//쿠키객체 생성 -> 메모리 로드, HDD저장x
	// name이라는 이름을 부여 ITWILL을 할당
	Cookie cookie = new Cookie("name", "ITWILL");
	
	//쿠키설정(쿠키 사용 기간 설정) - 600초 설정 - 10분
	// 10분까지만 허용하는 것이고 쿠키데이터는 10분이 지나도 남아있다
	cookie.setMaxAge(600);
	
	//쿠키 클라이언트에게 보내기
	response.addCookie(cookie);
	System.out.println("서버 : 쿠키 정보 생성 전달 완료");

%>


<script type="text/javascript">
	alert("쿠키값 생성");
	location.href="cookieTest.jsp";

</script>
	
	
</body>
</html>