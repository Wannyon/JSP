<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>

<%
	Connection conn = null;
	String sql = "SELECT * FROM student";
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		conn = ds.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			out.println("<h3>" + rs.getInt(1) + "." + rs.getString("name") + "</h3>");
		}
		rs.close();
	} catch(Exception e) {
		out.println("<h3>레코드 가져오기에 실패하였습니다.</h3>");
		e.printStackTrace();
	}
%>