<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>sessionLoginPro.jsp</h1>
<!-- 
1. 한글처리
2. 전달된 파라미터 저장
3. 비교 admit/1234

 -->
 <%
 //한글처리
 request.setCharacterEncoding("UTF-8");
 String id = request.getParameter("id");
 String pw = request.getParameter("pw");
System.out.println("전달된 정보 : " + id + pw); // 콘솔창에 찍어보기
// 비교
if(id.equals("admin")){
	if(pw.equals("1234")){
		out.println("로그인 성공");
		// 회원 정보를 저장 session영역에
		session.setAttribute("id", id);
//		session.setAttribute("loginResult", true);
		
		//메인 페이지로 이동
		response.sendRedirect("sessionMain.jsp");
		
	}else{
		out.println("비밀번호 오류");
		response.sendRedirect("sessionLogin.jsp");
	}
}else{
	out.println("없는 회원입니다.");
	%>
		<script type="text/javascript">
			alert("계정정보가 없습니다.")
		</script>
	<%
}
 
 %>
 
 
 
 
 
</body>
</html>