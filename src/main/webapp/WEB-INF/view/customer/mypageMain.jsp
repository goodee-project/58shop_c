<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">
    <title>Panagea | Premium site template for travel agencies, hotels and restaurant listing.</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/html/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="${pageContext.request.contextPath}/resources/html/image/x-icon" href="${pageContext.request.contextPath}/resources/html/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="${pageContext.request.contextPath}/resources/html/image/x-icon" sizes="72x72" href="${pageContext.request.contextPath}/resources/html/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="${pageContext.request.contextPath}/resources/html/image/x-icon" sizes="114x114" href="${pageContext.request.contextPath}/resources/html/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="${pageContext.request.contextPath}/resources/html/image/x-icon" sizes="144x144" href="${pageContext.request.contextPath}/resources/html/img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="${pageContext.request.contextPath}/resources/html/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/html/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/html/css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="${pageContext.request.contextPath}/resources/html/css/custom.css" rel="stylesheet">

</head>

<body>
	
	<div id="page">
		
	<!-- header include -->
	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	<!-- /header -->
	
	<main>
		<section class="hero_in general">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>마이페이지</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->
		<div class="container margin_60_35">
			
			<div class="main_title_2">
				<span><em></em></span>
				<h2>000님의 이번달 등급은 00입니다</h2>
				<p></p>
			</div>
			
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<a class="box_topic" href="#0">
						<span><i class="pe-7s-wallet"></i></span>
						<h3>회원정보</h3>
					</a>
				</div>
				<div class="col-lg-6 col-md-6">
					<a class="box_topic" href="#0">
						<i class="pe-7s-users"></i>
						<h3>배송지 조회</h3>
					</a>
				</div>
				<div class="col-lg-6 col-md-6">
					<a class="box_topic" href="#0">
						<i class="pe-7s-wallet"></i>
						<h3>포인트/페이</h3>
					</a>
				</div>
				<div class="col-lg-6 col-md-6">
					<a class="box_topic" href="#0">
						<i class="pe-7s-help2"></i>
						<h3>채팅</h3>
					</a>
				</div>
				
			</div>
			<!--/row-->
		</div>
		<!-- /container -->
		<div class="bg_color_1">
			<div class="container margin_60_35">
				<div class="main_title_3">
					<span><em></em></span>
					<h2>주문내역</h2>
				</div>
				<div class="list_articles add_bottom_30 clearfix">
					<ul>
						<li><a href="#0"><i class="icon_documents_alt"></i>Et dicit vidisse epicurei pri</a></li>
						<li><a href="#0"><i class="icon_documents_alt"></i>Ad sit virtute rationibus efficiantur</a></li>
						<li><a href="#0"><i class="icon_documents_alt"></i>Partem vocibus omittam pri ne</a></li>
						<li><a href="#0"><i class="icon_documents_alt"></i>Case debet appareat duo cu</a></li>
						<li><a href="#0"><i class="icon_documents_alt"></i>Impedit torquatos quo in</a></li>
						<li><a href="#0"><i class="icon_documents_alt"></i>Nec omnis alienum no</a></li>
						<li><a href="#0"><i class="icon_documents_alt"></i>Quo eu soleat facilisi menandri</a></li>
						<li><a href="#0"><i class="icon_documents_alt"></i>Et dicit vidisse epicurei pri</a></li>
					</ul>
				</div>
				<!-- /list_articles -->
			</div>
			<!-- /container -->
		</div>
		<!-- /bg_color_1 -->
	</main>
	<!--/main-->
	
	<footer>
		<div class="container margin_60_35">
			<div class="row">
				<div class="col-lg-5 col-md-12 pe-5">
					<p><img src="${pageContext.request.contextPath}/resources/html/img/logo.svg" width="150" height="36" alt=""></p>
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
						<li><img src="${pageContext.request.contextPath}/resources/html/img/cards_all.svg" alt=""></li>
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
    <script src="${pageContext.request.contextPath}/resources/html/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/html/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/html/phpmailer/validate.js"></script>
	
</body>
</html>