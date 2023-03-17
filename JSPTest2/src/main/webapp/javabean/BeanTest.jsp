<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 자바빈 객체를 생성하기 위한 태그 --%>
<jsp:useBean id="beantest" class="test.BeanTest" scope="page" /> 

<%-- 자바빈 클래스의 속성 값을 설정하기 위한 태그 --%>
<%-- <jsp:setProperty name="beantest" property="name" value="BeanTest!" /> --%>

<%-- 클라이언트에서 전송되어 오는 파라미터 값을 속성 값으로 할당할 경우 param을 사용 --%>
<jsp:setProperty name="beantest" property="name" param="name" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java Bean Test</title>
</head>
<body>
<b>자바빈 사용 예제</b>
<h3><%=beantest.getName() %></h3>
<h3><jsp:getProperty name="beantest" property="name" /></h3>
</body>
</html>