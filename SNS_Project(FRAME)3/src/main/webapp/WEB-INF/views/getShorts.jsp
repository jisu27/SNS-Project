<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="default">
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
    <link rel="stylesheet" href="css/detail-page.css">
    <link rel="shortcut icon" href="imgs/instagram.png">


    <style>
        #main_container {
            /*height: 6000px;*/
        }  
        .contents .img_section .trans_inner video{
		    width: 100%;
		    height: 100%;
		}
		
		#sTitle {
			margin : 20px;
			font-size: 20px; 
		}
		
		#button {
			margin-left : 20px; 
			padding-bottom : 20px;
			border : none;
			background-color :transparent;
			height : 30px;
			cursor: Pointer;
		}
		

    </style>
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

        <section class="b_inner">

            <div class="contents_box">

                <article class="contents cont01">

                    <div class="img_section">
                        <div class="trans_inner" >
                            <div>
                           <!--  <img src="imgs/img_section/img03.jpg" alt="">  -->
                            <video controls preload="metadata" autoplay="autoplay">
								<source src="shorts/${shorts.upload}#t=0.5" >
							</video>
                            </div>
                        </div>
                         <div id= "sTitle">${shorts.sTitle}</div> 
                    </div>


                   <div class="detail--right_box">

                        <header class="top">
                            <div class="user_container">
                                <div class="profile_img">
                                    <img src="imgs/thumb.jpeg" alt="">
                                </div>
                                <div class="user_name">
                                    <div class="nick_name">${shorts.id}</div>
                                    <div class="country">Seoul, South Korea</div>
                                </div>
                            </div>
                            <div class="sprite_more_icon" data-name="more">
                                <ul class="more_detail">
                                    <li>팔로우</li>
                                    <li>수정</li>
                                    <li>삭제</li>
                                </ul>
                            </div>

                        </header>
                        
                        <!-- 작성자 내용 ---->
                        <section class="scroll_section">
                            <div class="admin_container">
                                <div class="admin"><img src="imgs/thumb.jpeg" alt="user"></div>
                                <div class="comment">
                                    <span class="user_id">${shorts.id}</span> ${shorts.sContent}
                                    <div class="time">${shorts.inDate}</div>
                                </div>
                            </div>	    
                       <!-- ------ -->   
            
                           <!-- 코맨트 작성 -->  
                           <div id= "commentList">
                             
                            </div>
                           <!-- -------------- -->
                           
						</section>
						
                        <div class="bottom_icons">
                            <div class="left_icons">
                            
                            
                            
                            
                            
                            
                            <!-------------------  조아요 ---------------------->
                            <c:choose>
	                            <c:when test = "${fn:contains(sessionScope.shortslike, shorts.sSeq)}">
	                                <!--  <div class="heart_btn">
	                                    <div class="sprite_heart_icon_outline" data-name="heartbeat"></div>
	                                </div>
	                                -->
	                                <div onclick="deletelike()" class = "sprite_heart_icon_outline" id = "shortslike" 
	                                style= "background: url('../../imgs/background01.png') no-repeat -26px -261px;" data-name="heartbeat">
		                                <form id= "deletelike" action="getDeleteShorts" method="post">
		                                	<input type="hidden" id="sSeq" name="sSeq" value="${shorts.sSeq}">
		                                	<input type="hidden" id="id" name="id" value="${sessionScope.user.id}">
		                                	<!-- <input type="hidden" id ="profile" name= "profile" value="${profile}">   -->
		                                </form>
	                                 </div>
                          		</c:when>
                          		
                          		<c:otherwise>
                          			<div onclick="like()" class="sprite_heart_icon_outline" id="shortslike" 
                          			 data-name="heartbeat" style="background: url('../../imgs/background01.png') no-repeat -52px -261px;">
	                          			<form id="like" method="post" action ="getlike">
	                          				<input type="hidden" id="sSeq" name="sSeq" value="${shorts.sSeq}">
	                          				<input type="hidden" id="id" name="id" value="${sessionScope.user.id}">
	               	            		 	<!-- <input type="hidden" id ="profile" name= "profile" value="${profile}">  -->
	                          			</form>
	                          		</div>	

                          		</c:otherwise>
                          		
                          	</c:choose>
                          	<!------------------ --------------------- --> 
                          	     
                          	     
                          	     
                          	     
                          	     
                                <div>
                                    <div class="sprite_bubble_icon"></div>
                                </div>
                                <div>
                                    <div class="sprite_share_icon" data-name="share"></div>
                                </div>
                            </div>

                            <div class="right_icon">
                                <div class="sprite_bookmark_outline" data-name="book-mark"></div>
                            </div>
                        </div>

                        <div class="count_likes">
                            좋아요
                            <span class="count">${shorts.count}</span>
                            개
                        </div>
                        <div class="timer">${shorts.inDate}</div>
					
						<form action="insertComment">
                        <div class="commit_field">
                        	<div class="comment_input">
	                        	<input type="hidden" name="sSeq" id="sSeq" value="${shorts.sSeq}" >
	                            <input type="text" id="content" placeholder="댓글달기..">
							</div>
                            <div class="upload_btn">
                            	
                            	<!--  <input type="button" value="게시" onclick="insertComment();">  -->
                            </div>
                        </div>
                       <input type="button" id="button" value="전송" onclick="insertComment();"> 
                        </form>
                    </div>

                </article>

            </div>

        </section>

    </div>

    <div class="del_pop">
        <div class="btn_box">
            <div class="del">삭제</div>
            <div class="cancel">취소</div>
        </div>
   </div>

