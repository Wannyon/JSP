<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL sql 라이브러리 사용 예제</title>
</head>
<body>
<sql:setDataSource var="conn" driver="com.mysql.cj.jdbc.Driver"
					url="jdbc:mysql://localhost:3306/jpa?characterEncoding=utf8"
					user="root"
					password="123456"/>
					
<sql:update dataSource="${conn}">
	insert into student (num,name) values (101,'홍길동');
</sql:update>
<sql:update dataSource="${conn}">
	insert into student (num,name) values (102,'조준동');
</sql:update>
<sql:update dataSource="${conn}">
	insert into student (num,name) values (103,'홍길동');
</sql:update>
<sql:update dataSource="${conn}">
	insert into student (num,name) values (104,'홍길순');
</sql:update>

<sql:query var="rs" dataSource="${conn}">
	SELECT * FROM student WHERE name=?
	<sql:param>홍길동</sql:param>
</sql:query>

<c:forEach var="data" items="${rs.rows}">
	<c:out value="${data['num']}"/>
	<c:out value="${data['name']}"/>
	<br>
</c:forEach>
</body>
</html>