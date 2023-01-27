<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<h1>팔로우 리스트</h1>

	<c:forEach var="member" items="${memberList}">
		<a href=# onclick="window.open('profile.do?id=${member.name}','_self','width:500; height:150px')">${member.name}</a>	
	</c:forEach>
	
</body>

</html>	