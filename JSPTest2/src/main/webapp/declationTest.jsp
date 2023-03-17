<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h1><%=getStr() %></h1>
    
   <%!	// <%! 선언문을 사용시 작성한 코드는 해당 클래스의 필드변수와 메서드로 정의된다.
   private String getStr() {
   	str+="테스트입니다.";
   	return str;
   }
   
   private String str="선언문 ";
   %>