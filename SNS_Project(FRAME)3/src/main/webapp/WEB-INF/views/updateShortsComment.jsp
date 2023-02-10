<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/updateShortsComment.do" method="post">
				<input type="hidden" name="scSeq" value="${shortsComment.scSeq}">
				<input type="hidden" name="id" value="${shortsComment.id}">
				<input type="hidden" value="${sessionScope.user.id}">
				<input type="hidden" name="sSeq" value="${shortsComment.sSeq}">
		<table>
			<tr>
				<th>${shortsComment.id}</th>

				<th><textarea name="content" id="content" cols="50" rows="5">${shortsComment.content}</textarea>
					<br>
				<th><input type="submit" value="댓글수정"></th>
			</tr>
			<tr>

			</tr>
		</table>
	</form>
</body>
</html>
