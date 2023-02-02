<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#image{
		float : left;
		margin : 5px  5px;
	    width : 50px;
	    height : 50px;
	    border-radius : 50%;  
	    position:relative;
	    top:5px;
	    background-color: brown;    
	}

</style>


<body>
<form name="formm" action = "getShorts" method="post">

	<div id="comment">
		<div id="image">
			<c:choose>
				<c:when test="${empty sessionScope.user}">
					<!-- no imges -->	
					<img src="">
				</c:when>
				
				<c:otherwise>
					<!-- session id의 사진 -->	
					<img src="">
				</c:otherwise>	
			</c:choose>
		</div>
		
		<textarea name="" placeholder="댓글달기"
		rows="10" cols="60"></textarea>
		<input type="submit" value="등록" onclick="check_id">
	</div>
	
	<br>
<br>
<input type="hidden" id="sSeq" name="sSeq" value=""><!-- value에 ${shorts.sSeq} -->
</form>

<script type="text/javascript" src="views/shorts.js"></script>
</body>
</html>