</section>

<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>   -->
<!--<script src="js/detail.js"></script>-->





<script type="text/javascript">
//조아요 함수
function deletelike(){
	var id = "${shorts.id}";
	if(id == null){
		alert("로그인 후 사용가능합니다")
	}else {
		$("#deletelike").submit();
	}
}

function like(){
	var id = "${shorts.id}";
	if(id == null){
		alert("로그인 후 사용가능합니다")
	}else {
		$("#like").submit();
		
	}
	
}


//댓글 함수
	$(document).ready(function(){
		getCommentList();	
	});
	
function getCommentList() {
	
	const sSeq = $('#sSeq').val();
	
	console.log(sSeq);
	
	$.ajax({
		type: 'GET',
		url: 'comments/getCommentList',
		dataType: 'json',
		data: { "sSeq":sSeq},
		contentType:'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data){
			var commentList = data.commentList;

			console.log("commentList", commentList);
			
			showHTML(commentList);
		},
		error: function(){
			alert("댓글이 없습니다");
		} 
	});
}

	
	function showHTML(commentList){
		var html ="";
		
		if(commentList.length > 0) {	
			$.each(commentList, function(key, value){
				html += "<div class=\"user_container-detail\">";
                html += "<div class=\"user\"><img src=\"imgs/thumb02.jpg\" alt=\"user\"></div>";
                html += "<div class=\"comment\">";
                html += "<span class=\"user_id\">" + value.id + "</span>" + value.content;
                html += "<div class=\"time\">" + displayTime(value.indate);
 				html += "<div class=\"icon_wrap\">";
                html += "<div class=\"more_trigger\">";
                html += "<div class=\"sprite_more_icon\"></div>";
                html += "</div>";
                html += "<div>";
                html += "<div class=\"sprite_small_heart_icon_outline\"></div>";
                html += "</div>";
                html += "</div>";
                html += "</div>";
                html += "</div>";
                html += "</div>";
			});
			
		}else {
			html += "<div>";
			html += "<h5>댓글이 없습니다</h5>";
			html += "</div>";
		}
		$('#commentList').html(html);
	}
	
	
	function displayTime(timeValue){
		var today = new Date();
		
		var timeGap = today.getTime() - timeValue;
		
		var dateObj = new Date(timeValue);
		
		if(timeGap < (1000 * 60 * 60 * 24)) {
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':',
				(ss > 9 ? '' : '0')+ss].join('');
			
		}else {
			
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			
			return [yy,'/', (mm > 9 ? '' : '0')+ mm, '/',(dd > 9 ? '' : '0')+dd].join('');		
		}
	}
	
	
	function insertComment() {
		var content = document.getElementById("content").value;
		var sSeq = document.getElementById("sSeq").value;
		
		console.log("sSeq=", sSeq);
		console.log("content=", content);
		$.ajax({
			type:'POST',
			url :'comments/insertComment',
			data :	{"sSeq":sSeq, "content":content},		
			success: function(data) {
				if(data == 'success'){
					getCommentList();
					$("#content").val("");
				}else if(data == 'fail') {
					alert("등록실패");
				}else if(data == 'not_login') {
					alert('로그인이 필요합니다');
				}else if(data == null) {
					alert('내용을 입력하세요');
				}
			},
			error: function(request, status, error){
				alert("error: " + error);
			}				
		});
	}
	

</script>




</body>
</html>