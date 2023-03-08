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
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/html/img/favicon.ico" type="${pageContext.request.contextPath}/resources/html/image/x-icon">
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
    
    <style>
		.checkMsg {
			color:#FF3300;
		}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://www.google.com/recaptcha/api.js?render=6LdO2uEkAAAAAN2mVTdIBzZg44L4k4AOuSXtWooz"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		// 핸드폰번호에는 숫자만 입력가능하게 하는 함수
		function handleOnInput(el, maxlength) {
			  if(el.value.length > maxlength) {
			    el.value=el.value.substr(0, maxlength);
			  }
		}
		function handleOnInput2(el, maxlength) {
			  if(el.value.length > maxlength)  {
			    el.value=el.value.substr(0, maxlength);
			  }
		}
		
		// 생일에는 숫자만 입력할 수 있게 하는 함수
		function handleOnInput3(el, maxlength) {
			  if(el.value.length > maxlength)  {
			    el.value=el.value.substr(0, maxlength);
			  }
		}
		
		 function reCapt() {
	            grecaptcha.ready(function() {
	                grecaptcha.execute('6LdO2uEkAAAAAN2mVTdIBzZg44L4k4AOuSXtWooz', {action: 'signup'}).then(function(token) {
	                    $('#token').val(token);
	                    $.ajax({
	                        url: 'validation',
	                        type : 'POST',
	                        dataType: 'json',
	                        data : {'token': token},
	                        success : function(result){
	                            console.log(result);
	                        },
	                        fail: function(e){
	                            console.log("fail")
	                        }
	                      });// end ajax
	                });
	            });
	      }
		
		
		
	
		$(function() {	
			reCapt();
			$('#id').focus();
			
			
			// 주소찾기
			$('#addressBtn').click(function() {
				new daum.Postcode({
			        oncomplete: function(data) {
			       		$('#address').val(data.address);
			       		$('#postcode').val(data.zonecode);
			       		$('#addressDetail').focus();
			        }
			    }).open();
			});
			
			// 마케팅 수신동의 체크박스 하나만 체크되게 하기
			$('.marketing').change(function() {
				if($('.marketing').prop('checked')) {
					$('.marketing').prop('checked',false);
					$(this).prop('checked',true);
				}
			});
			
			// 아이디 유효성&중복검사
			$('#id').blur(function() {
				if($(this).val() == '') {
					$('#idCheckMsg').text('');
					$('#idMsg').text('아이디를 입력하세요');
				} else {
					$('#idMsg').text('');
					$.ajax({
						url:'idCheck'
						, type:'get'
						, data:{customerId:$(this).val()}
						, success:function(model) {
							if(model == 'YES') {
								$('#idCheckMsg').text('사용 가능한 아이디입니다');
								$('#idCheckMsg').css('color','green');
							} else {
								$('#idCheckMsg').text('사용할 수 없는 아이디입니다');
								$('#idCheckMsg').css('color','#FF3300');
							}
						}
					});
				}
			});
		
			
			
			// 이름
			$('#name').change(function() {
				if($(this).val() == '') {
					$('#nameMsg').text('이름을 입력하세요');
				} else {
					$('#nameMsg').text('');
				}
			});
			
			// 닉네임
			$('#nickname').change(function() {
				if($(this).val() == '') {
					$('#nickMsg').text('닉네임을 입력하세요');
				} else {
					$('#nickMsg').text('');
				}
			});
			
			// 비밀번호 유효성검사
			$('#pw').change(function() {
				if($(this).val() == '') {
					$('#pwMsg').text('비밀번호를 입력하세요');
				} else {
					$('#pwMsg').text('');
				}
			});
			
			// 비밀번호 확인
			$('#pwck').change(function() {
				if($('#pw').val() != $(this).val()) {
					$('#pwckMsg').text('비밀번호가 일치하지 않습니다');
				} else {
					$('#pwckMsg').text('');
				}
			});
			
			// 이메일 유효성검사
			$('#emailId').change(function() {
				if($(this).val() == '') {
					$('#emailMsg').text('이메일을 입력하세요');
				} else {
					$('#emailMsg').text('');
					$('#emailDomain').focus();
				}
			});
			
			$('#emailDomain').change(function() {		
				let emailDomain;
				if($(this).val() == '') {
					$('#emailMsg').text('이메일을 입력하세요');
				} else if($(this).val() == '직접입력') {
					if($('#inputDomain').length == 0) {
						$('#email').append('<input type="text" id="inputDomain">');// 태그 추가
					}
				} else {
					if($('#inputDomain').length == 1) {
						$('#inputDomain').remove();
					}
					emailDomain=$(this).val();
					$('#emailMsg').text('');
					$('#customerEmail').val($('#emailId').val()+'@'+$(this).val());
				}
				$('#customerEmail').val($('#emailId').val()+'@'+emailDomain);
				console.log('email: '+$('#customerEmail').val());
			});
			$(document).on('change',$('#inputDomain'),function() { // 동적생성객체에 이벤트주기 $(document).on(발생시킬이벤트(ex. click), 객체접근자, function()
				$('#customerEmail').val($('#emailId').val()+'@'+$('#inputDomain').val());
				console.log('email: '+$('#customerEmail').val());
			});
	
			// 전화번호
			$('.phoneNum').change(function() {
				$('.phoneNum').each(function() { 		
					if($(this).val() == '') {
						$('#phoneMsg').text('전화번호를 입력하세요');
					} else {
						phoneNumber = $($('.phoneNum')[0]).val()+$($('.phoneNum')[1]).val()+$($('.phoneNum')[2]).val();
					}
					if($($('.phoneNum')[0]).val() != '' && $($('.phoneNum')[1]).val() != '' && $($('.phoneNum')[2]).val() != ''){
						$('#phoneMsg').text('');
					}
				});
				$('#phone').val(phoneNumber);
				console.log($('#phone').val());
			});
		
			// 생년월일
			let year;
			let month;
			let date;
			let birth;
			$('#year').change(function() {
				if($(this).val() == '0') {
					$('#birthMsg').text('년도를 선택하세요');
				} else {
					$('#birthMsg').text('');
					$('#month').focus();
					year=$(this).val();
				}
			});
			$('#month').change(function() {
				if($(this).val() == '0') {
					$('#birthMsg').text('월을 선택하세요');
				} else if(Number($(this).val()<10)) {
					$('#birthMsg').text('');
					$('#date').focus();
					month='0'+$(this).val();
				} else {
					$('#birthMsg').text('');
					$('#date').focus();
					month=$(this).val();
				}
			});
			$('#date').change(function() {
				if($(this).val() == '0') {
					$('#birthMsg').text('일을 선택하세요');
				} else if(Number($(this).val())<10){
					$('#birthMsg').text('');
					date='0'+$(this).val();
				} else {
					$('#birthMsg').text('');
					date=$(this).val();
				}
				if(year != '' && month != '' && date !='') {
					birth=year+month+date;
					$('#birth').val(birth);
				}
				console.log('birth: '+birth);
			});
			
			
			// 주소
			$('#address').change(function() {
				if($(this).val() == '') {
					$('#addressMsg').text('주소를 입력하세요');
				} else {
					$('#addressMsg').text('');
					$('#addressDetail').focus();
				}
			});
			
			// 상세주소
			$('#addressDetail').change(function() {
				if($(this).val() == '') {
					$('#addressDetailMsg').text('상세주소를 입력하세요');
				} else {
					$('#addressDetailMsg').text('');
				}
			});
			
			// 마케팅 동의
			$('.marketing').change(function() {
				if($(this).val() == '') {
					$('#marketingMsg').text('마케팅메일 수신여부를 체크해주세요');
				} else {
					$('#marketingMsg').text('');
				}
			});
			
			
			
			$('#insertBtn').click(function() {
				$('#customerAddress').val($('#address').val()+$('#addressDetail').val());
				
				console.log('name: '+$('#name').val());
				console.log('nickname: '+$('#nickname').val());
				console.log('pw: '+$('#pw').val());
				console.log('email: '+$('#customerEmail').val());
				console.log('phone: '+$('#phone').val());
				console.log('birth: '+$('#birth').val());
				console.log('address: '+$('#customerAddress').val());
				console.log('gender: '+$('.gender:checked').val());
				console.log('postcode: '+$('#postcode').val());
				
				// 이름
				if($('#name').val() == '') {
					$('#nameMsg').text('이름을 입력하세요');
					$('#nameMsg').focus();
				} 
				
				// 닉네임
				if($('#nickname').val() == '') {
					$('#nickMsg').text('닉네임을 입력하세요');
					$('#nickMsg').focus()
				} 
				
				// 비밀번호 유효성검사
				if($('#pw').val() == '') {
					$('#pwMsg').text('비밀번호를 입력하세요');
					$('#pw').focus();
				} 
				
				// 비밀번호 확인
				if($('#pwck').val() == '') {
					$('#pwckMsg').text('비밀번호가 일치하지 않습니다');
					$('#pwck').focus();
				} 
				
				// 이메일 유효성검사
				if($('#emailId').val() == '') {
					$('#emailMsg').text('이메일을 입력하세요');
					$('#emailId').focus();
				}
				if($('#emailDomain').val() == '') {
					$('#emailMsg').text('이메일을 입력하세요');	
					$('#emailDomain').focus();
				} 
	
				// 전화번호
				if($('#phone').val() == '') {
					$('#phoneMsg').text('연락처를 확인하세요');
					$('.phoneNum').focus();
				}
			
				// 생년월일
				if($('#year').val() == '0') {
					$('#birthMsg').text('년도를 선택하세요');
					$('#year').focus();
				}
				if($('#month').val() == '0') {
					$('#birthMsg').text('월을 선택하세요');
					$('#month').focus();
				} 
				if($('#date').val() == '0') {
					$('#birthMsg').text('일을 선택하세요');
					$('#date').focus();
				} 
	
				// 주소
				if($('#address').val() == '') {
					$('#addressMsg').text('주소를 입력하세요');
					$('#address').focus();
				} 
				
				// 상세주소
				if($('#addressDetail').val() == '') {
					$('#addressDetailMsg').text('상세주소를 입력하세요');
					$('#addressDetail').focus();
				} 
				
				// 마케팅 동의
				if($('.marketing').val() == '') {
					$('#marketingMsg').text('마케팅메일 수신여부를 체크해주세요');
					$('.marketing').focus();
				} 
				
				// 개인정보수집동의
				if($('#customerInfo').val() == '') {
					alert('개인정보수집 및 이용에 동의해주세요');
					return false;
				} else {
					$('#insertForm').submit();
				}
				
				
			});
	
		});
	</script>
	
