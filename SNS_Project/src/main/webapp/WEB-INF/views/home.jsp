<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<style type="text/css">
	body {
	margin: 0;
	padding: 0;
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
		width: 810px;
		margin: 10px;
		padding: 0;
	}
	#home{
	justify-content: space-between;
	align-items: flex-start;
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
			<img alt="로고" src="">
		</div>
	</div>
	<div id="home">
	<div id="menu">
	<h1>메뉴</h1>
	<%@ include file="menu.jsp"  %>
	</div>
	
	<div id="main">
	<h1>메인</h1>
	<%@include file="main.jsp" %>
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
	</script>
</body>
</html>