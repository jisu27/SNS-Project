<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shorts</title>


<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<style>
#container {	
	height : 20cm;
	width : 40cm;
	padding:20px 50px;

}

#text{
	text-align:center;
	
}


</style>

</head>
<body>

<form action="insertShorts" method="post" enctype="multipart/form-data">
	
<div id = "container">

 <c:choose>
 	<c:when test= "${empty sessionScope.user}">
 		<a href="http://localhost:8080/">로그인</a>
 	</c:when>
 	<c:otherwise>
 		 ${sessionScope.user.name} 님 로그인 중
  </c:otherwise>
  </c:choose>  

	
		<h2>동영상을 업로드 하세요</h2><br><br>
		<div id = "t1">	
		<table border="1" >
			<tr>
				<th id="text" width="150">제목: </th>
					<td><input type ="text" name="sTitle" maxlength="20"></td>
			</tr>
			
			<tr>
				<th id="text">내용: </th>
				<td>
				<textarea id="sContent" rows="10" cols="40" name="sContent"
				onkeyup = "length_check()"></textarea>
				<div id="count">(0 / 500) </div>	
			</td>
			</tr>
			
			<tr>
				<td colspan="2">
				동영상 선택(동영상 파일만 업로드 할 수 있습니다)<br>
				<input type="file" name="uploadFile" id ="uploadFile" accept="video/*" value="동영상 파일"></td>
			</tr>
	
	</table>
	</div>	
			<br>		
			<input type="submit" value="동영상 업로드" onclick="check_file()">

	<br><hr>
		<a href="getShortsList">되돌아가기</a>	

</div>	

</form>
<script type="text/javascript" src="views/shorts.js"></script>



</body>
</html>