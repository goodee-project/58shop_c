<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">
    <title>마이페이지 | 채팅</title>

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
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="/58shop_c/webjars/sockjs-client/1.5.1/sockjs.min.js"></script>
	<script src="/58shop_c/webjars/webstomp-client/1.2.6/dist/webstomp.min.js"></script>

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
					<h1 class="fadeInUp"><span></span>채팅</h1>
				</div>
			</div>
		</section>
		
		<!--start content-->
		<div class="wrapper p-5">
			<div class="page-content p-4" style="background:#FFFFFF;">
				<div class="chat-wrapper">					
					
					<div class="chat-header d-flex align-items-center">
						<div class="chat-toggle-btn"><i class='bx bx-menu-alt-left'></i>
						</div>
						<div>
							<h4 class="mb-1 font-weight-bold">${chattingRoomName}</h4>
						</div>
						<div class="chat-top-header-menu ms-auto">
							<a href="javascript:;"><i class='bx bx-user-plus'></i></a>
						</div>
					</div>
					<!-- chat -->
					<input type="hidden" value="${chattingRoomName}" id="chattingRoomName">
					<input type="hidden" value="${sessionScope.login}" id="login">
					<div class="chat-content">
						<div id="msgArea" style="min-height:520px;">
	            			<c:forEach var="cl" items="${chatList}">
								<c:if test="${sessionScope.login != cl.fromId}">
									<div class="chat-content-leftside">
										<div class="d-flex">
											<img src="/58platform/assets/images/avatars/avatar-3.png" width="48" height="48" class="rounded-circle" alt="" />
											<div class="flex-grow-1 ms-2">
												<p class="mb-0 chat-time">관리자, ${cl.createdate}</p>
												<p class="chat-left-msg">${cl.chattingMemo}</p>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${sessionScope.login == cl.fromId}">						
									<div class="chat-content-rightside">
										<div class="d-flex ms-auto">
											<div class="flex-grow-1 me-2">
												<p class="mb-0 chat-time text-end">${cl.fromId}, ${cl.createdate}</p>
												<p class="chat-right-msg" style="float:right">${cl.chattingMemo}</p>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="chat-footer d-flex align-items-center">
						<div class="flex-grow-1 pe-2">
							<div class="input-group">	<span class="input-group-text"><i class='bx bx-smile'></i></span>
								<input type="text" id="msg" class="form-control" placeholder="Type a message">
								<button class="btn btn-secondary" type="button" id="button-send">Button</button>
							</div>
						</div>
						<div class="chat-footer-menu"> <a href="javascript:;"><i class='bx bx-file'></i></a>
							<a href="javascript:;"><i class='bx bx-dots-horizontal-rounded'></i></a>
						</div>
					</div>
					<!--start chat overlay-->
					<div class="overlay chat-toggle-btn-mobile"></div>
					<!--end chat overlay-->
				</div>
			</div>
		</div>
   		<!--end page main-->
		
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
	
	<script>
	$(document).ready(function(){		
		const chattingRoomName = $("#chattingRoomName").val();
		const username = $("#login").val();		
		
		console.log("chattingRoomName: " + chattingRoomName);
		console.log("username: " + username);
		
		/* const websocket = new WebSocket("ws://localhost:8080/ws/chat");
		console.log("websocket");
		console.log(websocket); */
		// console.log(websocket);
		
		let sockJs = new SockJS("/58shop_c/stomp/chat"); // registerStompEndpoints - registry.addEndpoint("/stomp/chat")
		// var sockJs = new SockJS("http://localhost:8080/ws/chat", null, {transports: ["websocket", "xhr-streaming", "xhr-polling"]});
		console.log("sockJs");
		console.log(sockJs);
		
		var stomp = webstomp.over(sockJs);
		console.log(stomp);
		
		// ajax 채팅
		setInterval(ajaxChat, 2000);
		function ajaxChat(){
				$.ajax({
					type : 'get',
					url : '/58shop_c/customer/chat',
					// 채팅 방 번호와 자기 자신의 workMemberNo를 전송
					data: { chattingRoomName : chattingRoomName},
					success: function (json) {
			            console.log("성공");            
			        },
			        error: function (request, status, error) {
			            console.log("에러");
			        },
			        complete: function() {
			            // location.reload();
			            // 리로드하고싶은 div 아이디값 적용 !! 
			            $('#msgArea').load(location.href+' #msgArea');
			            // 두번째 ' #left_body' 앞 공백까지 포함하기 !!!
			        }
				}); // end for ajax
		}
		
		// 2. connection이 이루어지면 실행할 콜백함수
		stomp.connect({}, function(){
			console.log("STOMP connected!");
			//3. send(path, header, chattingMemo)로 메세지를 보낼 수 있음
            stomp.send('/pub/chat/enter', JSON.stringify({chattingRoomName: chattingRoomName, fromId: username}));
			
			//4. subscribe(path, callback)으로 메세지를 받을 수 있음
            stomp.subscribe("/sub/chat?chattingRoomName=" + chattingRoomName, function (chat) {
            	console.log("subscribe!!!");
            	console.log("chat");
            	console.log(chat.body);
            	
                var content = JSON.parse(chat.body);
            	console.log(content);

                var fromId = content.fromId;
                let chattingMemo = content.chattingMemo;
                let createdate = content.createdate;
                console.log("SUBSCRIBE")
                console.log(fromId + ": " + chattingMemo);
                var str = '';

                if(fromId != username){
                    str = '<div class="chat-content-leftside">';
                    str += '<div class="d-flex">';
                    str += '<img src="assets/images/avatars/avatar-3.png" width="48" height="48" class="rounded-circle" alt="" />';
                    str += '<div class="flex-grow-1 ms-2">';
                    str += '<p class="mb-0 chat-time">' + fromId + ', ' + createdate + '</p>';
                    str += '<p class="chat-left-msg">' + chattingMemo + '</p>';
                    str += '</div></div></div>';
                } else {
                    str = '<div class="chat-content-rightside">';
                    str += '<div class="d-flex ms-auto">';
                    str += '<div class="flex-grow-1 me-2">';
                    str += '<p class="mb-0 chat-time text-end">' + fromId + ', ' + createdate + '</p>';
                    str += '<p class="chat-right-msg" style="float:right;">' + chattingMemo + '</p>';
                    str += '</div></div></div>';
                }                
                
                $("#msgArea").append(str);
			}); 
			
	        $("#button-send").on("click", function(e){
                var msg =  $("#msg").val();
                console.log(username + ":" + msg);
                
                stomp.send('/pub/chat/message', JSON.stringify({chattingRoomName: chattingRoomName, chattingMemo: msg, fromId: username}));
                $("#msg").val('');
            });	        
	     	// 엔터키를 누르면 submit 버튼이 눌리도록
	        $("#msg").keyup(function(event) {
				if (event.which === 13) {
					// console.log("enter key pressed!");
    				$("#button-send").click();
				}
			});
        });
	});
  </script>
	
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/html/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/html/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/html/phpmailer/validate.js"></script>
	
</body>
</html>