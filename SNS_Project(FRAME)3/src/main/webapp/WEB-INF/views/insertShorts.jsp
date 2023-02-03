<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shorts</title>

<script type="text/javascript" src="views/shorts.js"></script>


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
	
		<h2>동영상을 업로드 하세요</h2><br><br>
			
		<table border="1" >
			<tr>
				<th id="text" width="100">제목: </th>
					<td><input type ="text" name="sTitle"></td>
			</tr>
			
			<tr>
				<th id="text">내용: </th>
				<td> <textarea rows="10" cols="40" name="sContent"></textarea> </td>
			</tr>
			
			<tr>
				<td colspan="2">
				비디오 선택(비디오 파일만 업로드 할 수 있습니다)<br>
				<input type="file" name="uploadFile" id ="uploadFile" accept="video/*" value="동영상 파일"></td>
			</tr>
			
			<!-- <tr>
				<td colspan="2">
				<input type="file" name="file"> 
			</tr> -->
					
	</table>
		
			<br>
			
			<input type="submit" value="동영상 업로드" onclick="check_file()">
			
	
	<br><hr>
		<a href="getShortsList">되돌아가기</a>	
	 
	 
	 
	 
	 <!--  
	<p id = "title">제목: <input type ="text" name="title"></p>
	<p id = "content">내용: <textarea rows="10" cols="40"></textarea></p>
	<input type="file" name="uploadFile" id ="uploadFile" accept="video/*"><br><br>
	<input type="submit" value="동영상 업로드" onclick="check_file()">		
	<hr>
		<a href="getShortsList">되돌아가기</a>	
	-->		
	 
</div>	

</form>


</body>
</html>