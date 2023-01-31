<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${shorts.sTitle}</title>
<style>
	#video {
		margin-left : 20px;
	}

	#video-player {
		width : 58%;
		height : 500px;
		background-color : gray;	
		touch-action : manipulation;
		margin : 10px;
		display : flex;
	}
	
	#title{
		margin-bottom : 5px;
		margin-left : 3px;
		font-size : 1.8em;
	}

	#user {
		
		width : 40%;
		font-size : 1.4em;
		padding-left : 10px;
		padding-bottom : 10px;
		
	}
	
	#content {
		background-color : rgb(233,233,233);
		border-top-left-radius:30px 30px; 
        border-top-right-radius: 30px 30px;
        border-bottom-left-radius: 30px 30px;
        border-bottom-right-radius: 30px 30px;
        width : 60%;
        padding-right : 10px;
        padding-top: 5px;
        padding-left: 15px;
        padding-bottom: 5px;   
	}
	
	
	#choose{
		background-color : rgb(233,233,233);
		border-top-left-radius:30px 30px; 
        border-top-right-radius: 30px 30px;
        border-bottom-left-radius: 30px 30px;
        border-bottom-right-radius: 30px 30px;
		font-size : 1.1em;
		flex-direction: column;
		display : relative;
		float : right;
		margin-right : 50%; 
		margin-bottom : 100%;
		padding : 10px;
		padding-left : 15px;
		padding-right : 15px;
		margin-top : -50px;
		
	}
	
	a {
		text-decoration-line : none;
		color:black; 
	}
	
	input, button {
		border : none;
		font-size : 1.1em;
		background-color : none;
	}

</style>

</head>
<body>

<form action="getShortsList" method="post" id="theform" enctype="multipart/form-data">
<input name="sSeq" type="hidden" value="${shorts.sSeq}">


<h1>동영상 자세히 보기</h1>

<div id="video">

<div id = "video-player">

	<video controls width ="500%" height="500px" preload="metadata" autoplay="autoplay">
		<source src="shorts/${shorts.upload}#t=0.5" >
	</video>

</div>

<div id = "contents">
	<div id ="title">
		<b>${shorts.sTitle}</b>	
	</div>
	
	<div id="user">
		<b>${shorts.id}</b>
	</div>
	
	<div id = "choose">
		<c:choose>
			<c:when test="${empty sessionScop.user}">
				<div>
					<label for="update"><a id="update" href="updateShorts?sSeq=${shorts.sSeq}">수정</a> &nbsp;</label> | 
					<label for="delete">&nbsp;
					<input type="button" value="삭제" onclick="check_delete()"></label>
					<!--  <a id="delete" href="deleteShorts?sSeq=${shorts.sSeq}" onclick="check_delete()">삭제</a></label> -->
				</div>
			</c:when>
			<c:otherwise>
				 <div>
					<label for="update"><a id="update" href="updateShorts?sSeq=${shorts.sSeq}">수정</a> &nbsp;</label> | 
					<label for="delete">&nbsp;
					<input type="button" value="삭제" onclick="check_delete()"></label>
					<!--  <a id="delete" href="deleteShorts?sSeq=${shorts.sSeq}" onclick="check_delete()">삭제</a></label>-->
				</div>
			</c:otherwise>	
		</c:choose>	
	</div>
	
	<div id = "content">
		<p><fmt:formatDate value="${shorts.inDate}" type="date"/> </p>
		<p>${shorts.sContent}</p>
	</div>
	
</div>
</div>

<script type="text/javascript" src="views/shorts.js"></script>
</form>
</body>
</html>