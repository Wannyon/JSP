<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	String delete_id=request.getParameter("id");
	
	MemberDBBean manager = MemberDBBean.getInstance();
	int result = manager.deleteMember(delete_id);
	
	if (result != 0) {
		out.println("<script>");
		out.println("alert('삭제 성공!')");
		out.println("location.href='member_list.jsp'");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('삭제 실패...')");
		out.println("location.href='member_list.jsp'");
		out.println("</script>");
	}
			
			
	
%>