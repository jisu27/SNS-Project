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
<link rel="stylesheet" href="css/detail-page.css">
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
<div id="main_container">

        <section class="b_inner">

            <div class="contents_box">

                <article class="contents cont01">

                    <div class="img_section">
                        <div class="trans_inner">
                            <div>
								<img alt="" src="images/${board.upload}" style="width: 800px; height:300px;">	
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
                                    <div class="nick_name">${board.id}</div>
                                    <div class="country">Seoul, South Korea</div>
                                </div>
                               
                            </div>
                            <div class="sprite_more_icon" data-name="more">
                                <ul class="more_detail">
                                    <li>이건 머야 </li>
                                    <li> </li>
                                    <li> </li>
                                </ul>
                            </div>

                        </header>

                        <section class="scroll_section">
                            <div class="admin_container">
                                <div class="admin"><img src="profile/${profile}" alt="user"></div>
                                <div class="comment">
                                    <span class="user_id">${board.id}</span>${board.content}
                                    <div class="time">${time}</div>
                                </div>
                            </div>

						<c:forEach var="comment" items="${commentList}" varStatus="status">
                            <div class="user_container-detail">
                                <div class="user"><img src="profile/${commentMemberList[status.index].profile}" alt="user"></div>
                                <div class="comment">
                                    <span class="user_id">${comment.id}</span>${comment.ccontent}
                                    <div class="time"><span class="try_comment"></span></div>
                                    <div class="icon_wrap">
                                        <div class="more_trigger">
                                            <div class="sprite_more_icon"></div>
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
                                <div>
                                    <div class="sprite_bubble_icon"></div>
                                </div>
                                <div>
                                    <div class="sprite_share_icon" data-name="share"></div>
                                </div>
                            </div>

								</div>
								<div class="sprite_bubble_icon"></div>
								<div class="sprite_share_icon" data-name="share"></div>
							</div>
							<div class="right_icon">
								<div class="sprite_bookmark_outline" data-name="bookmark"></div>
							</div>
						</div>

						<div class="likes m_text">
							좋아요 <span id="like-count-39">${board.count }</span> 개
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
												onclick="toggle(this.children[0])">
												<ul class="toggle_box" id="toggle_box2${comment.cseq}">
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


                            <div class="right_icon">
                                <div class="sprite_bookmark_outline" data-name="book-mark"></div>
                            </div>
                        </div>

                        <div class="count_likes">
                         	좋아요 <span id="like-count-39">${board.count}개</span>
                         </div>
                        <div class="timer"></div>

                        <div class="commit_field">
                            <input type="text" placeholder="댓글을 달아주세요 ! ">

                            <div class="upload_btn">게시</div>
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
		
		
	</script>

	<script src="https://code.jquery.com/jquery-1.12.4.min.js">
		
	</script>
	<script src="js/main.js"></script>
</body>
</html>