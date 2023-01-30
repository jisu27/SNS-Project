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
		margin-top : 20px;
		margin-bottom : 5px;
		margin-left : 3px;
		font-size : 1.8em;
		padding : 10px;
	}
	#user {
		background-color : pink;
		width : 40%;
		font-size : 1.5em;
		padding : 10px;
	}
	
	#content {
		background-color : rgb(233,233,233);
		border-top-left-radius:5%; 
        border-top-right-radius: 5%;
        border-bottom-left-radius: 5%;
        border-bottom-right-radius: 5%;
        width : 60%;
        padding : 10px;
	}
	#choose{
		font-size : 1.1em;
		flex-direction: column;
		display : relative;
	}

</style>

</head>
<body>

<form action="getShortsList" method="post" enctype="multipart/form-data">
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
				수정하기 삭제
			</c:when>
			<c:otherwise>
				<a href="updateShorts?sSeq=${shorts.sSeq}">수정 </a> 
				<a href="deleteShorts?sSeq=${shorts.sSeq}"> 삭제</a>
			</c:otherwise>	
		</c:choose>	
	</div>
	
	<div id = "content">
		<p><fmt:formatDate value="${shorts.inDate}" type="date"/> </p>
		<p>${shorts.sContent}</p>
	</div>
	
</div>
</div>

</form>
</body>
</html>