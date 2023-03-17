<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="member.MemberDBBean"%>
<%@ page import="member.MemberDataBean"%>
<%
if ((session.getAttribute("id") == null) || 
		(!((String) session.getAttribute("id")).equals("admin"))) {
	out.println("<script>");
	out.println("location.href='loginForm.jsp'");
	out.println("</script>");
}

String update_id = request.getParameter("id");

MemberDBBean manager = MemberDBBean.getInstance();
MemberDataBean memberdata = manager.selectMember(update_id);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 시스템 관리자모드(회원 정보 수정)</title>
</head>
<body>
	<form name="updateform" action="updateProcess.jsp" method="post">
		<div>
			<table border=1 width=400>
				<tr>
					<td>아이디 :</td>
					<td><%=memberdata.getId() %></td>
					<input type="hidden" name="id" value=<%=memberdata.getId() %> />
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><input type="password" name="passward" value=<%=memberdata.getPassword() %> /></td>
				</tr>
				<tr>
					<td>이름 :</td>
					<td><input type="text" name="name" value=<%=memberdata.getName() %> /></td>
				</tr>
				<tr>
					<td>나이 :</td>
					<td><input type="text" name="age" value=<%=memberdata.getAge() %> maxlength=2 size=5 /></td>
				</tr>
				<tr>
					<td>성별 :</td>
					<td>
					<%
						if (memberdata.getGender().equals("남"))
						{
					%>
						<input type="radio" name="gender" value="남" checked />남자 
						<input type="radio" name="gender" value="여" />여자
					<%
						}
						else
						{
					%>
						<input type="radio" name="gender" value="남"  />남자 
						<input type="radio" name="gender" value="여" checked />여자
					<%
						}
					%>
					</td>
				</tr>
				<tr>
					<td>이메일 주소 :</td>
					<td><input type="text" name="email" size=30 value=<%=memberdata.getEmail() %> /></td>
				</tr>
				<tr align=center>
					<td colspan="2">
						<a href="javascript:updateform.submit()">수정</a>&nbsp;&nbsp; 
						<a href="member_list.jsp">리스트로 돌아가기</a>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>