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
	text-align: center;
 }
 
 	#login {
	text-align: center;
}
</style>
</head>
<body>
	<h1>시작페이지</h1>
	<form action="/login.do" method="post">
		<div id="Login">
			<input type="text" name="id" id="id" placeholder="아이디"><br>
			<input type="password" name="pwd" id="pwd" placeholder="비밀번호"><br>
			<input type="submit" value="로그인"><br>
			<a href="goInsertMember.do"><input type="button" value="회원가입" ></a><br>
			<a href="goFindId.do"><input type="button" value="비밀번호/아이디찾기" ></a>
		</div>
	</form>
</body>
</html>