<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>beans.jsp</h1>

<h2>전달된 사람의 정보 출력하기</h2>

${requestScope.lee }

<br>
이름 : ${requestScope.lee.name }<br>
나이 : ${lee.age }<br>
휴대폰 : ${requestScope.lee.phone }<br>
<hr>
모델명 : ${lee.phone.model }<br>
색상 : ${lee.phone.color }<br>
가격 : ${lee.phone.price }<br>

<hr>
<c:set var="p" value="${lee.phone }" />
${p.model }<br>

</body>
</html>