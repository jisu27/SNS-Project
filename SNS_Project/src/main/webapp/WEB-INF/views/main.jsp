<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}
#boardList{
	text-align:center;
	width: 400px; height: 400px;
	display:inline-block;
	align-content: space-around;
	
}

</style>
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${boardList}" var="board">
	<div id="boardList">
		<div id="board">
		<a href="profile.do?id=${board.id}"><h3>${board.id}</h3></a>
		<a href="getBoard?bSeq=${board.bSeq}">
			<img src="images/${board.upload}"/>
		</a>
		<%@include file="comment.jsp" %>
		</div>
	</div>
	</c:forEach>
</body>
</html>