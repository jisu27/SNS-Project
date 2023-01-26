<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body {
	margin: 0;
	padding: 0;
	}
	#header{
		display:block;
	}		
	#loginInfo{
		background-color: blue;
		display: block;
	}
	#info{
		background-color: blue;
		display: inline-block;
	}
	#logo{
		background-color: red;
		display: inline-block;
		width: 
	}
	#menu{
		background-color: yellow;
		display: none;
		height: 800px;
		width: 175px;
		position: fixed;
		
	}
	#main{
		background-color: green;
		display: inline-block;
		width: 600px;
		margin: 0;
		padding: 0;
	}
	#img {
		border-radius: 50%;
		display: inline-block;
	}
	#follow{
		border: 1px solid black;
		display: inline-block;
		text-align: right;
	}
	#list{
		display: block;
	}
</style>
</head>
<body>
		<div id="loginInfo">
		<div id="info">
			${sessionScope.user.name}님 환영합니다.<br>
			${sessionScope.user.id}<br>
			<a href="#">프로필</a>
			<a href="logout.do">로그아웃</a>
			<a href="goInsertBoard.do">글쓰기</a>
		</div>
		<div id="logo">
			<img alt="" src="">
			<h1>로고</h1>
		</div>
	</div>
	
	<div id="menu">
	<h1>메뉴</h1>
	<%@ include file="menu.jsp"  %>
	</div>
	
	<div id="main">
		<div id="img">
			<img alt="프로필" src=""><br>
			<form action="follow.do" method="post">
			<c:choose>
			
				<c:when test="${!empty sessionScope.user.id && !empty member && sessionScope.user.id != member.id} &&${!fn:contains(sessionScope.follower,member.id)}" >
					<input type="submit" value="팔로우" onclick="follow()">
					<input type="hidden" id="id1" name="id1" value="${sessionScope.user.id}">
					<input type="hidden" id="id2" name="id2" value="${member.id}">
				</c:when>
				
				<c:when test="${fn:contains(sessionScope.follower,member.id)}">
					<input type="submit" value="팔로우 취소" >					
				</c:when>
				
			</c:choose>
			</form>
		</div>
		
		<div id="follow">
		<c:if test="${!empty member}">
					${member.name}
		</c:if>
			팔로우 수 : ${follower}
			팔로잉 수 : ${following}<br>
			<a>회원 정보 수정</a>
			<a>글쓰기</a>
		</div>
		<div id="list">
			<h1>게시글 사진</h1>
			<c:forEach var="board" items="${boardList}" >
				<img alt="${board.id}의 이미지" src="images/${board.upload}">	
			</c:forEach>
			
		</div>
	</div>
	
	<script type="text/javascript">
	
	$(document).ready(function () {
		
		$("#main").mouseover(function () {		
     		$("#menu").attr("style","display:inline-block");
     		$("#main").attr("style","margin-left:180px");
		})	
		$("#main").mouseleave(function () {		
     		$("#menu").attr("style","display:none");
     		$("#main").attr("style","margin-left:10px");
		})	
	})
	
	function follow() {
		alert("팔로우 입니다.");
	}
	
	</script>
</body>
</html>