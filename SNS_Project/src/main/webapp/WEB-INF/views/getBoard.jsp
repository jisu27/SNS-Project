<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	button{
		border: none;
	}
	button:hover{
		cursor: pointer;
	}
	#heart{
		width: 30px;
		height: 30px;
	}
	
</style>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
</head>
<body>
<table>
	<tr>
		<th><img alt="${board.id}의 이미지" src="images/${board.upload}"></th>
	</tr>
	<tr>
		<td>제목 :${board.title}</td>
	</tr>
	<tr>	
		<td>아이디 : ${board.id}</td>
	</tr>
	<tr>	
		<td>내용: ${board.content}</td>
	</tr>	
</table>

	<c:choose>
		
		<c:when test="${fn:contains(sessionScope.heart,board.bSeq)}">
		<form action="deleteHeart.do" method="post">
			<input type="hidden" id="bseq" name="bseq" value="${board.bSeq}">
			<input type="hidden" id="id" name="id"  value="${sessionScope.user.id}">
			<button onclick="img_change()"><img alt="좋아요" id="heart" src="icon/free-icon-love-4397571.png"></button>
			
		</form>
		</c:when>
		
		<c:otherwise >
		<form action="heart.do" method="post">
			<input type="hidden" id="bseq" name="bseq" value="${board.bSeq}">
			<input type="hidden" id="id" name="id"  value="${sessionScope.user.id}">
			<button onclick="img_change()"><img alt="좋아요" id="heart" src="icon/free-icon-heart-1077035.png"></button>
		</form>
		</c:otherwise>
		
		
	</c:choose>
		
	<script type="text/javascript">
	
		function img_change() {
			
					
			}
			
	</script>
</body>
</html>