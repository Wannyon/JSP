<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");
	int age=Integer.parseInt(request.getParameter("age"));
	String gender=request.getParameter("gender");
	String email=request.getParameter("email");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try {
  		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
  		conn = ds.getConnection();
  		String sql = "UPDATE member SET password = ?, name = ?,age = ?,gender = ?,email = ? WHERE id = ?";
  		pstmt=conn.prepareStatement(sql);
  		pstmt.setString(1,pass);
  		pstmt.setString(2,name);
  		pstmt.setInt(3,age);
  		pstmt.setString(4,gender);
  		pstmt.setString(5,email);
  		pstmt.setString(6,id);
  		int result=pstmt.executeUpdate();
  		
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
	}catch(Exception e){
		e.printStackTrace();
 	}
%>