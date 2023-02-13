<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<!-- Facebook Meta Tags / íì´ì¤ë¶ ì¤í ê·¸ëí -->
<meta property="og:url" content="http://kindtiger.dothome.co.kr/insta">
<meta property="og:type" content="website">
<meta property="og:title" content="instagram">
<meta property="og:description" content="instagram clone">
<meta property="og:image"
	content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">
.
<!-- Twitter Meta Tags / í¸ìí° -->
<meta name="twitter:card" content="instagram clone">
<meta name="twitter:title" content="instagram">
<meta name="twitter:description" content="instagram clone">
<meta name="twitter:image"
	content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">

<!-- Google / Search Engine Tags / êµ¬ê¸ ê²ì ìì§ -->
<meta itemprop="name" content="instagram">
<meta itemprop="description" content="instagram clone">
<meta itemprop="image"
	content="http://kindtiger.dothome.co.kr/insta/imgs/instagram.jpeg">


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

.contents .img_section .trans_inner video {
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>



	<section id="container">
		<header id="header">
			<section class="h_inner">

				<h1 class="logo">
					<a href="home.do" id="goProfile" onclick="check_id()">
						<div class="sprite_insta_icon"></div>
						<div class="sprite_write_logo"></div>

					</a>
				</h1>

				<div class="search_field">
					<input type="text" placeholder="검색" tabindex="0">

					<div class="fake_field">
						<span class=sprite_small_search_icon></span> <span>검색</span>
					</div>
				</div>

				<input type="hidden" id="check" value="${sessionScope.user.id}">
				<div class="right_icons">
					<a id="goProfile1" href="goInsertBoard.do" onclick="check_id()"><div
							class="sprite_camera_icon"></div></a> <a id="goProfile2" href="/"
						onclick="check_id()"><div class="sprite_compass_icon"></div></a> <a
						id="goProfile3" href="getLikeList.do?id=${sessionScope.user.id}"
						onclick="check_id()"><div class="sprite_heart_icon_outline"></div></a>
					<a id="goProfile4" href="profile.do?id=${sessionScope.user.id}"
						onclick="check_id()"><div class="sprite_user_icon_outline"></div></a>
					<a href="insertShorts"><div class="sprite_short_icon"></div></a>
				</div>
			</section>
		</header>


		<div id="main_container">

			<section class="b_inner">

				<div class="contents_box">

					<article class="contents cont01">

						<div class="img_section">
							<div class="trans_inner">
								<div>
									<!--  <img src="imgs/img_section/img03.jpg" alt="">  -->
									<video controls preload="metadata" autoplay="autoplay">
										<source src="shorts/${shorts.upload}#t=0.5">
									</video>
								</div>
							</div>
						</div>


						<div class="detail--right_box">

							<header class="top">
								<div class="user_container">
									<div class="profile_img">
										<img src="profile/${profile}" alt="">
									</div>
									<div class="user_name">
										<div class="nick_name">${shorts.id }</div>
										<div class="country">Seoul, South Korea</div>
									</div>
								</div>
								<c:if test="${sessionScope.user.id == shorts.id}">
									<div class="sprite_more_icon" data-name="more"
										onclick="toggle(this.children[0])">
										<ul class="toggle_box" id="toggle_box${status.count}">
											<li><input type="submit" class="follow" value="팔로우"
												data-name="follow"></li>

											<li><a href="updateShorts?sSeq=${shorts.sSeq}"> <input
													type="button" value="수정"></a></li>

											<li><form action="deleteShorts?sSeq=${shorts.sSeq}"
													method="post">
													<c:if test="${sessionScope.user.id == shorts.id }">
														<input type="submit" value="삭제">
													</c:if>
												</form></li>
										</ul>

									</div>
								</c:if>

							</header>

							<section class="scroll_section">
								<div class="admin">
									<img src="profile/${profile}" alt="user">
								</div>

								<c:forEach items="${shortsCommentList}" var="shortsComment">
									<div class="user_container-detail">
										<div class="user">
											<!--  <img src="profile/${commentMemberList[status.index].profile}"
												alt="user"> -->
											프사
										</div>
										<div class="comment">
											<span class="user_id">${shortsComment.id}</span>
											<div class="scomment" style="width: 230px">
												${shortsComment.content}</div>
											<div class="time" style="font-size: small;">
												<fmt:formatDate var="comDate"
													value="${shortsComment.inDate}" pattern="yyyy년MM월dd일HH시" />
												${comDate}에 작성된 글.
												<!-- <span class="try_comment">ëµê¸ ë¬ê¸°</span>  -->
											</div>


											<div class="icon_wrap">
												<div class="more_trigger">
													<div class="sprite_more_icon" data-name="more"
														onclick="toggle(this.children[0])">
														<ul class="toggle_box2"
															id="toggle_box${shortsComment.scSeq}">
															<li><a
																href="follow.do?id1=${sessionScope.user.id}&id2=${shortsComment.id}">
																	<input type="hidden" value="${shortsComment.scSeq}">
																	<input type="button" value="팔로우">
															</a></li>
															<c:if test="${sessionScope.user.id == shortsComment.id}">
																<li><a
																	href="updateShortsComment?scSeq=${shortsComment.scSeq}">
																		<input type="button" value="수정">

																</a></li>
																<li><form
																		action="deleteShortsComment?scSeq=${shortsComment.scSeq}"
																		method="post">

																		<input type="submit" value="삭제">
																	</form></li>
															</c:if>
														</ul>
													</div>
												</div>
												<div>
													<div class="sprite_small_heart_icon_outline"></div>
												</div>
											</div>

										</div>
									</div>
								</c:forEach>
							</section>


							<div class="bottom_icons">
								<div class="left_icons">
									<div class="heart_btn">
										<c:choose>
											<c:when
												test="${fn:contains(sessionScope.heart , shorts.sSeq)}">
												<div onclick="deleteLike()"
													class="sprite_heart_icon_outline" id="heart" name="39"
													data-name="heartbeat"
													style="background: url('../../imgs/background01.png') no-repeat -26px -261px;">
													<form id="deleteLike" action="getDeleteHeart.do"
														method="post">
														<input type="hidden" id="sSeq" name="sSeq"
															value="${shorts.sSeq}"> <input type="hidden"
															id="id" name="id" value="${sessionScope.user.id}">
														<input type="hidden" id="profile" name="profile"
															value="${profile}">
													</form>
												</div>
											</c:when>

											<c:otherwise>
												<div onclick="like()" class="sprite_heart_icon_outline"
													id="heart" name="39" data-name="heartbeat"
													style="background: url('../../imgs/background01.png') no-repeat -52px -261px;">
													<form id="like" action="getHeart.do" method="post">
														<input type="hidden" id="sSeq" name="sSeq"
															value="${shorts.sSeq}"> <input type="hidden"
															id="id" name="id" value="${sessionScope.user.id}">
														<input type="hidden" id="profile" name="profile"
															value="${profile}">
													</form>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
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

							<div class="heart_count" style="font-weight: 900">
								좋아요${shorts.count}개</div>
							<div class="timer">
								<fmt:formatDate var="soDate" value="${shorts.inDate}"
									pattern="yyyy년 MM월 dd일" />
								${soDate}
							</div>

							<div class="commit_field">
								<form action="insertShortsComment" method="post">
									<input type="hidden" name="sSeq" value="${shorts.sSeq}">
									<input type="hidden" name="id" value="${sessionScope.user.id}">
									<input type="text" name="content" placeholder="댓글을 입력하세요">
									<div class="upload_btn m_text" data-name="comment">
										<input type="submit" value="댓글 달기">
									</div>
									<!-- <div class="upload_btn"></div> -->
								</form>
							</div>
						</div>
					</article>
				</div>
			</section>
		</div>


		<div class="del_pop">
			<div class="btn_box">
				<div class="del">삭제</div>
				<div class="cancel">취소</div>
			</div>
		</div>

	</section>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<!--<script src="js/detail.js"></script>-->
	<script type="text/javascript">
		function check_id() {
			if ($("#check").val() == '' || $("#check").val() == null) {
				alert("로그인을 해주세요");
				$("#goProfile").attr("href", "/");
			}
		}

		function toggle(element) {
			var con = document.getElementById(element.getAttribute("id"));
			if (con.style.display == 'none') {
				con.style.display = 'block';
			} else {
				con.style.display = 'none';
			}
		}
	</script>



</body>
</html>