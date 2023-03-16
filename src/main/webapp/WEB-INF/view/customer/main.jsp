<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">
    <title>Panagea | Premium site template for travel agencies, hotels and restaurant listing.</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="resources/html/img/favicon.ico" type="resources/html/image/x-icon">
    <link rel="apple-touch-icon" type="resources/html/image/x-icon" href="resources/html/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="resources/html/image/x-icon" sizes="72x72" href="resources/html/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="resources/html/image/x-icon" sizes="114x114" href="resources/html/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="resources/html/image/x-icon" sizes="144x144" href="resources/html/img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="resources/html/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/html/css/style.css" rel="stylesheet">
	<link href="resources/html/css/vendors.css" rel="stylesheet">
	
	<!-- SPECIFIC CSS -->
    <link href="resources/html/layerslider/css/layerslider.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="resources/html/css/custom.css" rel="stylesheet">

</head>

<body>
	
	<div id="page">
	
	<header class="header menu_fixed">
		<ul id="top_menu">
			<li><a href="" class="cart-menu-btn" title="Cart"></a></li>
			<!--  
			<li><a href="" id="sign-in" class="login" title="Sign In">Sign In</a></li>
			-->
			<li><a href="" class="wishlist_bt_top" title="Your wishlist">Your wishlist</a></li>
		</ul>
		<!-- /top_menu -->
		<a href="#menu" class="btn_mobile">
			<div class="hamburger hamburger--spin" id="hamburger">
				<div class="hamburger-box">
					<div class="hamburger-inner"></div>
				</div>
			</div>
		</a>
		<nav id="menu" class="main-menu">
			<ul>
				<li><span><a href="">홈</a></span></li>
				<li><span><a href="">신상품</a></span></li>
				<li><span><a href="">베스트</a></span></li>
				<li>
					<a href="${pageContext.request.contextPath}/goods/category?typeNo=1&keyword=">뷰티</a>
					<ul>
						<li>
							<a href="${pageContext.request.contextPath}/goods/category?typeNo=2&keyword=">향수</a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=3&keyword=">여성향수</a></li>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=4&keyword=">남성향수</a></li>
							</ul>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/goods/category?typeNo=5&keyword=">헤어/바디</a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=6&keyword=">샴푸/린스</a></li>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=7&keyword=">바디워시/로션</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/goods/category?typeNo=8&keyword=">패션</a>
					<ul>
						<li>
							<a href="${pageContext.request.contextPath}/goods/category?typeNo=9&keyword=">여성패션</a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=10&keyword=">아우터</a></li>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=11&keyword=">상의</a></li>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=12&keyword=">하의</a></li>
							</ul>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/goods/category?typeNo=13&keyword=">남성패션</a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=14&keyword=">아우터</a></li>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=15&keyword=">상의</a></li>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=16&keyword=">하의</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/goods/category?typeNo=17&keyword=">마켓</a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=18&keyword=">신선식품</a></li>
						<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=19&keyword=">밀키트</a></li>
					</ul>
				</li>
				<li><span><a href="">이벤트</a></span></li>
				<li><span><a href="">고객센터</a></span></li>
				<li><span><a href="${pageContext.request.contextPath }/customer/logout">로그아웃</a></span></li>
			</ul>		
		</nav>

	</header>
	<!-- /header -->

	<main>
		<!-- Slider -->
		<div id="full-slider-wrapper">
			<div id="layerslider" style="width:100%;height:750px;">
				<!-- first slide -->
				<div class="ls-slide" data-ls="slidedelay: 5000; transition2d:85;">
					<img src="${pageContext.request.contextPath}/upload/goodsImg/img02.jpg" class="ls-bg" alt="Slide background">
					<h3 class="ls-l slide_typo" style="top: 47%; left: 50%;" data-ls="offsetxin:0;durationin:2000;delayin:1000;easingin:easeOutElastic;rotatexin:90;transformoriginin:50% bottom 0;offsetxout:0;rotatexout:90;transformoriginout:50% bottom 0;"><strong>HYPER BLOOM</strong></h3>
					<p class="ls-l slide_typo_2" style="top:55%; left:50%;" data-ls="durationin:2000;delayin:1000;easingin:easeOutElastic;">
						SPRING IS COMING
					</p>
					<p class="ls-l" style="top:70%; left:50%;" data-ls="durationin:2000;delayin:1400;easingin:easeOutElastic;"><a class="btn_1 rounded" data-ls="durationin:2000;delayin:1400;easingin:easeOutElastic;" href=''>Read more</a></p>
					
				</div>
				<!-- second slide -->
				<div class="ls-slide" data-ls="slidedelay:5000; transition2d:103;">
					<img src="${pageContext.request.contextPath}/upload/goodsImg/img03.jpg" class="ls-bg" alt="Slide background">
					<h3 class="ls-l slide_typo" style="top: 47%; left: 50%;" data-ls="offsetxin:0;durationin:2000;delayin:1000;easingin:easeOutElastic;rotatexin:90;transformoriginin:50% bottom 0;offsetxout:0;rotatexout:90;transformoriginout:50% bottom 0;"><strong>HAPPY WHITE DAY</strong></h3>
					<p class="ls-l slide_typo_2" style="top:55%; left:50%;" data-ls="durationin:2000;delayin:1000;easingin:easeOutElastic;">
						몽블랑 화이트데이 기프트
					</p>
					<p class="ls-l" style="top:70%; left:50%;" data-ls="durationin:2000;delayin:1400;easingin:easeOutElastic;"><a class="btn_1 rounded" data-ls="durationin:2000;delayin:1400;easingin:easeOutElastic;" href=''>Read more</a></p>
				</div>
				<!-- third slide -->
				<div class="ls-slide" data-ls="slidedelay: 5000; transition2d:5;">
					<img src="${pageContext.request.contextPath}/upload/goodsImg/img04.jpg" class="ls-bg" alt="Slide background">
					<h3 class="ls-l slide_typo" style="top:47%; left: 50%;" data-ls="offsetxin:0;durationin:2000;delayin:1000;easingin:easeOutElastic;rotatexin:90;transformoriginin:50% bottom 0;offsetxout:0;rotatexout:90;transformoriginout:50% bottom 0;"><strong>JO MALONE LONDON</strong></h3>
					<p class="ls-l slide_typo_2" style="top:55%; left:50%;" data-ls="durationin:2000;delayin:1000;easingin:easeOutElastic;">
						The Blossoms Collection
					</p>
					<p class="ls-l" style="top:70%; left:50%;" data-ls="durationin:2000;delayin:1400;easingin:easeOutElastic;"><a class="btn_1 rounded" data-ls="durationin:2000;delayin:1400;easingin:easeOutElastic;" href=''>Read more</a></p>
				</div>
			</div>
		</div>
		<!-- End layerslider -->
		<div class="container container-custom margin_80_55">
			<section class="add_bottom_45">
				<div class="main_title_3">
					<span><em></em></span>
					<h2>Brand Look Book</h2>
					<p>CHANEL</p>
				</div>

				<div id="reccomended_adventure" class="owl-carousel owl-theme">

					<div class="item">
						<a href="" class="grid_item_adventure">
							<figure>
								<div class="score"><strong>7.9</strong></div>
								<img src="${pageContext.request.contextPath}/upload/goodsImg/img09.jpg" class="img-fluid" alt="">
								<div class="info">
									<em>CHANEL</em>
									<h3>spring-summer<br>2023-pre-collection</h3>
								</div>
							</figure>
						</a>
					</div>

					<div class="item">
						<a href="" class="grid_item_adventure">
							<figure>
								<div class="score"><strong>9.0</strong></div>
								<img src="${pageContext.request.contextPath}/upload/goodsImg/img10.jpg" class="img-fluid" alt="">
								<div class="info">
									<em>CHANEL</em>
									<h3>spring-summer<br>2023-pre-collection</h3>
								</div>
							</figure>
						</a>
					</div>

					<div class="item">
						<a href="" class="grid_item_adventure">
							<figure>
								<div class="score"><strong>9.5</strong></div>
								<img src="${pageContext.request.contextPath}/upload/goodsImg/img11.jpg" class="img-fluid" alt="">
								<div class="info">
									<em>CHANEL</em>
									<h3>spring-summer<br>2023-pre-collection</h3>
								</div>
							</figure>
						</a>
					</div>

					<div class="item">
						<a href="" class="grid_item_adventure">
							<figure>
								<div class="score"><strong>9.0</strong></div>
								<img src="${pageContext.request.contextPath}/upload/goodsImg/img12.jpg" class="img-fluid" alt="">
								<div class="info">
									<em>CHANEL</em>
									<h3>spring-summer<br>2023-pre-collection</h3>
								</div>
							</figure>
						</a>
					</div>

					<div class="item">
						<a href="" class="grid_item_adventure">
							<figure>
								<div class="score"><strong>9.0</strong></div>
								<img src="${pageContext.request.contextPath}/upload/goodsImg/img13.jpg" class="img-fluid" alt="">
								<div class="info">
									<em>CHANEL</em>
									<h3>spring-summer<br>2023-pre-collection</h3>
								</div>
							</figure>
						</a>
					</div>

					<div class="item">
						<a href="" class="grid_item_adventure">
							<figure>
								<div class="score"><strong>8.5</strong></div>
								<img src="${pageContext.request.contextPath}/upload/goodsImg/img14.jpg" class="img-fluid" alt="">
								<div class="info">
									<em>CHANEL</em>
									<h3>spring-summer<br>2023-pre-collection</h3>
								</div>
							</figure>
						</a>
					</div>
				</div>
				<!-- /reccomended_aventure -->
			</section>
			</div>
			<!-- /section -->
	</main>
	<!-- /main -->
	
	<footer>
		<div class="container margin_60_35">
			<div class="row">
				<div class="col-lg-5 col-md-12 pe-5">
					<p><img src="resources/html/img/logo.svg" width="150" height="36" alt=""></p>
					<p>Mea nibh meis philosophia eu. Duis legimus efficiantur ea sea. Id placerat tacimates definitionem sea, prima quidam vim no. Duo nobis persecuti cu. Nihil facilisi indoctum an vix, ut delectus expetendis vis.</p>
					<div class="follow_us">
						<ul>
							<li>Follow us</li>
							<li><a href="#0"><i class="ti-facebook"></i></a></li>
							<li><a href="#0"><i class="ti-twitter-alt"></i></a></li>
							<li><a href="#0"><i class="ti-google"></i></a></li>
							<li><a href="#0"><i class="ti-pinterest"></i></a></li>
							<li><a href="#0"><i class="ti-instagram"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 ms-lg-auto">
					<h5>Useful links</h5>
					<ul class="links">
						<li><a href="about.html">About</a></li>
						<li><a href="login.html">Login</a></li>
						<li><a href="register.html">Register</a></li>
						<li><a href="blog.html">News &amp; Events</a></li>
						<li><a href="contacts.html">Contacts</a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-6">
					<h5>Contact with Us</h5>
					<ul class="contacts">
						<li><a href="tel://61280932400"><i class="ti-mobile"></i> + 61 23 8093 3400</a></li>
						<li><a href="mailto:info@Panagea.com"><i class="ti-email"></i> info@Panagea.com</a></li>
					</ul>
					<div id="newsletter">
					<h6>Newsletter</h6>
					<div id="message-newsletter"></div>
					<form method="post" action="phpmailer/newsletter_template_email.php" name="newsletter_form" id="newsletter_form">
						<div class="form-group">
							<input type="email" name="email_newsletter" id="email_newsletter" class="form-control" placeholder="Your email">
							<input type="submit" value="Submit" id="submit-newsletter">
						</div>
					</form>
					</div>
				</div>
			</div>
			<!--/row-->
			<hr>
			<div class="row">
				<div class="col-lg-6">
					<ul id="footer-selector">
						<li>
							<div class="styled-select" id="lang-selector">
								<select>
									<option value="English" selected>English</option>
									<option value="French">French</option>
									<option value="Spanish">Spanish</option>
									<option value="Russian">Russian</option>
								</select>
							</div>
						</li>
						<li>
							<div class="styled-select" id="currency-selector">
								<select>
									<option value="US Dollars" selected>US Dollars</option>
									<option value="Euro">Euro</option>
								</select>
							</div>
						</li>
						<li><img src="img/cards_all.svg" alt=""></li>
					</ul>
				</div>
				<div class="col-lg-6">
					<ul id="additional_links">
						<li><a href="#0">Terms and conditions</a></li>
						<li><a href="#0">Privacy</a></li>
						<li><span>© Panagea</span></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<!--/footer-->
	</div>
	<!-- page -->
	
	<!-- Sign In Popup -->
	<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
		<div class="small-dialog-header">
			<h3>Sign In</h3>
		</div>
		<form>
			<div class="sign-in-wrapper">
				<a href="#0" class="social_bt facebook">Login with Facebook</a>
				<a href="#0" class="social_bt google">Login with Google</a>
				<div class="divider"><span>Or</span></div>
				<div class="form-group">
					<label>Email</label>
					<input type="email" class="form-control" name="email" id="email">
					<i class="icon_mail_alt"></i>
				</div>
				<div class="form-group">
					<label>Password</label>
					<input type="password" class="form-control" name="password" id="password" value="">
					<i class="icon_lock_alt"></i>
				</div>
				<div class="clearfix add_bottom_15">
					<div class="checkboxes float-start">
						<label class="container_check">Remember me
						  <input type="checkbox">
						  <span class="checkmark"></span>
						</label>
					</div>
					<div class="float-end mt-1"><a id="forgot" href="javascript:void(0);">Forgot Password?</a></div>
				</div>
				<div class="text-center"><input type="submit" value="Log In" class="btn_1 full-width"></div>
				<div class="text-center">
					Don’t have an account? <a href="register.html">Sign up</a>
				</div>
				<div id="forgot_pw">
					<div class="form-group">
						<label>Please confirm login email below</label>
						<input type="email" class="form-control" name="email_forgot" id="email_forgot">
						<i class="icon_mail_alt"></i>
					</div>
					<p>You will receive an email containing a link allowing you to reset your password to a new preferred one.</p>
					<div class="text-center"><input type="submit" value="Reset Password" class="btn_1"></div>
				</div>
			</div>
		</form>
		<!--form -->
	</div>
	<!-- /Sign In Popup -->
	
	<div id="toTop"></div><!-- Back to top button -->
	
	<!-- COMMON SCRIPTS -->
    <script src="resources/html/js/common_scripts.js"></script>
    <script src="resources/html/js/main.js"></script>
	<script src="resources/html/phpmailer/validate.js"></script>
	
	<!-- SPECIFIC SCRIPTS -->
    <script src="resources/html/layerslider/js/greensock.js"></script>
    <script src="resources/html/layerslider/js/layerslider.transitions.js"></script>
    <script src="resources/html/layerslider/js/layerslider.kreaturamedia.jquery.js"></script>
    <script>
        'use strict';
        $('#layerslider').layerSlider({
            autoStart: true,
            navButtons: false,
            navStartStop: false,
            showCircleTimer: false,
            responsive: true,
            responsiveUnder: 1280,
            layersContainer: 1200,
            skinsPath: 'layerslider/skins/'
                // Please make sure that you didn't forget to add a comma to the line endings
                // except the last line!
        });
    </script>
</body>
</html>