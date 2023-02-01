<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="formm" action = "getShorts" method="post">

	<div id="comment">
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





