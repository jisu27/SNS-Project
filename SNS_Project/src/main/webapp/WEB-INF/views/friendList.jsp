<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지</title>
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
	<h1>메인</h1>
		<table> 
			<tr>
				<th>대화방 목록</th>
				<td colspan="5">대화</td>
			</tr>
		</table>
	</div>
</body>
</html>