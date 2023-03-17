<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="member.MemberDBBean"%>
<%@ page import="member.MemberDataBean"%>
<%
	if ((session.getAttribute("id")==null) || 
			(!((String)session.getAttribute("id")).equals("admin"))) {
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
	
	String info_id=request.getParameter("id");
	
	MemberDBBean manager = MemberDBBean.getInstance();
	MemberDataBean memberdata = manager.selectMember(info_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 시스템 관리자모드(회원 정보 보기)</title>
</head>
<body>
<div>
<table border=1 width=300>
	<tr align=center><td>아이디 : </td><td><%=memberdata.getId() %></td></tr>
	<tr align=center><td>비밀번호 : </td><td><%=memberdata.getPassword() %></td></tr>
	<tr align=center><td>이름 : </td><td><%=memberdata.getName() %></td></tr>
	<tr align=center><td>나이 : </td><td><%=memberdata.getAge() %></td></tr>
	<tr align=center><td>성별 : </td><td><%=memberdata.getGender() %></td></tr>
	<tr align=center><td>이메일 주소 : </td><td><%=memberdata.getEmail() %></td></tr>
	<tr align=center>
		<td colspan=2><a href="member_list.jsp">리스트로 돌아가기</a></td>
	</tr>
</table>
</div>
</body>
</html>