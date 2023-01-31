<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board수정</title>
</head>
<body>
	<h1>게시글 수정</h1>
	<form action="updateBoard.do" method="post" enctype="multipart/form-data"> 
		<input type="hidden" name="bseq" value="${board.bSeq}">
		<input type="hidden" name="nonImg" value="${board.upload}">
		
		<h3>${board.id}</h3><br>
		제목:<input type="text" name="title" value="${board.title}"><br>
		<img src="images/${board.upload}"><input type="file" name="uploadfile"><br>
		글 :<input type="text" name="content" value="${board.content}"><br>
		
		<input type="submit" value="수정하기">
	
	</form>
</body>
</html>
