<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session Login</title>
</head>
<body>
<div style="text-align:center;">
<form action="sessionLogin2.jsp" method="post">
<table style="width:800; margin:auto" border="0">
	<tr bgcolor="yellow">
		<td align="right"><font size=2>아이디:</font></td>
		<td align="left"><input type="text" name="id" size=10></td>
	</tr>
	<tr bgcolor="yellow">
		<td align="right"><font size=2>비밀번호:</font></td>
		<td><input type="password" name="pass" size=12></td>
	</tr>
	<tr bgcolor="yellow">
		<td align=center colspan=2>
			<input type="submit" value="로그인">
			<input type="reset" value="다시 작성">
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>