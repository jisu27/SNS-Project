<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
    pageEncoding="UTF-8" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    <!-- Facebook Meta Tags / 페이스북 오픈 그래프 -->
    <meta property="og:url" content="http://kindtiger.dothome.co.kr/insta">
    <meta property="og:type" content="website">
    <meta property="og:title" content="instagram">
    <meta property="og:description" content="instagram clone">
    <meta property="og:image" content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">
    .
    <!-- Twitter Meta Tags / 트위터 -->
    <meta name="twitter:card" content="instagram clone">
    <meta name="twitter:title" content="instagram">
    <meta name="twitter:description" content="instagram clone">
    <meta name="twitter:image" content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">

    <!-- Google / Search Engine Tags / 구글 검색 엔진 -->
    <meta itemprop="name" content="instagram">
    <meta itemprop="description" content="instagram clone">
    <meta itemprop="image" content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">


    <title>instagram</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/new_post.css">
    <link rel="shortcut icon" href="imgs/instagram.png">

</head>
<body>


<section id="container">


    <header id="header">
        <section class="h_inner">

            <h1 class="logo">
                <a href="index.html">
                    <div class="sprite_insta_icon"></div>
                    <div>
                        <div class="sprite_write_logo"></div>
                    </div>
                </a>
            </h1>

            <div class="search_field">
                <input type="text" placeholder="검색" tabindex="0">

                <div class="fake_field">
                    <span class=sprite_small_search_icon></span>
                    <span>검색</span>
                </div>
            </div>


            <div class="right_icons">
                <a href="new_post.html"><div class="sprite_camera_icon"></div></a>
                <a href="login.html"><div class="sprite_compass_icon"></div></a>
                <a href="follow.html"><div class="sprite_heart_icon_outline"></div></a>
                <a href="profile.html"><div class="sprite_user_icon_outline"></div></a>
            </div>
        </section>
    </header>



    <div id="main_container">

        <div class="post_form_container">
            <form action="insertShorts" class="post_form" method="post" enctype="multipart/form-data">
            <input type="hidden" id="id" name="id" value = "${sessionScope.user.id}">
                <div class="title">
                    NEW SHORTS
                </div>
                <div class="preview">
                    <div class="upload">
                        <div class="post_btn" >
                            <!--  <p>포스트 동영상 추가</p>  -->
                            <video controls id="video-tag" style="width: 300px; height: 250px; object-fit: cover">
								  <source id="video-source" src="shorts/${shorts.upload}">
								  Your browser does not support the video tag.
							</video>
                            
                            <!--<p><img id="img_id" src="#" style="width: 300px; height: 300px; object-fit: cover" alt="thumbnail"></p>-->
                        </div>
                    </div>
                </div>
                <p>
                    <input type="file" name="uploadFile" id="id_photo" required="required">
                </p>
                <p>
                    <textarea name="sContent" id="text_field" cols="50" rows="5" placeholder="140자 까지 등록 가능합니다."></textarea>

                </p>
                <input class="submit_btn" type="submit" value="저장">
            </form>

        </div>

    </div>


</section>

<script src="js/insta.js"></script>

<script>
	var fileInput  = document.querySelector( "#id_photo" ),
	button     = document.querySelector( ".input-file-trigger" ),
	the_return = document.querySelector(".file-return");
	const videoSrc = document.querySelector("#video-source");
	const videoTag = document.querySelector("#video-tag")
	
	// window.onload => HTML이 브라우저에 표시 완료되었을 때 실행
	window.onload = function() {
       // Show image
       fileInput.addEventListener('change', handleVideo, false);
     
       //var canvas = document.getElementById('imageCanvas');
       //var ctx = canvas.getContext('2d');
	}

    function handleVideo(event){
    	console.log(event.target.files);
		
        if (event.target.files && event.target.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function(e) {
            	console.log('loaded');
            	videoSrc.src = e.target.result;
            	videoTag.load()
            }.bind(this)
            
            reader.readAsDataURL(event.target.files[0]);
        }
   }
</script>
=======
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


>>>>>>> refs/remotes/origin/경석님
</body>
</html>