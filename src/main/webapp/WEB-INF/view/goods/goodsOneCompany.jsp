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
	
	<!-- SPECIFIC CSS -->
    <link href="${pageContext.request.contextPath}/resources/html/css/blog.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="${pageContext.request.contextPath}/resources/html/css/custom.css" rel="stylesheet">
	
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	$(function() {
		// 문자열로 받아온 옵션값과 옵션재고값 쉼표 기준으로 자르기
		let optionStr=$('#optionStr').val();
		let optionList=(optionStr||'').split(',');
		let optionNoStr=$('#optionNoStr').val();
		let optionNoList=(optionNoStr||'').split(',');
		let quantityStr=$('#quantityStr').val();
		let quantityList=(quantityStr||'').split(',');
		//console.log('quantityList: '+quantityList[0]);
		
		// select 태그에 option 넣기
		for(let count=0; count < optionList.length; ++count) {
			let option = $('<option value="'+count+'">'+optionList[count]+' [재고'+quantityList[count]+']'+'</option>');
			$('#selectOption').append(option);
		}
		
		let stock=0;
		let goodsNo='';
		let quantity=$('#selectQuantity').val();
		let selectOptionNo=0;
		
		// 옵션이 없을 때
		if(optionStr == '') { 
			$('#goodsOptionNo').val(optionNoStr);
			quantity='1'; // 수량
			goodsNo=optionNoStr; // 상품번호
			stock=Number(quantityStr); // 재고
			console.log('quantity: '+quantity);
			console.log('optionNoStr: '+optionNoStr);
		}
		
		// 선택옵션이 있을 때
		$('#selectOption').change(function() {
			if($('#selectOption').val() == '') { // 옵션선택을 안했을 때
				goodsNo=0;
				return true;
			}
			selectOptionNo=Number($('#selectOption').val()); // 선택된 옵션값으로 상품번호를 찾는다
			console.log('selectOptionNo:'+selectOptionNo);
			goodsNo=optionNoList[selectOptionNo]; // 상품번호
			stock=Number(quantityList[selectOptionNo]); // 상품의 재고
			console.log('goodsNo:'+goodsNo);
			console.log('stock:'+stock);
			
		});
		
		$('#selectQuantity').change(function() {
			let selectQuantity=$(this).val();
			quantity=selectQuantity;
			console.log(quantity);
		});

		//console.log('quantity :'+quantity);
		//console.log('goodsNo :'+goodsNo);
		
		$('.submitBtn').click(function() {
			// 폼으로 넘길 변수에 값 넣기
			$('input[name=cartQuantity]').val(Number(quantity)); // 수량
			$('input[name=goodsOptionNo]').val(Number(goodsNo)); // 상품번호
			let ckQuantity=$('input[name=cartQuantity]').val();
			let ckOption=$('input[name=goodsOptionNo]').val();
			console.log('수량:'+ckQuantity+'/상품번호:'+ckOption);
			
			// 옵션&수량체크
			if(ckOption == 0) {
				alert('옵션을 선택하세요');
				return true;
			} else if(ckOption > 0 && ckQuantity > stock) {
				alert('재고가 부족합니다. '+stock+'개 이하로 담아주세요.');
				quantity=stock;
				$('input[name=cartQuantity]').val(stock);
				$('#selectQuantity').val(stock);
				return true;
			} else if(ckOption > 0 && ckQuantity == 0) {
				alert('수량은 1개 이상 선택해주세요.');
				quantity=1;
				$('input[name=cartQuantity]').val(1);
				$('#selectQuantity').val(1);
				return true;
			} 
			
			$('.submitBtn').each(function() {
			    if($(this).hasClass('cart')) {
			    	console.log('장바구니담기submit');
			    	$('#cartForm').submit();
			    } else if($(this).hasClass('order')) {
			    	console.log('주문하기submit');
			    	$('#orderForm').submit();
			    }
			});
		})
		
	});

</script>


<body>
	
	<div id="page" class="theia-exception">
		
	<!-- header include -->
	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	
	<section class="hero_in general">
		<div class="wrapper">
			<div class="container">
				<h1 class="fadeInUp"><span></span>${goodsOne.companyName}</h1>
			</div>
		</div>
	</section>
	<!--/hero_in-->
		
		<div class="container margin_60_35">
			<div class="row">

				<!-- category include -->
				<c:import url="/WEB-INF/view/inc/sideCategory.jsp"></c:import>
				
				<div class="col-lg-9">
					<article class="blog wow fadeIn">
						<div class="row g-0">
							<div class="col-lg-7">
								<figure>
									<img src="${pageContext.request.contextPath}/upload/goodsImg/${goodsOne.goodsImgOriginName}">
								</figure>
							</div>
							<div class="col-lg-5">
								<div class="post_info">
									<input type="hidden" id="optionStr" value="${goodsOne.goodsOptionContent}">
									<input type="hidden" id="optionNoStr" value="${goodsOne.goodsOptionNo}">
									<input type="hidden" id="quantityStr" value="${goodsOne.goodsOptionQuantity}">
									<div>
										<small>${goodsOne.companyName}</small>
									</div>
									<br>
									<h2>${goodsOne.goodsName}</h2>
									<div>
										<h3>${goodsOne.goodsPrice}원</h3>
									</div>
									<br>
									<div class="row">
										<c:choose>
											<c:when test="${goodsOne.quantitySum > 0}">
											
											<c:if test="${goodsOne.goodsOptionContent ne ''}">
												<div>
													<select id="selectOption">
														<option value="">선택</option>	
													</select>
												</div>
											</c:if>
											<div class="mt-1">
												<input type="number" id="selectQuantity" value="1">
											</div>
											<div class="mt-3">
												<button type="button" class="btn_custom1 rounded submitBtn cart">장바구니 담기</button>
												<button type="button" class="btn_custom1 submitBtn order">주문하기</button>
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
										<form action="${pageContext.request.contextPath}/insertCart" method="get" id="cartForm">
											<input type="hidden" name="goodsOptionNo">
											<input type="hidden" name="cartQuantity">
										</form>
										<form action="${pageContext.request.contextPath}/login/order/order" method="get" id="orderForm">
											<input type="hidden" name="goodsOptionNo">
											<input type="hidden" name="cartQuantity">
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