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
		// ????????????????????? ????????? ?????????????????? ?????? ??????
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
		
		// ???????????? ????????? ????????? ??? ?????? ?????? ??????
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
			
			
			// ????????????
			$('#addressBtn').click(function() {
				new daum.Postcode({
			        oncomplete: function(data) {
			       		$('#address').val(data.address);
			       		$('#postcode').val(data.zonecode);
			       		$('#addressDetail').focus();
			        }
			    }).open();
			});
			
			// ????????? ???????????? ???????????? ????????? ???????????? ??????
			$('.marketing').change(function() {
				if($('.marketing').prop('checked')) {
					$('.marketing').prop('checked',false);
					$(this).prop('checked',true);
				}
			});
			
			// ????????? ?????????&????????????
			$('#id').blur(function() {
				if($(this).val() == '') {
					$('#idCheckMsg').text('');
					$('#idMsg').text('???????????? ???????????????');
				} else {
					$('#idMsg').text('');
					$.ajax({
						url:'idCheck'
						, type:'get'
						, data:{customerId:$(this).val()}
						, success:function(model) {
							if(model == 'YES') {
								$('#idCheckMsg').text('?????? ????????? ??????????????????');
								$('#idCheckMsg').css('color','green');
							} else {
								$('#idCheckMsg').text('????????? ??? ?????? ??????????????????');
								$('#idCheckMsg').css('color','#FF3300');
							}
						}
					});
				}
			});
		
			
			
			// ??????
			$('#name').change(function() {
				if($(this).val() == '') {
					$('#nameMsg').text('????????? ???????????????');
				} else {
					$('#nameMsg').text('');
				}
			});
			
			// ?????????
			$('#nickname').change(function() {
				if($(this).val() == '') {
					$('#nickMsg').text('???????????? ???????????????');
				} else {
					$('#nickMsg').text('');
				}
			});
			
			// ???????????? ???????????????
			$('#pw').change(function() {
				if($(this).val() == '') {
					$('#pwMsg').text('??????????????? ???????????????');
				} else {
					$('#pwMsg').text('');
				}
			});
			
			// ???????????? ??????
			$('#pwck').change(function() {
				if($('#pw').val() != $(this).val()) {
					$('#pwckMsg').text('??????????????? ???????????? ????????????');
				} else {
					$('#pwckMsg').text('');
				}
			});
			
			// ????????? ???????????????
			$('#emailId').change(function() {
				if($(this).val() == '') {
					$('#emailMsg').text('???????????? ???????????????');
				} else {
					$('#emailMsg').text('');
					$('#emailDomain').focus();
				}
			});
			
			$('#emailDomain').change(function() {		
				let emailDomain;
				if($(this).val() == '') {
					$('#emailMsg').text('???????????? ???????????????');
				} else if($(this).val() == '????????????') {
					if($('#inputDomain').length == 0) {
						$('#email').append('<input type="text" id="inputDomain">');// ?????? ??????
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
			if($('#inputDomain').length == 1) {
			$(document).on('change',$('#inputDomain'),function() { // ????????????????????? ??????????????? $(document).on(?????????????????????(ex. click), ???????????????, function()
				$('#customerEmail').val($('#emailId').val()+'@'+$('#inputDomain').val());
				console.log('email: '+$('#customerEmail').val());
			});
			}
	
			// ????????????
			$('.phoneNum').change(function() {
				$('.phoneNum').each(function() { 		
					if($(this).val() == '') {
						$('#phoneMsg').text('??????????????? ???????????????');
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
		
			// ????????????
			let year;
			let month;
			let date;
			let birth;
			$('#year').change(function() {
				if($(this).val() == '0') {
					$('#birthMsg').text('????????? ???????????????');
				} else {
					$('#birthMsg').text('');
					$('#month').focus();
					year=$(this).val();
				}
			});
			$('#month').change(function() {
				if($(this).val() == '0') {
					$('#birthMsg').text('?????? ???????????????');
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
					$('#birthMsg').text('?????? ???????????????');
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
			
			
			// ??????
			$('#address').change(function() {
				if($(this).val() == '') {
					$('#addressMsg').text('????????? ???????????????');
				} else {
					$('#addressMsg').text('');
					$('#addressDetail').focus();
				}
			});
			
			// ????????????
			$('#addressDetail').change(function() {
				if($(this).val() == '') {
					$('#addressDetailMsg').text('??????????????? ???????????????');
				} else {
					$('#addressDetailMsg').text('');
				}
			});
			
			// ????????? ??????
			$('.marketing').change(function() {
				if($(this).val() == '') {
					$('#marketingMsg').text('??????????????? ??????????????? ??????????????????');
				} else {
					$('#marketingMsg').text('');
				}
			});
			
			
			
			$('#insertBtn').click(function() {
				let submitCheck=0;
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
				
				// ??????
				if($('#name').val() == '') {
					$('#nameMsg').text('????????? ???????????????');
					$('#nameMsg').focus();
				} else {
					$('#nameMsg').text('');
					++submitCheck;
				}
				
				// ?????????
				if($('#nickname').val() == '') {
					$('#nickMsg').text('???????????? ???????????????');
					$('#nickMsg').focus()
				} else {
					$('#nickMsg').text('');
					++submitCheck;
				}
				
				// ???????????? ???????????????
				if($('#pw').val() == '') {
					$('#pwMsg').text('??????????????? ???????????????');
					$('#pw').focus();
				} else {
					$('#pwMsg').text('');
					++submitCheck;
				}
				
				// ???????????? ??????
				if($('#pwck').val() == '') {
					$('#pwckMsg').text('??????????????? ???????????? ????????????');
					$('#pwck').focus();
				} else {
					$('#pwckMsg').text('');
					++submitCheck;
				}
				
				// ????????? ???????????????
				if($('#emailId').val() == '') {
					$('#emailMsg').text('???????????? ???????????????');
					$('#emailId').focus();
				} else {
					$('#emailMsg').text('');
					++submitCheck;
				} 
				
				if($('#emailDomain').val() == '') {
					$('#emailMsg').text('???????????? ???????????????');	
					$('#emailDomain').focus();
				} else {
					$('#emailMsg').text('');	
					++submitCheck;
				}
	
				// ????????????
				if($('#phone').val() == '') {
					$('#phoneMsg').text('???????????? ???????????????');
					$('.phoneNum').focus();
				} else {
					$('#phoneMsg').text('');
					++submitCheck;
				}
			
				// ????????????
				if($('#year').val() == '0') {
					$('#birthMsg').text('????????? ???????????????');
					$('#year').focus();
				} else {
					$('#birthMsg').text('');
					++submitCheck;
				}
				if($('#month').val() == '0') {
					$('#birthMsg').text('?????? ???????????????');
					$('#month').focus();
				} else {
					$('#birthMsg').text('');
					++submitCheck;
				} 
				if($('#date').val() == '0') {
					$('#birthMsg').text('?????? ???????????????');
					$('#date').focus();
				} else {
					$('#birthMsg').text('');
					++submitCheck;
				} 
	
				// ??????
				if($('#address').val() == '') {
					$('#addressMsg').text('????????? ???????????????');
					$('#address').focus();
				} else {
					$('#addressMsg').text('');
					++submitCheck;
				}
				
				// ????????????
				if($('#addressDetail').val() == '') {
					$('#addressDetailMsg').text('??????????????? ???????????????');
					$('#addressDetail').focus();
				} else {
					$('#addressDetailMsg').text('');
					++submitCheck;
				} 
				
				// ????????? ??????
				if(!$('.marketing').is(':checked')) {
					$('#marketingMsg').text('??????????????? ??????????????? ??????????????????');
					$('.marketing').focus();
				} else {
					$('#marketingMsg').text('');
					++submitCheck;
				} 
				
				// ????????????????????????
				if(!$('#customerInfo').is(':checked')) {
					alert('?????????????????? ??? ????????? ??????????????????');
					return false;
				} else {
					++submitCheck;
				}
				
				console.log(submitCheck);
				
				if(submitCheck == 14) {
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
					<label>?????????</label>
					<input class="form-control" type="text" id="id" name="customerId">
					<i class="ti-user"></i>
					
					<span id="idMsg" class="checkMsg"></span>
					<span id="idCheckMsg"></span>
					
				</div>
				<div class="form-group">
					<label>????????????</label>
					<input class="form-control" type="password" id="pw" name="customerPw">
					
					<span id="pwMsg" class="checkMsg"></span>
					
					<i class="icon_lock_alt"></i>
				</div>
				
				<div class="form-group">
					<label>???????????? ??????</label>
					<input class="form-control" type="password" id="pwck">
					
					<span id="pwckMsg" class="checkMsg"></span>
					
					<i class="icon_lock_alt"></i>
				</div>
				
				<div class="form-group">
					<label>??????</label>
					<input class="form-control" type="text" id="name" name="customerName">
					
					<span id="nameMsg" class="checkMsg"></span>
					
					<i class="ti-user"></i>
				</div>
				
				<div class="form-group">
					<label>?????????</label>
					<input class="form-control" type="text" id="nickname" name="customerNickname">
					
					<span id="nickMsg" class="checkMsg"></span>
					
					<i class="ti-user"></i>
				</div>
				
				
				<div class="form-group">
					<label>??????</label>
					<div>
						<input type="radio" class="gender" name="customerGender" value="???">???&nbsp;&nbsp;&nbsp;
						<input type="radio" class="gender" name="customerGender" value="???">???
					</div>
					<span id="genderMsg" class="checkMsg"></span>
				</div>
				
				<div class="form-group">
					<label>?????????</label>
					<input type="hidden" id="phone" name="customerPhone">
					<input class="form-control phoneNum" type="number" min="0" oninput="handleOnInput(this, 3)">
					<input class="form-control phoneNum" type="number" min="0" oninput="handleOnInput(this, 4)">
					<input class="form-control phoneNum" type="number" min="0" oninput="handleOnInput(this, 4)">
					
					<span id="phoneMsg" class="checkMsg"></span>
					
					<i class="icon_lock_alt"></i>
				</div>
				
				<div class="form-group">
					<label>?????????</label>
					<input type="hidden" id="customerEmail" name="customerEmail">
					<input type="text" class="form-control" id="emailId">
					@
					<span id="email">
						<select id="emailDomain">
							<option>==</option>
							<option value="google.com">google.com</option>
							<option value="naver.com">naver.com</option>
							<option value="????????????">????????????</option>
						</select>
					</span>
					<div>
						<span id="emailMsg" class="checkMsg"></span>
					</div>
					<i class="icon_mail_alt"></i>
				</div>
				
				<div class="form-group">
					<label>????????????</label>

					<input type="hidden" id="birth" name="customerBirth">
					<div>
						<select id="year">
							<option value="0">??????</option>
							<c:forEach var="i" begin="1940" end="2023">
								<option value="${2023-i+1940}">${2023-i+1940}</option>
							</c:forEach>
						</select>
						<select id="month">
							<option value="0">???</option>
							<c:forEach var="j" begin="1" end="12">
								<option value="${j}">${j}</option>
							</c:forEach>
						</select>
						<select id="date">
						<option value="0">???</option>
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
					<label>??????</label>
					<input type="hidden" id="customerAddress" name="customerAddress">
					<input type="text" class="form-control" id="address" class="address" readonly="readonly">
					<input type="text" class="form-control" id="postcode" name="customerPostcode" readonly="readonly">
					<button type="button" id="addressBtn">????????????</button>
					<div>
						<span id="addressMsg" class="checkMsg"></span>
					</div>
				</div>
				
				<div class="form-group">
					<label>????????????</label>
					<input class="form-control" type="text" id="addressDetail" class="address">
					<span id="addressDetailMsg" class="checkMsg"></span>
					<i class="icon_lock_alt"></i>
				</div>
				
					<table>
					<tr>
						<th colspan="2">
							<h5>??????????????? ?????? ?????? ??????</h5>
						</th>
					</tr>
					<tr>
						<td>
							???????????? ???????????? ?????? ????????? ????????? ?????????????????????????
							<input type="checkbox" class="marketing" name="customerEmailMarketingAccept" value="??????">??????
							<input type="checkbox" class="marketing" name="customerEmailMarketingAccept" value="?????????">?????????
							<div>
								<span id="marketingMsg" class="checkMsg"></span>
							</div>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<h5>?????????????????? ??? ?????? ??????(??????)</h5>
						</th>
					</tr>
					<tr>
						<td>
							?????? ??? ?????????????????? ?????? ???????????? ??????????????? ???????????? ???????????? ?????? ???????????????????
							<input type="checkbox" id="customerInfo" name="customerInfoAgree" value="??????">??????
						</td>
					</tr>
				</table>
				
				<br>
			    <textarea type="text" id="token" name="token" value=""></textarea>


				<div id="pass-info" class="clearfix"></div>
				<button type="button" class="btn_1 rounded full-width add_top_30" id="insertBtn">????????????</button>
				<div class="text-center add_top_10">?????? ??????????????????? <strong><a href="${pageContext.request.contextPath}/login">???????????????</a></strong></div>
			</form>
			<div class="copy">?? 2018 Panagea</div>
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