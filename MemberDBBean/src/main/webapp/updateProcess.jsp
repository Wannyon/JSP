<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="member.MemberDBBean"%>
<%@ page import="member.MemberDataBean"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="memberdata" class="member.MemberDataBean">
	<jsp:setProperty name="memberdata" property="*" />
	<%-- 데이터 불러오기 --%>
</jsp:useBean>

<%
	MemberDBBean manager = MemberDBBean.getInstance();
	int result = manager.updateMember(memberdata);
  		
	if(result!=0){  			
		out.println("<script>");
		out.println("alert('수정 성공!!!');");
	  	out.println("location.href='member_list.jsp'");
	  	out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('수정 실패!!!');");
  		out.println("location.href='member_list.jsp'");
  		out.println("</script>");	
	}
%>