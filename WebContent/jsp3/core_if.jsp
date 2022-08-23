<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>core_if.jsp</h1>

<!-- 속성값 생성 name이라는 이름에 ITWILL이라는 값을 저장 -->
<c:set var="name" value="ITWILL"/>

<!-- 속성값 출력 -->
${name } <hr>

<!-- 조건문 test="10 > 20"조건을 적는다 "10 > 20"이러한 형태로 데이터 비교 못함-->
<!-- test 속성값은 el표현식을 사용하여 값을 비교한다 -->
<c:if test="${10 lt 20}">
	10값이 더 크다.<br>
</c:if>

<!-- name 정보가 ITWILL일경우 ITWILL님 안녕하세요 출력하기 -->
<!-- equals가 적용되지 않는다 그냥 비교하면 된다 -->
<c:if test="${ name eq 'ITWILL' }">
	"ITWILL님 안녕하세요"<br>
</c:if>

<!-- switch-case 형태와 유사 -->
<!-- when에 비교하고 아니면 다음 when과 비교한다 해당하지 않으면 otherwise인 디폴트값으로 -else의 의미-->
<!-- 두개의 when이 아니면 나머지들 중에서 비교를 해서 실행한다 - otherwise -->
<c:choose>
	<!-- case 구문 -->
	<c:when test="${ 10 > 20 }">
		10이 더 크다<br>
	</c:when>
	<c:when test="${ 10 < 20 }">
		20이 더 크다<br>
	</c:when>
	<!-- default구문 (else) -->
	<c:otherwise>
		<c:if test="${10 != 20 }">
			다른 값!!<br>
		</c:if>
	</c:otherwise>
</c:choose>



</body>
</html>