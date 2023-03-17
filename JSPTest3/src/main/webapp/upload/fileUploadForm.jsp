<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUpload Form</title>
</head>
<body>
<div style="text-align:center;">
<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">	<%-- enctype 필수! --%>
<table style="width:800; margin:auto;" border="1">
	<tr>
		<td colspan=2 align=center><h3>파일 업로드 폼</h3></td></tr>
		
	<tr>
		<td>올린 사람: </td><td><input type="text" name="name"></td><br>
	</tr>
	<tr>
		<td>제목: </td><td><input type="text" name="subject"></td><br>
	</tr>
	<tr>
		<td>파일명1: </td><td><input type="file" name="fileName1"></td><br>
	</tr>
	<tr>
		<td>파일명2: </td><td><input type="file" name="fileName2"></td><p/>
	</tr>
	<tr>
		<td colspan=2 align=center><input type="submit" name="전송"></td>
	</tr>
</table>
</form>
</div>
</body>
</html>