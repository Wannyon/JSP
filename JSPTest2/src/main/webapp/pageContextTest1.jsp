	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setAttribute("id", "lee");
pageContext.forward("pageContextText2.jsp");	// 해당주소가 request 객체를 재사용할 수 있다.
//response.sendRedirect("pageContextText2.jsp");	//url이 바뀐다. request 객체를 새로 만들어 사용한다.
%>