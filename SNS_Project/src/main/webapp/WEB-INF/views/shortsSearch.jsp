<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

 #search{
 	margin-left:20px;
 	width : 500px;
 	heigth : 100px;
 	font-size : 20px;
 	border-color: rgb(233,233,233);
 	border-width : 2px;
 }
 #submit{
	 font-size : 20px;
	 heigth:100px;
	 width : 70px;
	 text-align: center;
	<!-- background : rgb(233,233,233); -->
	 border-radius : 90%;
 }
 

</style>


</head>
<body>
				<!--  검색창 -->
	<form action = "getShortsList" method="post">
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td align="right">
				<input id="search" name="searchKeyword" type="text" placeholder="검색"
				value="${searchKeyword}"/>
				<input id="submit" type="submit" value="검색"/>
			</td>
		</tr>
	</table>
	
	</form>


</body>
</html>