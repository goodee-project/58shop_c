<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	
	<!-- SPECIFIC CSS -->
    <link href="${pageContext.request.contextPath}/resources/html/css/blog.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="${pageContext.request.contextPath}/resources/html/css/custom.css" rel="stylesheet">
	<style>
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
	  		-webkit-appearance: none;
		}
	</style>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>

	$(function() {
		
		// 선택옵션 존재할 때
		$('#selectOption').change(function() {
			$('#goodsOptionNo').val($('#selectOption').val());
			$('#goodsOptionNo2').val($('#selectOption').val());
			let optionNo=Number($('#selectOption').val());
			let checkStock=Number($('#option'+optionNo).val());
			//console.log(checkStock);
			$('#optionStock').data('stock', checkStock);
		});
		
		// 선택옵션 없을 때
		let optionNo=$('#oneOption').val();
		//console.log(optionNo);
		if(optionNo) {
			$('#goodsOptionNo').val(optionNo);
			$('#goodsOptionNo2').val(optionNo);
		}
		
		// 수량
		$('#cartQuantity').val($('#quantity').val());
		$('#cartQuantity2').val($('#quantity').val());
		$('#quantity').change(function() {
			$('#cartQuantity').val($('#quantity').val());
			$('#cartQuantity2').val($('#quantity').val());
		});
		
		$('#cartBtn').click(function() {
			let check=0; // check == 2 일 때 submit
			console.log($('#optionStock').data('stock'));
			
			// 재고 확인
			let stock=0;
			let optionStock=$('#optionStock').data('stock'); //옵션이 있을 때
			let oneStock=$('#oneStock').val(); //옵션이 없을 때
			let quantity=Number($('#quantity').val());
			//console.log('oneStock: '+oneStock);
			//console.log('optionStock: '+optionStock);
			if(typeof optionStock == "undefined") {
				stock=Number(oneStock);
			} else {
				stock=Number(optionStock);
			}
			
			if(quantity > stock) {
				alert('재고가 부족합니다. '+stock+'개 이하로 담아주세요.');
				$('#quantity').val(stock);
				$('#cartQuantity').val(stock);
				return true;
			} else if(quantity == null || quantity == 0) {
				alert('수량을 1개 이상 선택하세요');
				$('#quantity').val(1);
				$('#cartQuantity').val(1);
				return true;
			} else {
				++check;
			}
			
			// 옵션확인
			let optionCheck=$('#goodsOptionNo').val();
			if(!optionCheck || optionCheck == '선택') {
				alert('옵션을 선택하세요');
			} else {
				++check;
			}
			console.log('옵션번호: '+$('#goodsOptionNo').val());
			console.log('선택수량: '+$('#cartQuantity').val());
			
			// check == 2 일 때 submit
			if(check == 2) {
				console.log('장바구니담기완료');
				$('#cartForm').submit();
				return true;
			}
			
		});
		
		
		$('#orderBtn').click(function() {
			let check=0; // check == 2 일 때 submit
			console.log($('#optionStock').data('stock'));
			
			// 재고 확인
			let stock=0;
			let optionStock=$('#optionStock').data('stock'); //옵션이 있을 때
			let oneStock=$('#oneStock').val(); //옵션이 없을 때
			let quantity=Number($('#quantity').val());
			//console.log('oneStock: '+oneStock);
			//console.log('optionStock: '+optionStock);
			if(typeof optionStock == "undefined") {
				stock=Number(oneStock);
			} else {
				stock=Number(optionStock);
			}
			
			if(quantity > stock) {
				alert('재고가 부족합니다. '+stock+'개 이하로 담아주세요.');
				$('#quantity').val(stock);
				$('#cartQuantity2').val(stock);
				return true;
			} else if(quantity == null || quantity == 0) {
				alert('수량을 1개 이상 선택하세요');
				$('#quantity').val(1);
				$('#cartQuantity2').val(1);
				return true;
			} else {
				++check;
			}
			
			// 옵션확인
			let optionCheck2=$('#goodsOptionNo2').val();
			if(!optionCheck2 || optionCheck2 == '선택') {
				alert('옵션을 선택하세요');
			} else {
				++check;
			}
			console.log('옵션번호: '+$('#goodsOptionNo').val());
			console.log('선택수량: '+$('#cartQuantity').val());
			
			// check == 2 일 때 submit
			if(check == 2) {
				console.log('주문완료');
				$('#orderForm').submit();
				return true;
			}
			
		});		

	});
