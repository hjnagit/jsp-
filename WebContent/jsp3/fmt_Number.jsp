<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>fmt_Number.jsp</h1>

<h2>숫자 데이터를 원하는 형태로 출력 formatting 라이브러리</h2>

<h2>HTML</h2>

<%
	pageContext.setAttribute("money", 1000000000);

%>


100000000<br>

<fmt:formatNumber value="1000000000" groupingUsed="false" />

월급 : ${money }원 <br>
월급 : <fmt:formatNumber value="${money }" /> 원<br>


<h2>소수점 표현</h2>
3.123432412 / 소수점 2번째 자리까지만 표기<br>
<fmt:formatNumber value="3.123432412" pattern="#.##########" />
<br>

10.5  / 10.50 형태로 출력<br>
<fmt:formatNumber value="10.5" pattern="##.00"  /><br>

0.5 => 50%<br>
<fmt:formatNumber value="0.5" type="percent"  /><br>
<fmt:formatNumber value="${43/21 }" type="percent"  /><br>

<hr>


월급 : <fmt:formatNumber value="${money }" type="currency" /> 원<br>
월급 : <fmt:formatNumber value="${money }" type="currency" currencySymbol="$" /> 원<br>
월급 : <fmt:formatNumber value="${money }" type="currency" currencySymbol="&" /> 원<br>












</body>
</html>