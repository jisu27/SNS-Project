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
					<a href="home.do" id="goProfile5" onclick="check_id()">
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

				<input type="hidden" id="check" value="${sessionScope.user.id}">
				<div class="right_icons">
					<a id="goProfile1" href="goInsertBoard.do" onclick="check_id()"><div
							class="sprite_camera_icon"></div></a> <a id="goProfile2"
						href="/" onclick="check_id()"><div
							class="sprite_compass_icon"></div></a> <a id="goProfile3"
						href="getLikeList.do?id=${sessionScope.user.id}" onclick="check_id()"><div
							class="sprite_heart_icon_outline"></div></a> <a id="goProfile4"
						href="profile.do?id=${sessionScope.user.id}" onclick="check_id()"><div
							class="sprite_user_icon_outline"></div></a>
					<a href="insertShorts"><div class="sprite_short_icon"></div></a>		
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

					<c:forEach items="${boardList}" var="board" varStatus="status">

						<article class="contents">
							<header class="top">
								<div class="user_container">
									<div class="profile_img">
										<a href="profile.do?id=${board.id}"><img src="profile/${memberList[status.index].profile}"
											alt="프로필이미지"></a>
									</div>
									<div class="user_name">
										<div class="nick_name m_text">${board.id}</div>
										<div class="country s_text">Seoul, South Korea</div>
									</div>

								</div>

							<c:if test="${sessionScope.user.id == board.id}">
								<div class="sprite_more_icon" data-name="more"
									onclick="toggle(this.children[0])">
									<ul class="toggle_box" id="toggle_box${status.count}">
									
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
								</c:if>

							</header>

							<div class="img_section">
								<div class="trans_inner">
									<!-- 이미지 upload가 있는지 없는지 -->
									<c:if test="${board.upload=='null'}">
										<br>
										<div class="con">
											<pre>${board.content }</pre>
										</div>
									</c:if>
									<c:if test="${board.upload!='null'}">
										<a
											href="getBoard.do?bSeq=${board.bSeq}&profile=${memberList[status.index].profile}&time=${time[status.index]}"><img
											src="images/${board.upload}" alt="${board.id}의 이미지"></a>
										<br>
										<div class="con">
											<pre>${board.content}</pre>
										</div>
									</c:if>


								</div>
							</div>

							<div class="bottom_icons">
								<div class="left_icons">
									<div class="heart_btn">
										<c:choose>
											<c:when test="${fn:contains(sessionScope.heart,board.bSeq)}">
												<div onclick="deleteLike(deleteLike${status.count})"
													class="sprite_heart_icon_outline" id="heart" name="39"
													data-name="heartbeat"
													style="background: url('../../imgs/background01.png') no-repeat -26px -261px;">
													<form id="deleteLike${status.count}" method="post">
														<input type="hidden" id="bseq" name="bSeq"
															value="${board.bSeq}"> <input type="hidden"
															id="id" name="id" value="${sessionScope.user.id}">
													</form>
												</div>

											</c:when>

											<c:otherwise>
												<div onclick="like(like${status.count})"
													class="sprite_heart_icon_outline" id="heart" name="39"
													data-name="heartbeat"
													style="background: url('../../imgs/background01.png') no-repeat -52px -261px;">
													<form id="like${status.count}" method="post">
														<input type="hidden" id="bseq" name="bSeq"
															value="${board.bSeq}"> <input type="hidden"
															id="id" name="id" value="${sessionScope.user.id}">

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
								좋아요 <span id="like-count-39">${board.count}</span> 개
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
										<c:if test="${sessionScope.user.id == comment.id}">
										<div class="sprite_more_icon" data-name="more"
		                                    onclick="toggle(this.children[0])">
		                                    <ul class="toggle_box" id="toggle_box${comment.cseq}">         
		                                       <li><a href="goUpdateComment.do?cseq=${comment.cseq}">
		                                             <input type="button" value="수정">
		                                       </a></li>
		                                       <li><form
		                                             action="deleteComment.do?cseq=${comment.cseq}"
		                                             method="post">
		                                                <input type="submit" value="삭제">
		                                          </form></li>
		                                    </ul>
                               			  </div>
		                                             </c:if>
										<div class="small_heart">
											<div class="sprite_small_heart_icon_outline"></div>
										</div>
									</div>
								</c:if>
							</c:forEach>

							<div class="timer">${time[status.index]}</div>

							<br> <br>

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

						<!-- 광고 게시물 -->
						<c:if test="${status.index%3==0}">
						<c:if test="${not empty adverList[status.index/3]}">

							<article class="contents">
								<header class="top">
									<div class="user_container">
										<div class="profile_img">
											<a href="profile.do?id=${adverList[status.index/3].id}"><img src="${admemberList[status.index/3].profile}" alt="프로필이미지"></a>
										</div>
										<div class="user_name">
											<div class="nick_name m_text">${adverList[status.index/3].id}</div>
											<div class="country s_text">Seoul, South Korea</div>
										</div>

									</div>

									<c:if test="${sessionScope.user.id == adverList[status.index/3].id}">
									<div class="sprite_more_icon" data-name="more"
										onclick="toggle(this.children[0])">
										<ul class="toggle_box" id="toggle_box2${status.count}">
											<li><input type="submit" class="follow" value="팔로우"
												data-name="follow"></li>
											<li><a
												href="goUpdateBoard.do?bSeq=${adverList[status.index/3].bSeq}">
													<input type="button" value="수정">
											</a></li>

											<li><form
													action="deleteBoard.do?bSeq=${adverList[status.index/3].bSeq}"
													method="post">
													<c:if test="${sessionScope.user.id == board.id }">
														<input type="submit" value="삭제">
													</c:if>
												</form></li>
										</ul>
									</div>
									</c:if>




								</header>

								<div class="img_section">
									<div class="trans_inner">
										<a href="getBoard.do?bSeq=${adverList[status.index/3].bSeq}&profile=${admemberList[status.index/3].profile}&time=${adtime[status.index/3]}">
											<img src="images/${adverList[status.index/3].upload}"
											alt="visual01">
										</a>

									</div>
									<br>
									<div class="con">${adverList[status.index/3].content }</div>
								</div>
								<br>
								<div class="bottom_icons">
									<div class="left_icons">
										<div class="heart_btn">
											<c:choose>

											<c:when test="${fn:contains(sessionScope.heart,adverList[status.index/3].bSeq)}">
												<div onclick="deleteLike(deleteLike${status.count})"
													class="sprite_heart_icon_outline" id="heart" name="39"
													data-name="heartbeat"
													style="background: url('../../imgs/background01.png') no-repeat -26px -261px;">
													<form id="deleteLike${status.count}" method="post">
														<input type="hidden" id="bseq" name="bSeq"
															value="${adverList[status.index/3].bSeq}"> <input type="hidden"
															id="id" name="id" value="${sessionScope.user.id}">
													</form>
												</div>

											</c:when>

											<c:otherwise>
												<div onclick="like(like2${status.count})"
													class="sprite_heart_icon_outline" id="heart" name="39"
													data-name="heartbeat"
													style="background: url('../../imgs/background01.png') no-repeat -52px -261px;">
													<form id="like2${status.count}" method="post">
														<input type="hidden" id="bseq" name="bSeq"
															value="${adverList[status.index/3].bSeq}"> <input type="hidden"
															id="id" name="id" value="${sessionScope.user.id}">

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
									좋아요 <span id="like-count-39">${adverList[status.index/3].count}</span> 개
								</div>

								<c:forEach items="${adcommentList}" var="comment">
									<c:if test="${comment.bseq == adverList[status.index/3].bSeq }">
										<div class="comment_container">
											<div class="comment" id="comment-list-ajax-post37">
												<div class="comment-detail">
													<div class="nick_name m_text">${comment.id}</div>
													<div>${comment.ccontent}</div>
												</div>
											</div>
											<c:if test="${sessionScope.user.id == comment.id}">
											<div class="sprite_more_icon" data-name="more"
												onclick="toggle_c(this.children[0])">
												<ul class="toggle_box" id="toggle_box${comment.cseq}">
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
											</c:if>
											<div class="small_heart">
												<div class="sprite_small_heart_icon_outline"></div>
											</div>
										</div>
									</c:if>
								</c:forEach>

								<div class="timer">
									${adtime[status.index/3]}
								</div>
									<br>
									<br>

								<div class="comment_field" id="add-comment-post37">
									<form action="insertComment.do" method="post">
										<input type="hidden" name="id" value="${sessionScope.user.id}">
										<input type="hidden" name="bseq"
											value="${adverList[status.index/3].bSeq}"> <input
											type="text" name="ccontent" id="ccontent"
											placeholder="댓글달기...">
										<div class="upload_btn m_text" data-name="comment">
											<input type="submit" value="게시">
										</div>
									</form>
								</div>
							</article>
						</c:if>
						</c:if>
						

					</c:forEach>



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
							<a href="getShortsList"><div class="more">모두 보기</div></a>
						</header>

						<div class="scroll_inner">
							<c:forEach items="${shortsList}" var="shorts" varStatus="status">
								<div class="thumb_user">
									<div class="profile_thumb">
										<a href="getShorts?sSeq=${shorts.sSeq}"><img
								src="profile/${sessionScope.user.profile}" alt="프로필사진"></a>
									</div>
									<div class="detail">
									
									
										<div class="id">${shorts.id}</div>
										<div class="time">${stime[status.index]}</div>
									
									</div>
								</div>								
							</c:forEach>
						</div>
					</article>

					<article class="recommend">
						<header class="reco_header">
							<div>회원님을 위한 추천</div>
							<div class="more">모두 보기</div>
						</header>
					<c:forEach var="reco" items="${recoMember}">
						<div class="thumb_user">
						
							<div class="profile_thumb">
								<a href="profile.do?id=${reco.id}"><img src="../profile/${reco.profile}" alt=""></a>
							</div>
							<div class="detail">
								<div class="id">${reco.id}</div>
								<div class="time"></div>
							</div>
						</div>
					</c:forEach>

					</article>
				</div>


			</div>
		</section>



	</section>
	<script src="js/common.js"></script>
	<script type="text/javascript">
	var prev_element = null;
	
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
function deleteLike(form_id) {
	$(form_id).attr("action","deleteHeart.do").submit();
	
}
function like(form_id) {
	$(form_id).attr("action","heart.do").submit();	
}
function toggle(element){
	
	var con = document.getElementById(element.getAttribute("id"));
	if(con.style.display=='none'){
		con.style.display = 'block';
	}else{
		con.style.display = 'none';
	}
	
}

</script>


</body>
</html>
