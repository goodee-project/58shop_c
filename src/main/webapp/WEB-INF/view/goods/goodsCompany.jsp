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
    <link rel="apple-touch-icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/html/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="${pageContext.request.contextPath}/resources/html/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="${pageContext.request.contextPath}/resources/html/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="${pageContext.request.contextPath}/resources/html/img/apple-touch-icon-144x144-precomposed.png">

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	$(function() {
		// controller에서 넘어온 옵션값 선택하기
		if($('input[name=keyword]').val() != 'new') {
			let defaultWord=$('input[name=keyword]').val();
			$('#selectOption').val(defaultWord);
		}
		
		// 정렬옵션값 변수에 넣어서 폼으로 넘기기
		$('#selectOption').change(function() {
			let option=$(this).val();
			$('input[name=keyword]').val(option);
			$('#goodsCompanyForm').submit();
		});
		
		// 검색값 변수에 넣어서 폼으로 넘기기(버튼클릭이벤트)
		$('#searchBtn').click(function() {
			let clickSearch=$('#searchword').val();
			$('input[name=searchword]').val(clickSearch);
			$('#goodsCompanyForm').submit();
		});
		
		// 검색값 변수에 넣어서 폼으로 넘기기(엔터키이벤트)
		$('#searchword').keydown(function(key) {
			if(key.keyCode && key.keyCode == 13) {
				let enterSearch=$('#searchword').val();
				$('input[name=searchword]').val(enterSearch);
				$('#goodsCompanyForm').submit();
			}
		});	
	});
</script>

<body>
	
	<div id="page" class="theia-exception">
		
	<!-- header include -->
	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	
	<main>
	<c:forEach var="n" items="${selectGoodsCompany}" begin="0" end="0">
		<section class="hero_in general">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>${n.companyName}</h1>
				</div>
			</div>
		</section>
	</c:forEach>
		<!--/hero_in-->

		<div>
			<form action="${pageContext.request.contextPath}/goods/goodsCompany" method="get" id="goodsCompanyForm">
				<input type="hidden" name="searchword" value="${searchword}">
				<input type="hidden" name="keyword" value="${keyword}">
				<input type="hidden" name="companyId" value="${companyId}">
			</form>
		</div>

		<div class="container margin_60_35">
			<div class="row">
				<aside class="col-lg-3" id="sidebar">
						<div class="box_style_cat" id="faq_box">
							<ul id="cat_nav">
								<li><a href="#payment" class="active"><i class="icon_document_alt"></i>Payments</a></li>
								<li><a href="#tips"><i class="icon_document_alt"></i>Suggestions</a></li>
								<li><a href="#reccomendations"><i class="icon_document_alt"></i>Reccomendations</a></li>
								<li><a href="#terms"><i class="icon_document_alt"></i>Terms&amp;conditons</a></li>
								<li><a href="#booking"><i class="icon_document_alt"></i>Booking</a></li>
							</ul>
						</div>
						<!--/sticky -->
				</aside>
				<!--/aside -->
				
		
					<div class="col-lg-9">
						<div class="row g-0 custom-search-input-2 inner">
							<div class="col-lg-7">
								<div class="form-group">
									<input class="form-control" type="text" id="searchword" value="${searchword}" placeholder="What are you looking for...">
									<i class="icon_search"></i>
								</div>
							</div>

							<div class="col-lg-3">
								<select id="selectOption" class="wide">
									<option value="new">신상품순</option>
									<option value="high">높은가격순</option>
									<option value="low">낮은가격순</option>
								</select>
							</div>
							<div class="col-lg-2">
								<button type="button" id="searchBtn" class="btn_custom2">검색</button>
							</div>
						</div>
						<!-- /row -->

					<div class="col-lg-12">
					<div class="isotope-wrapper">
					<div class="row">
					
						<c:forEach var="c" items="${selectGoodsCompany}">
						<div class="col-md-4 isotope-item popular">
							<div class="box_grid">
								<figure>
									<a href="#0" class="wish_bt"></a>
									<a href="${pageContext.request.contextPath}/goods/goodsOneCompany?companyId=${companyId}&goodsNo=${c.goodsNo}"><img src="${pageContext.request.contextPath}/upload/goodsImg/${c.goodsImgOriginName}" class="img-fluid" alt="" width="800" height="533"><div class="read_more"><span>상품보기</span></div></a>

								</figure>
								<div class="wrapper">
									<h3><a href="${pageContext.request.contextPath}/goods/goodsOneCompany?companyId=${companyId}&goodsNo=${c.goodsNo}">${c.goodsName}</a></h3>
									<c:choose>
										<c:when test="${c.quantitySum == '0'}">
											품절
										</c:when>
										<c:otherwise>
											${c.goodsPrice}원
										</c:otherwise>
									</c:choose>
									<p><a href="${pageContext.request.contextPath}/goods/goodsCompany?companyId=${i.companyId}">${i.companyName}</a></p>
								</div>
								<ul>
									<li></li>
									<li><div class="score"><span>Superb<em>350 Reviews</em></span><strong>8.9</strong></div></li>
								</ul>
							</div>
						</div>
						</c:forEach>
						<!-- /box_grid -->
					</div>
					<!-- /row -->
					</div>
					<!-- /isotope-wrapper -->
			
				
				</div>
				<!-- /col -->
			</div>		
		</div>
		<!-- /container -->
				
				
		</div>
		<!-- /col -->
	</main>
	<!--/main-->
		
			
	</div>
	<!-- /row -->
	
	<footer>
		<div class="container margin_60_35">
			<div class="row">
				<div class="col-lg-5 col-md-12 pe-5">
					<p><img src="img/logo.svg" width="150" height="36" alt=""></p>
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
					<form method="post" action="${pageContext.request.contextPath}/resources/html/phpmailer/newsletter_template_email.php" name="newsletter_form" id="newsletter_form">
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