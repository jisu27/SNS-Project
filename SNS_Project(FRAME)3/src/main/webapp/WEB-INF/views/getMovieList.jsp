<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화추천 사이트</title>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	body {
	text-align: center;
}

	table {
	margin: auto;
	}
form {
	margin:10px 0;
}
#head{
	display: block;
}
#head a {
	display:block;
	text-align: right;
	text-decoration: none;
}
a{
	text-decoration: none;
	}

#menu ul li{
	display: inline-block;
	text-decoration: none;
	list-style: none; 
	padding: 0 100px;
	border-right: 1px solid white;
	
}

img {
	width: 200px;
	height: 300px;
}

</style>
</head>
<body>
<div id="head">
	<h1 >영화 추천 사이트</h1>
	<a href="logout.do">로그아웃</a>
</div>


<hr>
	<div id="menu">
		<ul>
			<li id="thriller"><a href="gen.do?id=thriller">스릴러</a></li>
			<li id="romance"><a href="gen.do?id=romance">로맨스</a></li>
			<li id="horror"><a href="gen.do?id=horror">액션</a></li>
			<li id="action" style="border-right:0;"><a href="gen.do?id=action">호러</a></li>
		</ul>
	</div>
<hr>

<form action="search.do" method="get">
	<input type="text" id="movie_content" name="movie_content">
	<input type="submit" value="검색">
</form>

<a href="insertMovie.jsp">글쓰기</a>
	
	<c:forEach items="${movieList}" var="movie">
	<table>
	<tr>
		<th><img src="resources/images/${movie.filename}"/></th>
		<td width="100"><a href="getMovie.do?movie_seq=${movie.movie_seq}">${movie.movie_title}</a></td>
	</tr>	
	</table>	
	</c:forEach>
	
<hr>
</body>
</html>