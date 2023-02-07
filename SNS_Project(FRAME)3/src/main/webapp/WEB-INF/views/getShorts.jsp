<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<a href="index.html">
						<div class="sprite_insta_icon"></div>
						<div>
							<div class="sprite_write_logo"></div>
						</div>
					</a>
				</h1>

				<div class="search_field">
					<input type="text" placeholder="ê²ì" tabindex="0">

					<div class="fake_field">
						<span class=sprite_small_search_icon></span> <span>ê²ì</span>
					</div>
				</div>


				<div class="right_icons">
					<a href="new_post.html"><div class="sprite_camera_icon"></div></a>
					<a href="login.html"><div class="sprite_compass_icon"></div></a> <a
						href="follow.html"><div class="sprite_heart_icon_outline"></div></a>
					<a href="profile.html"><div class="sprite_user_icon_outline"></div></a>
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
										<img src="imgs/thumb.jpeg" alt="">
									</div>
									<div class="user_name">
										<div class="nick_name">KindTiger</div>
										<div class="country">Seoul, South Korea</div>
									</div>
								</div>
								<div class="sprite_more_icon" data-name="more">
									<ul class="more_detail">
										<li>íë¡ì°</li>
										<li>ìì </li>
										<li>ì­ì </li>
									</ul>
								</div>

							</header>

							<section class="scroll_section">
								<div class="admin_container">
									<div class="admin">
										<img src="imgs/thumb.jpeg" alt="user">
									</div>
									<div class="comment">
										<span class="user_id">Kindtiger</span>ê°ìì§ê° ë§ì´
										íë ê°ë³´ë¤ãããããì¡°ê¸ë§íë´
										<div class="time">2ìê°</div>
									</div>
								</div>

								<div class="user_container-detail">
									<div class="user">
										<img src="imgs/thumb02.jpg" alt="user">
									</div>
									<div class="comment">
										<span class="user_id">in0.lee</span>ëë¬´ê·ì½ë¤ì
										ãããë§íí´ì~!
										<div class="time">
											2ìê° <span class="try_comment">ëµê¸ ë¬ê¸°</span>
										</div>
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

								<div class="user_container-detail">
									<div class="user">
										<img src="imgs/thumb03.jpg" alt="user">
									</div>
									<div class="comment">
										<span class="user_id">ye_solkim</span>ê°ìì§ ì´ë¦ì´
										ë­ìì???
										<div class="time">
											2ìê° <span class="try_comment">ëµê¸ ë¬ê¸°</span>
										</div>
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

								<div class="user_container-detail">
									<div class="user">
										<img src="imgs/thumb02.jpg" alt="user">
									</div>
									<div class="comment">
										<span class="user_id">in0.lee</span>ëë¬´ê·ì½ë¤ì
										ãããë§íí´ì~!
										<div class="time">
											2ìê° <span class="try_comment">ëµê¸ ë¬ê¸°</span>
										</div>
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

								<div class="user_container-detail">
									<div class="user">
										<img src="imgs/thumb03.jpg" alt="user">
									</div>
									<div class="comment">
										<span class="user_id">in0.lee</span>ëë¬´ê·ì½ë¤ì
										<div class="time">
											2ìê° <span class="try_comment">ëµê¸ ë¬ê¸°</span>
										</div>
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

								<div class="user_container-detail">
									<div class="user">
										<img src="imgs/thumb02.jpg" alt="user">
									</div>
									<div class="comment">
										<span class="user_id">in0.lee</span>ëë¬´ê·ì½ë¤ì
										ãããë§íí´ì~!
										<div class="time">
											2ìê° <span class="try_comment">ëµê¸ ë¬ê¸°</span>
										</div>
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

							</section>


							<div class="bottom_icons">
								<div class="left_icons">
									<div class="heart_btn">
										<div class="sprite_heart_icon_outline" data-name="heartbeat"></div>
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

							<div class="count_likes">
								ì¢ìì <span class="count">2,351</span> ê°
							</div>
							<div class="timer">2ìê°</div>

							<div class="commit_field">
								<input type="text" placeholder="ëê¸ë¬ê¸°..">

								<div class="upload_btn">ê²ì</div>
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

</body>
</html>