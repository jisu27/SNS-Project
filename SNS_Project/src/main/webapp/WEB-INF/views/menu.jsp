<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
margin: 0;
padding: 0;

}
	ul li a{
		text-decoration: none;
		font-weight: 700;
	}
	
	ul li a:hover{
	color: red;
	cursor: pointer;
	}
	ul li{
		list-style: none;
	}
	
</style>
</head>
<body>	
	<ul>
		<li><a href="profile.do?id=${sessionScope.user.id}">내 프로필</a> </li>
		<li><a href="#">친구 목록</a> </li>
		<li><a href="#">친구 추천</a></li>
		<li><a href="#"> 쇼츠 </a></li>
	</ul>
</body>
</html>