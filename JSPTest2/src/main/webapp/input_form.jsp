<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Input Form</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String jumin1 = request.getParameter("jumin1");
String jumin2 = request.getParameter("jumin2");
String gender = request.getParameter("gender");
String tel1 = request.getParameter("tel1");
String tel2 = request.getParameter("tel2");
String tel3 = request.getParameter("tel3");
String email1 = request.getParameter("email1");
String email2 = request.getParameter("email2");
String[] hobby = request.getParameterValues("hobby");
String hobby_str = "";
int i;
for (i=0; i<hobby.length-1; i++)
	hobby_str += hobby[i] + ", ";
hobby_str += hobby[i];
String intro = request.getParameter("intro");
%>
<table align="center" border="1" width="280">
	<tr>
		<td width="80">아이디</td>
		<td width="200"><%=id %></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%=pw %></td>
	</tr>
	<tr>
		<td>주민번호</td>
		<td><%=jumin1 %>-<%=jumin2 %></td>
	</tr>
	<tr>
		<td>성별</td>
		<td><%=gender %></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><%=tel1 %>-<%=tel2 %>-<%=tel3 %></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%=email1 %>@<%=email2 %></td>
	</tr>
	<tr>
		<td>취미</td>
		<td><%=hobby_str %></td>
	</tr>
	<tr>
		<td>자기소개</td>
		<td><%=intro %></td>
	</tr>

</table>
</body>
</html>