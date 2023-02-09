<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

<!-- Facebook Meta Tags / 페이스북 오픈 그래프 -->
<meta property="og:url" content="http://kindtiger.dothome.co.kr/insta">
<meta property="og:type" content="website">
<meta property="og:title" content="instagram">
<meta property="og:description" content="instagram clone">
<meta property="og:image"
	content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">
.
<!-- Twitter Meta Tags / 트위터 -->
<meta name="twitter:card" content="instagram clone">
<meta name="twitter:title" content="instagram">
<meta name="twitter:description" content="instagram clone">
<meta name="twitter:image"
	content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">

<!-- Google / Search Engine Tags / 구글 검색 엔진 -->
<meta itemprop="name" content="instagram">
<meta itemprop="description" content="instagram clone">
<meta itemprop="image"
	content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">


<title>instagram</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/profile.css">
<link rel="shortcut icon" href="imgs/instagram.png">


</head>
<body>


	<section id="container">

		<header id="header">
			<section class="h_inner">

				<h1 class="logo">
					<a href="home.do">
						<div class="sprite_insta_icon"></div>
						<div>
							<div class="sprite_write_logo"></div>
						</div>
					</a>
				</h1>

				<div class="search_field">
					<input type="text" placeholder="검색" tabindex="0">

					<div class="fake_field">
						<span class=sprite_small_search_icon></span> <span>검색</span>
					</div>
				</div>

				<input type="hidden" id="check" value="${sessionScope.user.id}">
				<div class="right_icons">
					<a id="goProfile1" href="goInsertBoard.do" onclick="check_id()"><div
							class="sprite_camera_icon"></div></a> <a id="goProfile2"
						href="login.html" onclick="check_id()"><div
							class="sprite_compass_icon"></div></a> <a id="goProfile3"
						href="follow.html" onclick="check_id()"><div
							class="sprite_heart_icon_outline"></div></a> <a id="goProfile4"
						href="profile.do?id=${sessionScope.user.id}" onclick="check_id()"><div
							class="sprite_user_icon_outline"></div></a>
				</div>
			</section>
		</header>


		<div id="main_container">

			<section class="b_inner">

				<div class="hori_cont">
					<div class="profile_wrap">
						<div class="profile_img">
							<img src="profile/${member.profile}" alt="profile">
						</div>
					</div>
                <div class="detail">
                    <div class="top">
                        <div class="user_name">${member.name}</div>
                        <c:choose>
                        	<c:when test="${sessionScope.user.id==member.id}">
	    	                    <a href="profile_edit.html" class="profile_edit">프로필편집</a>
		                        <a href="logout.do" class="logout">로그아웃</a>
                        	</c:when>
                        	<c:otherwise>
                        				<c:choose>
		                        		<c:when test="${fn:contains(sessionScope.follower,member.id)}">
			                        		<a href="deleteFollow.do?id1=${sessionScope.user.id}&id2=${member.id}">언 팔로우</a>
		    	                    		<a href="#">메시지</a>
		                        		</c:when>
		                        		<c:otherwise>
			                        		<a href="follow.do?id1=${sessionScope.user.id}&id2=${member.id}">팔로우</a>
		    	                    		<a href="#">메시지</a>
		                        		</c:otherwise>
	                        			</c:choose>                       		                      			
                        	</c:otherwise>
                        </c:choose>
                    </div>

                    <ul class="middle">
                        <li>     
                            <span>게시물 : ${board.count}</span>
                            
                        </li>
                        <li>
                            <span onclick="window.open('followList.do?id2=${member.id}','_blank','width:500px; height: 150px;')">팔로워</span>
                            ${follower}
                        </li>
                        <li>
                            <span onclick="window.open('followList.do?id1=${member.id}','_blank','width:500px; height: 150px;')">팔로우</span>
                            ${following}
                        </li>
                    </ul>
                    <p class="about">
                        <span class="nick_name">${sessionScope.user.name}</span>
                        <span class="book_mark">bookmark</span>
                    </p>

					</div>
				</div>
				<c:forEach var="board" items="${boardList}">
					<div class="mylist_contents contents_container active">
						<div class="pic">
							<a
								href="getBoard.do?bSeq=${board.bSeq}&profile=${member.profile}"><img
								src="images/${board.upload}" alt=""></a>
						</div>
					</div>
				</c:forEach>



				<div class="bookmark_contents contents_container">
					<div class="pic">
						<a href="#"><img src="imgs/img_section/img03.jpg" alt=""></a>
					</div>
				</div>




			</section>
		</div>


	</section>
<!--<script src="js/insta.js"></script>-->
<script src="js/profile.js"></script>
<script src="js/common.js"></script>
<script>
function check_id() {	
	if ($("#check").val()=='' || $("#check").val()==null) {
		alert("로그인을 해주세요");
		$("#goProfile1").attr("href","/");
		$("#goProfile2").attr("href","/");
		$("#goProfile3").attr("href","/");
		$("#goProfile4").attr("href","/");
		$("#goProfile5").attr("href","/");
	}
}


</script>
</body>
</html>