<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}

#boardList {
	text-align: center;
	width: 400px;
	height: 400px;
	display: inline-block;
	align-content: space-around;
}

#adverList {
	text-align: center;
	width: 400px;
	height: 400px;
	display: inline-block;
	align-content: space-around;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<c:forEach items="${boardList}" var="board" varStatus="status">
		<div id="boardList">
			<div id="board">
				<h3>${board.id}</h3>
				<a href="getBoard?bSeq=${board.bSeq}"> <img
					src="images/${board.upload}" />
				</a>
				<%@include file="comment.jsp"%>
			</div>
		</div>

		<c:if test="${board.bSeq%3==0}">
			<div id="adverList">
				<div id="advertise">
					<h3>${adverList[status.index/3].id}</h3>
					<a href="getBoard?aSeq=${adverList[status.index/3].aSeq}"> <img
						src="adverimages/${adverList[status.index/3].img}" />
					</a>
					<%@include file="comment.jsp"%>
				</div>
			</div>
			<%-- 
		
			<c:forEach items="${adverList}" var="advertise">
				<div id="adverList">
					<div id="advertise">
						<h3>${advertise.id}</h3>
						<a href="getBoard?aSeq=${advertise.aSeq}"> <img
							src="adverimages/${advertise.img}" />
						</a>
						<%@include file="comment.jsp"%>
					</div>
				</div>
			 
			</c:forEach>
			--%>
		</c:if>
	</c:forEach>

	<!--
		 <c:if test="${board.bSeq%3==0}">
		<div id="adverList">
					<div id="advertise">
						<h3>${adverList.get(id)}</h3>
						<a href="getBoard?aSeq=${adverList.get(aSeq)}"> <img
							src="adverimages/${adverList.get(img)}" />
						</a>
						<%@include file="comment.jsp"%>
					</div>
				</div>

		</c:if>
		-->



</body>
</html>