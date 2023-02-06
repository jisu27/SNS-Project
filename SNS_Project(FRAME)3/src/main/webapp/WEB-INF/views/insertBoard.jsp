<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script> 
</head>
<body>
<form action="insertBoard.do" method="post">
	<input type="text" id="title" name="title" placeholder="title"><br>
	<input type="hidden" id="id" name="id" readonly="readonly" value="${sessionScope.user.id}">
	<input type="text" id="content" name="content" placeholder="content"><br>
	<input type="file" id="upload" name="upload" ><br>
	<c:if test="${empty sessionScope.user.pay}"><input type="hidden" id="pay" name="pay" value='0'><br></c:if>
	<c:if test="${!empty sessionScope.user.pay}"><input type="hidden" id="pay" name="pay" value='${sessionScope.user.pay}'><br></c:if>
	
	
	<input type="submit" value="등록하기">
<script type="text/javascript">
	$(document).ready(function(){
		if($("#id").val() ==null || $("#id").val() ==""){
			alert("세션이 만료되었습니다. 로그인을 해주세요");
			window.history.back();
		}
	})
</script>	 
</form>
</body>
</html>