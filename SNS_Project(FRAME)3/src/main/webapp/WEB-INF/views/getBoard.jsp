<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>Title</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/style.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
</head>
<body>


	<section id="container">


		<header id="header">
			<section class="inner">

				<h1 class="logo">
					<a href="home.do" id="goProfile" onclick="check_id()">
						<div class="sprite_insta_icon"></div>
						<div class="sprite_write_logo"></div>
					</a>
				</h1>

				<div class="search_box">
					<input type="text" placeholder="검색" id="search-field">

					<div class="fake_field">
						<span class="sprite_small_search_icon"></span> <span>검색</span>
					</div>
				</div>

				<div class="right_icons">
					<a id="goProfile" href="goInsertBoard.do" onclick="check_id()"><div
							class="sprite_camera_icon"></div></a> <a id="goProfile"
						href="login.html" onclick="check_id()"><div
							class="sprite_compass_icon"></div></a> <a id="goProfile"
						href="follow.html" onclick="check_id()"><div
							class="sprite_heart_icon_outline"></div></a> <a id="goProfile"
						href="profile.do?id=${sessionScope.user.id}" onclick="check_id()"><div
							class="sprite_user_icon_outline"></div></a> <input type="hidden"
						id="check" value="${sessionScope.user.id}">
				</div>

			</section>

		</header>

		<div class="hidden_menu">
			<div class="scroll_inner">
				<div class="user">
					<div class="thumb_img">
						<img src="imgs/thumb.jpeg" alt="프로필사진">
					</div>
					<div class="id">kindtigerrr</div>
				</div>
			</div>
		</div>


		<section id="main_container">
			<div class="inner">

				<div class="contents_box">


					<article class="contents">
						<header class="top">
							<div class="user_container">
								<div class="profile_img">
									<c:if test="${board.pay == 0}">
									<img src="profile/${memberList[status.index].profile}"
										alt="프로필이미지">
									</c:if>
									<c:if test="${board.pay != 0}">
									<!-- 광고 -->
									<img src="imgs/thumb.jpeg" alt="프로필이미지">
									</c:if>
								</div>
								<div class="user_name">
									<div class="nick_name m_text">${board.id}</div>
									<div class="country s_text">Seoul, South Korea</div>
								</div>

							</div>

							<div class="sprite_more_icon" data-name="more"
								onclick="toggle(this.children[0])">
								<ul class="toggle_box" id="toggle_box${status.count}">
									<li><input type="submit" class="follow" value="팔로우"
										data-name="follow"></li>
									<li><a href="goUpdateBoard.do?bSeq=${board.bSeq}"> <input
											type="button" value="수정"></a></li>

									<li><form action="deleteBoard.do?bSeq=${board.bSeq}"
											method="post">
											<c:if test="${sessionScope.user.id == board.id }">
												<input type="submit" value="삭제">
											</c:if>
										</form></li>
								</ul>
							</div>
						</header>

						<div class="img_section">
							<div class="trans_inner">

								<div>
									<img src="images/${board.upload}" alt="${board.id}의 이미지">
								</div>

							</div>
						</div>

						<div class="bottom_icons">
							<div class="left_icons">
								<div class="heart_btn">

									<c:choose>
										<c:when test="${fn:contains(sessionScope.heart , board.bSeq)}">
											<div onclick="deleteLike()" class="sprite_heart_icon_outline"
												id="heart" name="39" data-name="heartbeat"
												style="background: url('../../imgs/background01.png') no-repeat -26px -261px;">
												<form id="deleteLike" action="getDeleteHeart.do"
													method="post">
													<input type="hidden" id="bseq" name="bseq"
														value="${board.bSeq}"> <input type="hidden"
														id="id" name="id" value="${sessionScope.user.id}">
													<input type="hidden" id="profile" name="profile"
														value="${memberList[status.index].profile}">
												</form>
											</div>
										</c:when>

										<c:otherwise>
											<div onclick="like()" class="sprite_heart_icon_outline"
												id="heart" name="39" data-name="heartbeat"
												style="background: url('../../imgs/background01.png') no-repeat -52px -261px;">
												<form id="like" action="getHeart.do" method="post">
													<input type="hidden" id="bseq" name="bseq"
														value="${board.bSeq}"> <input type="hidden"
														id="id" name="id" value="${sessionScope.user.id}">
													<input type="hidden" id="profile" name="profile"
														value="${memberList[status.index].profile}">
												</form>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="sprite_bubble_icon"></div>
								<div class="sprite_share_icon" data-name="share"></div>
							</div>
							<div class="right_icon">
								<div class="sprite_bookmark_outline" data-name="bookmark"></div>
							</div>
						</div>

						<div class="likes m_text">
							좋아요 <span id="like-count-39">2,346</span> 개
						</div>
						<c:forEach items="${commentList}" var="comment">
							<c:if test="${comment.bseq == board.bSeq }">
								<div class="comment_container">
									<div class="comment" id="comment-list-ajax-post37">
										<div class="comment-detail">
											<div class="nick_name m_text">${comment.id}</div>
											<div>${comment.ccontent}</div>
										</div>
									</div>
									<div class="sprite_more_icon" data-name="more"
												onclick="toggle_c(this.children[0])">
												<ul class="toggle_box_c" id="toggle_box${comment.cseq}">
													<li><a href="updateComment.do?cseq=${comment.cseq}">
															<input type="button" value="수정">
													</a></li>
													<li><form
															action="deleteComment.do?cseq=${comment.cseq}"
															method="post">
															<c:if test="${sessionScope.user.id == comment.id }">
																<input type="submit" value="삭제">
															</c:if>
														</form></li>
												</ul>
											</div>
											<div class="small_heart">
												<div class="sprite_small_heart_icon_outline"></div>
											</div>
										</div>
									</c:if>
								</c:forEach>

						<div class="timer">1시간 전</div>
						<br>
						<br>

						<div class="comment_field" id="add-comment-post37">
							<form action="insertComment.do" method="post">
								<input type="hidden" name="id" value="${sessionScope.user.id}">
								<input type="hidden" name="bseq" value="${board.bSeq}">
								<input type="text" name="ccontent" id="ccontent"
									placeholder="댓글달기...">
								<div class="upload_btn m_text" data-name="comment">
									<input type="submit" value="게시">
								</div>
							</form>
						</div>
					</article>




				</div>
				<input type="hidden" id="page" value="1">

				<div class="side_box">
					<div class="user_profile">
						<div class="profile_thumb">
							<a href="profile.do?id=${sessionScope.user.id}"><img
								src="profile/${sessionScope.user.profile}" alt="프로필사진"></a>
						</div>
						<div class="detail">
							<div class="id m_text">${sessionScope.user.id}</div>
							<div class="ko_name">${sessionScope.user.name}</div>
						</div>
					</div>

					<article class="story">
						<header class="story_header">
							<div>스토리</div>
							<div class="more">모두 보기</div>
						</header>

						<div class="scroll_inner">
							<div class="thumb_user">
								<div class="profile_thumb">
									<img src="imgs/thumb02.jpg" alt="프로필사진">
								</div>
								<div class="detail">
									<div class="id">kind_tigerrrr</div>
									<div class="time">1시간 전</div>
								</div>
							</div>
							<div class="thumb_user">
								<div class="profile_thumb">
									<img src="imgs/thumb02.jpg" alt="프로필사진">
								</div>


							</div>
						</div>
					</article>

					<article class="recommend">
						<header class="reco_header">
							<div>회원님을 위한 추천</div>
							<div class="more">모두 보기</div>
						</header>

						<div class="thumb_user">
							<div class="profile_thumb">
								<img src="imgs/thumb02.jpg" alt="프로필사진">
							</div>
							<div class="detail">
								<div class="id">kind_tigerrrr</div>
								<div class="time">1시간 전</div>
							</div>
						</div>

					</article>
				</div>


			</div>
		</section>



	</section>
	<script type="text/javascript">
		
	var prev_element = null;
		
		function check_id() {
			if ($("#check").val() == '' || $("#check").val() == null) {
				alert("로그인을 해주세요");
				$("#goProfile").attr("href", "/");
			}
		}
		function deleteLike() {
			$("#deleteLike").submit();
		}
		function like() {
			$("#like").submit();
		}
		function toggle(element) {
			var con = document.getElementById(element.getAttribute("id"));
			if (con.style.display == 'none') {
				con.style.display = 'block';
			} else {
				con.style.display = 'none';
			}
		}
		
		function toggle_c(element){
			if (prev_element != null) {
				prev_element.style.display = 'none';
			}
			
			var con_c = document.getElementById(element.getAttribute("id"));
			if(con_c.style.display=='none'){
				con_c.style.display = 'block';
			}else{
				con_c.style.display = 'none';
			}
			prev_element = element;
		}
	</script>

	<script src="https://code.jquery.com/jquery-1.12.4.min.js">
		
	</script>
	<script src="js/main.js"></script>
</body>
</html>