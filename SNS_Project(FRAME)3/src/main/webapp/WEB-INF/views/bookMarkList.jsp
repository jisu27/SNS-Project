<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/profile.css">
</head>
<body>
<h1>북마크 리스트</h1>

	<c:forEach items="${bookMarkList}" var="bookMark" varStatus="status">
		<!-- 보드 게시글 -->
		<c:if test="${bookMark.bSeq != 0}">
			<article class="contents">
				<header class="top">
					<div class="user_container">
						<div class="profile_img">
							<a href="profile.do?id=${board.id}"><img
								src="profile/${memberList[status.index].profile}" alt="프로필이미지"></a>
						</div>
						<div class="user_name">
							<div class="nick_name m_text">${board.id}</div>
							<div class="country s_text">Seoul, South Korea</div>
						</div>
					</div>
				</header>

				<div class="img_section">
					<div class="trans_inner">
						<c:if test="${board.upload=='null'}">
							<br>
							<div class="con">
								<pre>${board.content }</pre>
							</div>
						</c:if>
						<c:if test="${board.upload!='null'}">
							<a href="getBoard.do?bSeq=${board.bSeq}&profile=${memberList[status.index].profile}&time=${time[status.index]}">
								<img src="images/${board.upload}" alt="${board.id}의 이미지">
							</a>
							<br>
							<div class="con">
								<pre>${board.content}</pre>
							</div>
						</c:if>
					</div>
				</div>

				<div class="timer">${time[status.index]}</div>
			</article>
		</c:if>
		
		<!-- 쇼츠 게시글 -->
		<c:if test="${bookMark.sSeq != 0}">
			<article class="contents">
				<header class="top">
					<div class="user_container">
						<div class="profile_img">
							<a href="profile.do?id=${shorts.id}"><img
								src="profile/${memberList[status.index].profile}" alt="프로필이미지"></a>
						</div>
						<div class="user_name">
							<div class="nick_name m_text">${shorts.id}</div>
							<div class="country s_text">Seoul, South Korea</div>
						</div>
					</div>
				</header>

				<div class="img_section">
					<div class="trans_inner">
						<c:if test="${shorts.upload!='null'}">
							<a href="getShorts?sSeq=${shorts.sSeq}"> <video
									id="video-player" onmouseover="this.play()"
									onmouseout="this.pause()" preload="metadata">
									<source src="shorts/${shorts.upload}#t=0.5">
								</video>
							</a>
							<br>
							<div class="con">
								<pre>${shorts.sContent}</pre>
							</div>
						</c:if>
					</div>
				</div>

				<div class="timer">${time[status.index]}</div>
			</article>
		</c:if>

	</c:forEach>

</body>
</html>