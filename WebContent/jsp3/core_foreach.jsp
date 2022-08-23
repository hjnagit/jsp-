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
<h1>core_foreach.jsp</h1>

<%
	//1~10 까지 출력하기
	for(int i=1; i<11; i++){
		//out.println(i);
		%>
			<%=i %><br>
		<%
	}


%>
<hr>
<hr>

<!-- begin 시작 end 끝 step 단계 var 변수선언 i에 들어간다 -->
<!-- a를 저 반복문에 넣으면 a가 10번 반복된다 -->
<c:forEach var="i" begin="1" end="10" step="1">
	${i }<br>
</c:forEach>

<hr>

<!-- 1~10 홀수만 출력 -->
<c:forEach var="i" begin="1" end="10" step="2">
	${i }
</c:forEach>

<hr>
<!-- 짝수만 출력 -->
<c:forEach var="i" begin="1" end="10" step="1">
	<c:if test="${ i%2 == 0 }">
		${i }
	</c:if>
</c:forEach>

<hr>

<%
	String[] strArr = {"abc", "ass", "sdf", "adsf", "imp", "rne"};
	
	for(int i=0; i<strArr.length; i++){
		out.println(strArr[i]);
	}
	
	pageContext.setAttribute("strArr", strArr);
%>

<!-- 객체의 주소가 출력됨 -->
${strArr }
<!-- 객체의 내용이 출력됨 -->
${strArr[0] }
<hr>
<!-- el표현식에서 strArr.length  는 오류!! 접근하지 못한다 -->

<%
//for each문
//for(변수 : 배열, 컬렉션){
	
//}

%>

<!-- 자바코드에 접근을 못하니까 영역에 저장해서 접근하게 한다 -->
<!-- 자바의 for each과 비슷한 것을 활용 -->
<!-- 배열만큼 ㅁ이 출력된다 -->
<!-- items 반복되는 배열이나 이런 값들을 적어주는 것 -->
<c:forEach items="${strArr }">
	ㅁ
</c:forEach>

<!-- 변수str에 배열값을 넣어서 출력해주는 구문 -->
<c:forEach var="str" items="${strArr }">
	${str }
</c:forEach>



<hr>
<!-- a.b.c.d.e.f.g.h.ii.qq 이러한 형태의 데이터를 자르는 -->
<!-- delims에 구분자를 적음 -->
<!-- items에 .을 만날때마다 실행한다 => test가 9번 찍힌다 -->
<c:forTokens items="a.b.c.d.e.f.g.h.ii.qq" delims=".">
	<!-- test<br> -->

</c:forTokens>


<!-- 구분된 값을 넣는 var를 설정해서 출력 -->
<!-- delims에 " " 공백을 넣어서 구분할 수도 있다-->
<!-- 단어를 넣어서 그 단어가 몇번 들어가는 지도 알 수 있다 -->
<c:forTokens var="tk" items="a.b.c.d.e. f.g.h.ii.qq" delims=" ">
	<!-- test<br> -->
	${tk }
</c:forTokens>














</body>
</html>