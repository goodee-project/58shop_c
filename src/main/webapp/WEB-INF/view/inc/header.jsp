<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="header menu_fixed">
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
				<li><span><a href="${pageContext.request.contextPath}/main">홈</a></span></li>
				<li><span><a href="">신상품</a></span></li>
				<li><span><a href="">베스트</a></span></li>
				<li>
					<a href="${pageContext.request.contextPath}/goods/category?typeNo=1">Beauty</a>
					<ul>
						<li>
							<a href="${pageContext.request.contextPath}/goods/category?typeNo=2">Perfume</a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=3">Woman</a></li>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=4">Man</a></li>
							</ul>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/goods/category?typeNo=5">Hair/Body</a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=6">HairShampoo/Conditioner</a></li>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=7">BodyWash/Lotion</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/goods/category?typeNo=8">Fashion</a>
					<ul>
						<li>
							<a href="${pageContext.request.contextPath}/goods/category?typeNo=9">Woman</a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=10">Outer</a></li>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=11">Top</a></li>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=12">Bottom</a></li>
							</ul>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/goods/category?typeNo=13">Man</a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=14">Outer</a></li>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=15">Top</a></li>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=16">Bottom</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/goods/category?typeNo=17">Market</a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=18">Fresh</a></li>
						<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=19">Meal Kit</a></li>
					</ul>
				</li>
				<li><span><a href="">이벤트</a></span></li>
				<li><span><a href="">고객센터</a></span></li>
				
				<c:choose>
					<c:when test="${loginCustomer != null}">
						<li><span><a href="${pageContext.request.contextPath}/login/mypageMain">마이페이지</a></span></li>
					</c:when>
					<c:otherwise>
						<li><span><a href="${pageContext.request.contextPath}/customer/signup">회원가입</a></span></li>
					</c:otherwise>
				</c:choose>
				<li>
					<c:choose>
						<c:when test="${loginCustomer != null}">
							<span><a href="${pageContext.request.contextPath }/logout">로그아웃</a></span>
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