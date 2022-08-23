<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>fmt_Date.jsp</h1>

<!-- 자바 유틸 밑에있는 날짜 정보  -->
<%=new Date() %><br>

<!-- 날짜 데이터 저장하기 el표현식으로 사용가능-->
<c:set var="today" value="<%=new Date() %>" />

${today }<br>

<!-- 포맷형태로 날짜 출력하기 -->
<fmt:formatDate value="${today }" /><br>
<fmt:formatDate value="${today }" type="time" /><br>
<fmt:formatDate value="${today }" type="both" /><br>

<h3>날짜</h3>
<fmt:formatDate value="${today }" dateStyle="full" /><br>
<fmt:formatDate value="${today }" dateStyle="long" /><br>
<fmt:formatDate value="${today }" dateStyle="medium" /><br>
<fmt:formatDate value="${today }" dateStyle="short" /><br>

<h3>시간</h3>

<fmt:formatDate value="${today }" type="time" timeStyle="full"/><br>
<fmt:formatDate value="${today }" type="time" timeStyle="long"/><br>
<fmt:formatDate value="${today }" type="time" timeStyle="medium"/><br>
<fmt:formatDate value="${today }" type="time" timeStyle="short"/><br>

<hr>
2022년 8월 23일 (화) 오후 4시 23분 00초 <br>

<fmt:formatDate value="${today }" type="both" dateStyle="long" timeStyle="long" /><br>


<hr>
2022/8/23 (화) (오후) 4:23:00 <br>

<fmt:formatDate value="${today }" pattern="yyyy/MM/dd (E)" />
<fmt:formatDate value="${today }" type="time" pattern="(a) hh:mm:ss"/>


















</body>
</html>