</script>


<body>
	
	<div id="page" class="theia-exception">
		
	<!-- header include -->
	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	
	<c:forEach var="g" items="${goodsOne}">
	<section class="hero_in general">
		<div class="wrapper">
			<div class="container">
				<h1 class="fadeInUp"><span></span>${g.typeContent}</h1>
			</div>
		</div>
	</section>
	<!--/hero_in-->
		
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
					<article class="blog wow fadeIn">
						<div class="row g-0">
							<div class="col-lg-7">
								<figure>
									<img src="${pageContext.request.contextPath}/upload/goodsImg/${g.goodsImgOriginName}">
								</figure>
							</div>
							<div class="col-lg-5">
								<div class="post_info">
									<div>
										<a href="${pageContext.request.contextPath}/goods/goodsCompany?companyId=${g.companyId}">
											<small>${g.companyName}</small>
										</a>
									</div>
									<br>
									<h2>${g.goodsName}</h2>
									<div>
										<h3>${g.goodsPrice}원</h3>
									</div>
									<br>
									<div class="row">
										<div>
										<c:choose>
											<c:when test="${g.quantitySum > 0}">
											
												<c:choose>	
													<c:when test="${fn:length(goodsOption) > 1}"><!-- 옵션이 2개 이상일 때 -->
														<select id="selectOption">
															<option>선택</option>
															<c:forEach var="i" items="${goodsOption}">
																<option value="${i.goodsOptionNo}">${i.goodsOptionContent} [재고:${i.goodsOptionQuantity}]</option>
															</c:forEach>
														</select>
														<span id="optionStock"></span>
														<c:forEach var="j" items="${goodsOption}"> <!-- 옵션 수량 확인하기 -->
															<input id="option${j.goodsOptionNo}" type="hidden" value="${j.goodsOptionQuantity}">
														</c:forEach>
													</c:when>
													<c:when test="${fn:length(goodsOption) == 1}"><!-- 옵션이 하나뿐일 때 -->
														<c:forEach var="s" items="${goodsOption}">
															<input type="hidden" id="oneOption" value="${s.goodsOptionNo}">
															<input type="hidden" id="oneStock" value="${s.goodsOptionQuantity}">
														</c:forEach>
													</c:when>
												</c:choose>
												<div class="mt-1">
													<input type="number" id="quantity" value=1>
												</div>
												<div class="mt-3">
													<button type="button" id="cartBtn" class="btn_custom1">장바구니 담기</button>
													<button type="button" id="orderBtn" class="btn_custom1">주문하기</button>
												</div>
											</c:when>
											<c:otherwise>
												<div class="mt-1">
													<input type="number" value="0" readonly="readonly">
												</div>
												<div class="mt-3">
													<button type="button" class="btn_custom1">품절</button>
												</div>
											</c:otherwise>
										
										</c:choose>
										</div>
										<form action="${pageContext.request.contextPath}/insertCart" method="get" id="cartForm">
											<input type="hidden" id="cartQuantity" name="cartQuantity">
											<input type="hidden" id="goodsOptionNo" name="goodsOptionNo">
										</form>
										<form action="${pageContext.request.contextPath}/login/order/order" method="get" id="orderForm">
											<input type="hidden" id="cartQuantity2" name="cartQuantity">
											<input type="hidden" id="goodsOptionNo2" name="goodsOptionNo">
										</form>
	
									</div>
								</div>
							</div>
						</div>
					</article>
					</div>
						
					<!-- /row -->
					</div>
					<!-- /isotope-wrapper -->
				</div>
				<!-- /col -->
				</c:forEach>
			</div>		

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