</head>

<body id="register_bg">
	
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
			<form action="${pageContext.request.contextPath}/signup" method="post" id="insertForm">
				<div class="form-group">
					<label>아이디</label>
					<input class="form-control" type="text" id="id" name="customerId">
					<i class="ti-user"></i>
					
					<span id="idMsg" class="checkMsg"></span>
					<span id="idCheckMsg"></span>
					
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input class="form-control" type="password" id="pw" name="customerPw">
					
					<span id="pwMsg" class="checkMsg"></span>
					
					<i class="icon_lock_alt"></i>
				</div>
				
				<div class="form-group">
					<label>비밀번호 확인</label>
					<input class="form-control" type="password" id="pwck">
					
					<span id="pwckMsg" class="checkMsg"></span>
					
					<i class="icon_lock_alt"></i>
				</div>
				
				<div class="form-group">
					<label>이름</label>
					<input class="form-control" type="text" id="name" name="customerName">
					
					<span id="nameMsg" class="checkMsg"></span>
					
					<i class="ti-user"></i>
				</div>
				
				<div class="form-group">
					<label>닉네임</label>
					<input class="form-control" type="text" id="nickname" name="customerNickname">
					
					<span id="nickMsg" class="checkMsg"></span>
					
					<i class="ti-user"></i>
				</div>
				
				
				<div class="form-group">
					<label>성별</label>
					<div>
						<input type="radio" class="gender" name="customerGender" value="남">남&nbsp;&nbsp;&nbsp;
						<input type="radio" class="gender" name="customerGender" value="여">여
					</div>
					<span id="genderMsg" class="checkMsg"></span>
				</div>
				
				<div class="form-group">
					<label>연락처</label>
					<input type="hidden" id="phone" name="customerPhone">
					<input class="form-control phoneNum" type="number" min="0" oninput="handleOnInput(this, 3)">
					<input class="form-control phoneNum" type="number" min="0" oninput="handleOnInput(this, 4)">
					<input class="form-control phoneNum" type="number" min="0" oninput="handleOnInput(this, 4)">
					
					<span id="phoneMsg" class="checkMsg"></span>
					
					<i class="icon_lock_alt"></i>
				</div>
				
				<div class="form-group">
					<label>이메일</label>
					<input type="hidden" id="customerEmail" name="customerEmail">
					<input type="text" class="form-control" id="emailId">
					@
					<span id="email">
						<select id="emailDomain">
							<option value="google.com">google.com</option>
							<option value="naver.com">naver.com</option>
							<option value="직접입력">직접입력</option>
						</select>
					</span>
					<div>
						<span id="emailMsg" class="checkMsg"></span>
					</div>
					<i class="icon_mail_alt"></i>
				</div>
				
				<div class="form-group">
					<label>생년월일</label>

					<input type="hidden" id="birth" name="customerBirth">
					<div>
						<select id="year">
							<option value="0">년도</option>
							<c:forEach var="i" begin="1940" end="2023">
								<option value="${2023-i+1940}">${2023-i+1940}</option>
							</c:forEach>
						</select>
						<select id="month">
							<option value="0">월</option>
							<c:forEach var="j" begin="1" end="12">
								<option value="${j}">${j}</option>
							</c:forEach>
						</select>
						<select id="date">
						<option value="0">일</option>
							<c:forEach var="h" begin="1" end="31">
								<option value="${h}">${h}</option>
							</c:forEach>
						</select>
						<div>
							<span id="birthMsg" class="checkMsg"></span>
						</div>
					
					</div>

				</div>
				
				<div class="form-group">
					<label>주소</label>
					<input type="hidden" id="customerAddress" name="customerAddress">
					<input type="text" class="form-control" id="address" class="address" readonly="readonly">
					<input type="text" class="form-control" id="postcode" name="customerPostcode" readonly="readonly">
					<button type="button" id="addressBtn">주소찾기</button>
					<div>
						<span id="addressMsg" class="checkMsg"></span>
					</div>
				</div>
				
				<div class="form-group">
					<label>상세주소</label>
					<input class="form-control" type="text" id="addressDetail" class="address">
					<span id="addressDetailMsg" class="checkMsg"></span>
					<i class="icon_lock_alt"></i>
				</div>
				
					<table>
					<tr>
						<th colspan="2">
							<h5>마케팅메일 수신 동의 여부</h5>
						</th>
					</tr>
					<tr>
						<td>
							할인이나 이벤트에 대한 정보를 메일로 받아보시겠습니까?
							<input type="checkbox" class="marketing" name="customerEmailMarketingAccept" value="동의">동의
							<input type="checkbox" class="marketing" name="customerEmailMarketingAccept" value="미동의">미동의
							<div>
								<span id="marketingMsg" class="checkMsg"></span>
							</div>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<h5>개인정보수집 및 이용 동의(필수)</h5>
						</th>
					</tr>
					<tr>
						<td>
							배송 및 쇼핑서비스를 위해 쇼핑몰이 개인정보를 수집하고 이용하는 것에 동의하십니까?
							<input type="checkbox" id="customerInfo" name="customerInfoAgree" value="동의">동의
						</td>
					</tr>
				</table>
				
				<br>
			    <textarea type="text" id="token" name="token" value=""></textarea>


				<div id="pass-info" class="clearfix"></div>
				<button type="button" class="btn_1 rounded full-width add_top_30" id="insertBtn">가입하기</button>
				<div class="text-center add_top_10">이미 회원이신가요? <strong><a href="${pageContext.request.contextPath}/login">로그인하기</a></strong></div>
			</form>
			<div class="copy">© 2018 Panagea</div>
		</aside>
	</div>
	<!-- /login -->
	
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/html/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/html/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/html/phpmailer/validate.js"></script>
	
	<!-- SPECIFIC SCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/html/js/pw_strenght.js"></script>
	
</body>
</html>