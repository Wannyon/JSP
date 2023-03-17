<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie = new Cookie("language", request.getParameter("language"));
	cookie.setMaxAge(60*60*24);	//쿠키 만료 시간 24시간.
	response.addCookie(cookie);
%>
<script>
location.href="cookieExample.jsp"
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>