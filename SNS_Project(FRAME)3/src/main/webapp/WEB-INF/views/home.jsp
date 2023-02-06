<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
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
                    <span class="sprite_small_search_icon"></span>
                    <span>검색</span>
                </div>
            </div>

                <input type="hidden" id="check" value="${sessionScope.user.id}">
            <div class="right_icons">
                <a id="goProfile1" href="goInsertBoard.do" onclick="check_id()"><div class="sprite_camera_icon"></div></a>
                <a id="goProfile2" href="login.html" onclick="check_id()"><div class="sprite_compass_icon"></div></a>
                <a id="goProfile3" href="follow.html" onclick="check_id()"><div class="sprite_heart_icon_outline"></div></a>
                <a id="goProfile4" href="profile.do?id=${sessionScope.user.id}" onclick="check_id()"><div class="sprite_user_icon_outline"></div></a>
            </div>

        </section>

    </header>

    <div class="hidden_menu">
        <div class="scroll_inner">
            <div class="user">
                <div class="thumb_img"><img src="imgs/thumb.jpeg" alt="프로필사진"></div>
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
                            
                                <a ><img src="profile/${memberList[status.index].profile}" alt="프로필이미지"></a>
                            
                            </div>
                            <div class="user_name">
                                <div class="nick_name m_text">${board.id}</div>
                                <div class="country s_text">Seoul, South Korea</div>
                            </div>

                        </div>
							
                        <div class="sprite_more_icon"  data-name="more">
                            <ul class="toggle_box">
                                <li><input type="submit" class="follow" value="팔로우" data-name="follow"></li>
                                <li>수정</li>
                                <li>삭제</li>
                            </ul>
                        </div>
                    </header>

                    <div class="img_section">
                        <div class="trans_inner">
      
                            <div><a href="getBoard.do?bSeq=${board.bSeq}&profile=${memberList[status.index].profile}"><img src="images/${board.upload}" alt="${board.id}의 이미지"></a></div>
       
                        </div>
                    </div>
                    
                    <div class="bottom_icons">
                        <div class="left_icons">
                            <div class="heart_btn">
                                <c:choose>
	                                <c:when test="${fn:contains(sessionScope.heart,board.bSeq)}">
	                                	<div onclick="deleteLike(deleteLike${status.count})" class="sprite_heart_icon_outline" id="heart" name="39" data-name="heartbeat" style="background: url('../../imgs/background01.png') no-repeat -26px -261px;">
	                                		<form id="deleteLike${status.count}" method="post">
												<input type="hidden" id="bseq" name="bSeq" value="${board.bSeq}">
												<input type="hidden" id="id" name="id"  value="${sessionScope.user.id}">
											</form>
	                                	</div>
	                                	
	                                </c:when>
	                                
	                                <c:otherwise>
	                                	<div onclick="like(like${status.count})" class="sprite_heart_icon_outline" id="heart" name="39" data-name="heartbeat" style="background: url('../../imgs/background01.png') no-repeat -52px -261px;">
	                                		<form id="like${status.count}"  method="post">
												<input type="hidden" id="bseq" name="bSeq" value="${board.bSeq}">
												<input type="hidden" id="id" name="id"  value="${sessionScope.user.id}">	
											
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
                        좋아요
                        <span id="like-count-39">${likeList[status.index]}</span>
                        개
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
                    <form action="deleteComment.do">
                    <c:if test="${sessionScope.user.id == comment.id }">
                    <input type="submit" value="삭제" name= "">     
                    <input type="hidden" id="cseq" name="cseq" value="${comment.cseq}">          
                    </c:if>
                    </form> 
                        <div class="small_heart">
                            <div class="sprite_small_heart_icon_outline"></div>
                        </div>
                    </div>
                    </c:if>
                    <br>
                   </c:forEach>
                   
                    <div class="timer">${time[status.index]}</div>

                    <div class="comment_field" id="add-comment-post37">
                    <form action="insertComment.do" method="post">
                    <input type="hidden" name="id" value="${sessionScope.user.id}"> 
                    <input type="hidden" name="bseq" value="${board.bSeq}">
                        <input type="text" name="ccontent" id="ccontent" placeholder="댓글달기...">
                        <div class="upload_btn m_text" data-name="comment"><input type="submit" value="게시"></div>
                    </form>
                    </div>
                </article>
                
                <!-- 광고 게시물 -->
						<c:if test="${status.index%3==0}">

							<article class="contents">
								<header class="top">
									<div class="user_container">
										<div class="profile_img">
											<img src="imgs/thumb.jpeg" alt="프로필이미지">
										</div>
										<div class="user_name">
											<div class="nick_name m_text">${adverList[status.index/3].id}</div>
											<div class="country s_text">Seoul, South Korea</div>
										</div>

									</div>

									<div class="sprite_more_icon" data-name="more" onclick="toggle(toggle_box${status.index})">
										<ul class="toggle_box" id="toggle_box${status.index}">
											<li><input type="submit" class="follow" value="팔로우"
												data-name="follow"></li>
											<li>수정</li>
											<li>삭제</li>
										</ul>
									</div>
									
									
								</header>

								<div class="img_section">
									<div class="trans_inner">
										<a href="getBoard?aSeq=${adverList[status.index/3].aSeq}">
											<img src="adverimages/${adverList[status.index/3].img}"
											alt="visual01">
										</a>
									</div>
								</div>

								<div class="bottom_icons">
									<div class="left_icons">
										<div class="heart_btn">
											<div class="sprite_heart_icon_outline" name="39"
												data-name="heartbeat"></div>
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

								<div class="comment_container">
									<div class="comment" id="comment-list-ajax-post37">
										<div class="comment-detail">
											<div class="nick_name m_text">dongdong2</div>
											<div>강아지가 너무 귀여워요~!</div>
										</div>
									</div>
									<div  class="small_heart">
										<div class="sprite_small_heart_icon_outline"></div>
									</div>
								</div>

								<div class="timer"><fmt:formatDate value="${adverList[status.index/3].inDate}" pattern="yyyy-MM-dd" /></div>

								<div class="comment_field" id="add-comment-post37">
									<input type="text" placeholder="댓글달기...">
									<div class="upload_btn m_text" data-name="comment">게시</div>
								</div>
							</article>
						</c:if>
                
				</c:forEach>
				
  

            </div>
            <input type="hidden" id="page" value="1">

            <div class="side_box">
                <div class="user_profile">
                    <div class="profile_thumb">
                        <a href="profile.do?id=${sessionScope.user.id}"><img src="profile/${sessionScope.user.profile}" alt="프로필사진"></a>
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
                                <img src="profile/${sessionScope.user.profile}" alt="프로필사진">
                            </div>
                            <div class="detail">
                                <div class="id">${sessionScope.user.id}</div>
                                <div class="time">1시간 전</div>
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
                            <div class="time"></div>
                        </div>
                    </div>
				
                    
                </article>
            </div>


        </div>
    </section>



</section>
<script type="text/javascript">
$(function () {
	if ($("#check").val()==null || $("#check").val()=='' ) {
		alert("로그인을 해주세요");
		location.href ="/";
	}
})

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

function toggle(index){ 	
 
    if($(index).attr("style","displaye:none")){ 
    	
    	$(".toggle_box").attr("style","display:block");
    	$(".contents .toggle_box").attr("style","cursor:pointer");
    }else{ 		
    	$(".contents .toggle_box").attr("style","display:none"); 	
    } 
}
</script>

<script src="js/main.js"></script>
</body>
</html>