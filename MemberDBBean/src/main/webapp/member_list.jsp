<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="member.MemberDBBean"%>
<%@ page import="member.MemberDataBean"%>
<%
	String id=null;
	
	if ((session.getAttribute("id")==null) || 
	  		(!((String)session.getAttribute("id")).equals("admin"))) {
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
	
	MemberDBBean manager = MemberDBBean.getInstance();
	ArrayList<MemberDataBean> member_list = (ArrayList<MemberDataBean>) manager.getMemberlist();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>
</head>
<body>
<div>
<table border=1 width=300 >
	<tr align=center><td colspan=2>회원 목록</td></tr>
	<%
	for (int i=0; i<member_list.size(); i++) {
		MemberDataBean memberdata = (MemberDataBean)member_list.get(i);
	%>	


	<tr align=center>
		<td>
			<a href="member_info.jsp?id=<%=memberdata.getId() %>">
				<%=memberdata.getId() %>
			</a>
		</td>
		<td><a href="member_delete.jsp?id=<%=memberdata.getId() %>">삭제</a></td>
		<td><a href="member_updateForm.jsp?id=<%=memberdata.getId() %>">수정</a></td>
	</tr>
	<%} %>
</table>
</div>
</body>
</html>
