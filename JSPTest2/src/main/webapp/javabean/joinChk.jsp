<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="join" class="join.joinBean" />
<jsp:setProperty name="join" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 입력 정보 확인 페이지</title>
</head>
<body>
<div style="text-align:center;">
<table style="width:800; margin:auto" border="0">
	<tr>
		<td bgcolor="yellow"><font size=2>아이디: </font>
		<td bgcolor="yellow"><%=join.getId() %></td>
	</tr>
	<tr>
		<td bgcolor="yellow"><font size=2>비밀번호: </font>
		<td bgcolor="yellow"><jsp:getProperty property="pass" name="join"/></td>
	</tr>
	<tr>
		<td bgcolor="yellow"><font size=2>이름: </font>
		<td bgcolor="yellow"><jsp:getProperty property="name" name="join"/></td>
	</tr>
	<tr>
		<td bgcolor="yellow"><font size=2>성별: </font>
		<td bgcolor="yellow"><jsp:getProperty property="sex" name="join"/></td>
	</tr>
	<tr>
		<td bgcolor="yellow"><font size=2>나이: </font>
		<td bgcolor="yellow"><jsp:getProperty property="age" name="join"/></td>
	</tr>
	<tr>
		<td bgcolor="yellow"><font size=2>이메일: </font>
		<td bgcolor="yellow"><jsp:getProperty property="email" name="join"/></td>
	</tr>
</table>
</div>
</body>
</html>