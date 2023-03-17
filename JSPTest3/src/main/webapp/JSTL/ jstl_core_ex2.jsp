<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core 라이브러리 사용 예제 2</title>
</head>
<body>
<%
String str [] = {"관악산", "북한산", "영축산", "태백산"};
%>
<c:forEach var="item" items="${str}" >
	<b>${item}</b>&nbsp;&nbsp;&nbsp;
</c:forEach>

<c:forEach var="test" begin="1" end="10" step="2">
	<b>${test}</b>&nbsp;
</c:forEach>
<br>
<c:forTokens var="alphabet" items="a,b,c,d,e,f,g,i,j,k,l,m,n" delims=",">
	<b>${alphabet}</b>&nbsp;
</c:forTokens>
<br>
<c:set var="data" value="홍길동, 김길동, 고길동" />
<c:forTokens var="varData" items="${data }" delims=",">
	<b>${varData}</b>&nbsp;
</c:forTokens>
</body>
</html>