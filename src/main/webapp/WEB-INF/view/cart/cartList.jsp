<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">
    <title>cart</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="resources/html/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="resources/html/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="resources/html/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="resources/html/img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="resources/html/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/html/css/style.css" rel="stylesheet">
	<link href="resources/html/css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="resources/html/css/custom.css" rel="stylesheet">

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<c:forEach var="c" items="${list}">
			<script>
				$(document).ready(function(){
					// 상품 수량 수정 js
					$('#cartQuantityBtn${c.cartNo}').click(function(){
						let cartQuantity = $('#cartQuantity${c.cartNo}');
						console.log('(1)'+cartQuantity.val());
						
						let cartQtt = $('#cartQtt${c.cartNo}');
						cartQtt = cartQuantity
						console.log('(2)'+cartQtt.val())
						$('input[name=cartQuantity]').attr('value',cartQtt.val());
						$('#updateQttForm${c.cartNo}').submit();
					});
				});
			</script>
		</c:forEach>





</head>

<body>
	
	<div id="page" class="theia-exception">
		
	<header class="header menu_fixed">
		
		<div id="logo">
			<a href="index.html">
				<img src="img/logo.svg" width="150" height="36" alt="" class="logo_normal">
				<img src="img/logo_sticky.svg" width="150" height="36" alt="" class="logo_sticky">
			</a>
		</div>
		<ul id="top_menu">
			<li><a href="${pageContext.request.contextPath}/cart/cartList" class="cart-menu-btn" title="Cart"></a></li>
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
				<li>
					<c:choose>
						<c:when test="${loginCustomer != null}">
							<span><a href="${pageContext.request.contextPath }/customer/logout">로그아웃</a></span>
						</c:when>
						<c:otherwise>
							<span><a href="${pageContext.request.contextPath }/customer/login">로그인</a></span>
						</c:otherwise>
					</c:choose>
				</li>
			</ul>		
		</nav>


	</header>
	<!-- /header -->
	
	<main>
		<div class="hero_in cart_section">
			<div class="wrapper">
				<div class="container">
					<div class="bs-wizard clearfix">
						<div class="bs-wizard-step active">
							<div class="text-center bs-wizard-stepnum">Your cart</div>
							<div class="progress">
								<div class="progress-bar"></div>
							</div>
							<a href="#0" class="bs-wizard-dot"></a>
						</div>

						<div class="bs-wizard-step disabled">
							<div class="text-center bs-wizard-stepnum">Payment</div>
							<div class="progress">
								<div class="progress-bar"></div>
							</div>
							<a href="#0" class="bs-wizard-dot"></a>
						</div>

						<div class="bs-wizard-step disabled">
							<div class="text-center bs-wizard-stepnum">Finish!</div>
							<div class="progress">
								<div class="progress-bar"></div>
							</div>
							<a href="#0" class="bs-wizard-dot"></a>
						</div>
					</div>
					<!-- End bs-wizard -->
				</div>
			</div>
		</div>
		<!--/hero_in-->

		<div class="bg_color_1">
			<div class="container margin_60_35">
				<div class="row">
					<div class="col-lg-8">
						<div class="box_cart">
						
					<!-- 회원 장바구니 리스트 -->	
					
					<form action="${pageContext.request.contextPath}/orders/ordersAdd" method="get">
						<table class="table table-hover w-100 rounded" style="table-layout: auto; width: 100%; table-layout: fixed;">

							<tr>
								<th>상품이미지</th>
								<th>상품이름</th>
								<th>수량</th>
								<th>상품금액</th>
								<th>삭제</th>
							</tr>
							<c:forEach var="c" items="${list}">
								<tr>
									<td>${c.companyName}</td>
								</tr>
								
								<tr>
									<td><!-- 상품이미지 -->
										<div>
										<div>
											<img src="${pageContext.request.contextPath}/upload/goodsImg/${c.goodsImgSaveName}" width="200" height="200">
											<div>
												<p>${c.goodsPrice}</p>
											</div>
										</div>
										</div>
									</td>
									<th><!-- 상품이름 -->
										<input type="hidden" name="goodsNo" value="${c.goodsNo}"> 
										${c.goodsName}
										<input type="hidden" name="goodsName" value="${c.goodsName}" readonly="readonly"> 
									</th>
									<!-- 수량수정 -->
									<td>
										<select name="cartQuantity" id="cartQuantity${c.cartNo}">
											<c:forEach var="x" begin="1" end="10" step="1">
												<c:choose> 
													<c:when test="${x == c.cartQuantity}">
														<option value="${x}" selected="selected">${x}</option>
													</c:when> 
													<c:otherwise>
														<option value="${x}">${x}</option>
													</c:otherwise> 
												</c:choose> 
											</c:forEach>
										</select>
										<button id="cartQuantityBtn${c.cartNo}"  type="button">수정</button>
									</td>
									<td><!-- 상품가격 -->
										${c.goodsPrice*c.cartQuantity}
										<input type="hidden" name="goodsPrice" value="${c.goodsPrice}" readonly="readonly">
									</td>
									<td>
										<a  href="${pageContext.request.contextPath}/deleteCart?cartNo=${c.cartNo}">X</a>
									</td>
								</tr>
							</c:forEach>						
						</table>
						<br>
						
					</form>
					
					
					<!-- 수량변경 히든폼 -->
					<c:forEach var="c" items="${list}">
						<form action="${pageContext.request.contextPath}/updateCart" method="post" id="updateQttForm${c.cartNo}">
							<input type="hidden" name="cartNo" value="${c.cartNo}">
							<input type="hidden" name="cartQuantity" value="" id="cartQtt${c.cartNo}">
						</form>
					</c:forEach>

						
						<!-- /cart-options -->
					</div>
					</div>
					<!-- /col -->
	
					
					<aside class="col-lg-4" id="sidebar">
						<div class="box_detail">
							<div id="total_cart">
							<!-- 총주문금액 (상품개수 하나 이상일때만 조회가능)-->
							<c:if test="${list.size() != 0}">
									<tr>
										<th colspan="3"><span style="font-size:20px">Order Price</span></th>
										<th>
											<c:set var = "cartPrice" value = "0" />
												<c:forEach var="c" items="${list}">
													<c:set var= "cartPrice" value="${cartPrice + (c.goodsPrice*c.cartQuantity)}"/>
												</c:forEach>
											<span style="font-size:23px; color:blue;">${cartPrice}￦</span>
											<input type="hidden" name="cartPrice" value="${cartPrice}" readonly="readonly">
										</th>

									</tr>
							</c:if>								

							</div>
							
							<button class="btn_1 full-width purchase" type="submit">Order</button>
							<div class="text-center"><small>No money charged in this step</small></div>
						</div>
					</aside>
				</div>
				<!-- /row -->
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
  
</body>
</html>