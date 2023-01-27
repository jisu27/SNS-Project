<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="insertComment.do" method="post">
		<input type="hidden" name="user_id" value="${member.id}"> <input
			type="hidden" name="board_seq" value="${board.bSeq}">
		<table id="comment">
			<tr>
				<td>댓글내용</td>
				<td><textarea rows="5" cols="30" name="comment_content"></textarea>
				<td><input type="submit" value="댓글 달기" >
				</td>
			</tr>
		</table>
	</form>
</body>
</html>