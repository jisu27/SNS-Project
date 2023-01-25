<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		display: inline-block;
		height: 800px;
		width: 175px;
		<!--position: fixed;-->
		
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
			<h1>로그인 정보</h1>
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
			<img alt="프로필" src="">
		</div>
		
		<div id="follow">
			팔로우 수 :
			팔로잉 수 : <br>
			<a>회원 정보 수정</a>
			<a>글쓰기</a>
		</div>
		
		<div id="list">
			<h1>게시글 사진</h1>
		</div>
	</div>
	
</body>
</html>