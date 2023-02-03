<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>${shorts.sTitle}</title>
<style>
	#video-player {
		width : 100%;
		height : 100%;
		color : gray;	
		touch-action : manipulation;
		
	}

</style>

</head>
<body>

<form action="getShortsList" method="post" enctype="multipart/form-data">
<input type="hidden" name="sSeq" value="${shorts.sSeq}">

<div id = "video-player">
	<video class="video-strem" controlsList="nodownload"
	style ="width:450px; height:800px;" autoplay="autoplay"
	src="">
	 
	
	</video>


</div>
</form>
</body>
</html>