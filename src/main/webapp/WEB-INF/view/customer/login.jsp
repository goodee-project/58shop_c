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
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/html_rtl/img/favicon.ico" type="${pageContext.request.contextPath}/resources/html/image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- BASE CSS -->
    <link href="${pageContext.request.contextPath}/resources/html/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/html/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/html/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/html/css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="${pageContext.request.contextPath}/resources/html/css/custom.css" rel="stylesheet">
    
    <!-- google recaptcha -->
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    
    <style>
		.loginMsg {
			color:#FF3300;
		}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			
			$('#id').focus();
	
			$('#loginBtn').on('click',function() {
				
				let loginMsgCheck=0;

				// 아이디 유효성 검사
				if($('#loginId').val() == '') {
					$('#idMsg').text('아이디를 입력해주세요');
				} else {
					$('#idMsg').text('');
				}
				
				// 비밀번호 유효성 검사
				if($('#loginPw').val() == '') {
					$('#pwMsg').text('비밀번호를 입력해주세요');
				} else {
					$('#pwMsg').text('');
				}
				
				$('.loginMsg').each(function() {
					if($(this).text() == '') { // 아이디와 비밀번호를 모두 입력하면 loginMsgCheck == 2
						++loginMsgCheck;
						console.log($(this).text());
					} 
				});
				console.log('+loginMsgCheck: '+loginMsgCheck);
				if(loginMsgCheck == $('.loginMsg').length) { // loginMsgCheck의 값과 loginMsg class개체 개수와 같으면 submit
					//$('#loginForm').submit();
					// 로그인 시도 3번 실패시 리캡차 테스트 출력하기
					let failCount=$('#failCount').val();
					let failLoginId=$('#failLoginId').val();
					let loginId=$('#loginId').val();
					if(failCount > 2 && loginId == failLoginId) {
						
						// 로그인 버튼을 눌렀을 때 gRecaptcha 형성 
						let recaptchaCallBack=function() {
							gRecaptcha.render('gRecaptcha', {'callback':verifyCallback
															, 'expired=callback':expiredCallback,});
						}
						
						// 인증 성공 시
						let verifyCallback=function(response) {
							$("#loginBtn").removeClass("disabled-btn");
						    $("#loginBtn").attr("disabled", false);
							$('#loginForm').submit();
						}
						
						// 인증 만료 시
						let expiredCallback=function(response) {
							alert('인증 실패');
							$("#loginBtn").addClass("disabled-btn");
						    $("#loginBtn").attr("disabled", true);
						}
						
						// gRecaptcha reset
						let resetCallback=function() {
							gRecaptcha.reset();
						}
						
						if($("#loginBtn").hasClass('disabled-btn')){
						       alert("recaptcha 인증 후 로그인이 가능합니다.");
						   } else {
						       var recaptcha=$("#gRecaptcha-response").val();
						   }
						
						 $.ajax({
					           type: "get",
					           contentType: "application/json",
					           url: "login/validation",
					           data: {
					               recaptcha : recaptcha
					           },
					           dataType: "JSON",
					           success: function(data){

					               if(data.status == true){
					                   
					               } else {
					                   alert("로그인 실패");
					               }
					           },
					           error: function(err){
					               alert("에러" + err.toString());
					           }
					       });
						
						
					} else {
						$('#loginForm').submit();
					}
				}
			});
		});
	</script>

</head>

<body id="login_bg" class="rtl">
	
	<nav id="menu" class="fake_menu"></nav>
	
	<div id="preloader">
		<div data-loader="circle-side"></div>
	</div>
	<!-- End Preload -->
	
	<div id="login">
		<aside>
			<figure>
				<a href="index.html"><img src="${pageContext.request.contextPath}/resources/html/img/logo_sticky.png" width="155" height="36" data-retina="true" alt="" class="logo_sticky"></a>
			</figure>
			  <form action="${pageContext.request.contextPath}/login" method="post" id="loginForm">
				
				<div class="form-group">
					<label>ID</label>
					<input type="text" class="form-control" id="loginId" name="customerId">
					<i class="icon_mail_alt"></i>
					
					<span id="idMsg" class="loginMsg"></span>
				
				</div>
				
				
				<div class="form-group">
					<label>Password</label>
					<input type="password" class="form-control" id="loginPw" name="customerPw" value="">
					<i class="icon_lock_alt"></i>
					
					<span id="pwMsg" class="loginMsg"></span>
					
				</div>
				<div class="clearfix add_bottom_30">
					<div class="float-end mt-1"><a id="forgot" href="javascript:void(0);">Forgot Password?</a></div>
				</div>
				<div>
					<input type="hidden" id="loginFail" value="${loginFail}">
					<span id="failMsg" class="loginMsg"></span>
				</div>	
				
				<!-- 로그인 시도 3번 실패 시 캡차 테스트를 거쳐야 로그인 가능하다 -->
				<input type="hidden" id="failCount" value="${loginFail.failCount}">
				<input type="hidden" id="failLoginId" value="${loginFail.loginId}">
				<div id="gRecaptcha" data-sitekey="${loginSiteKey}"></div>
			
				<button type="button" class="btn_1 rounded full-width disabled-btn" id="loginBtn">login</button>
				<div class="text-center add_top_10">아직 회원이 아니신가요? <strong><a href="${pageContext.request.contextPath}/signup">회원가입</a></strong></div>
			</form>
			<div class="copy">© 2018 Panagea</div>
		</aside>
	</div>
	<!-- /login -->
		
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/html/js/jquery-3.6.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/html/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/html/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/html/phpmailer/validate.js"></script>	
  
</body>
</html>