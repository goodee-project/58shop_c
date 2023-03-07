<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<style>
	.checkMsg {
		color:#FF3300;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
	
	$(function() {	
		
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
		$('.marketing').click(function() {
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
		$('#name').blur(function() {
			if($(this).val() == '') {
				$('#nameMsg').text('이름을 입력하세요');
			} else {
				$('#nameMsg').text('');
			}
		});
		
		// 닉네임
		$('#nickname').blur(function() {
			if($(this).val() == '') {
				$('#nickMsg').text('닉네임을 입력하세요');
			} else {
				$('#nickMsg').text('');
			}
		});
		
		// 비밀번호 유효성검사
		$('#pw').blur(function() {
			if($(this).val() == '') {
				$('#pwMsg').text('비밀번호를 입력하세요');
			} else {
				$('#pwMsg').text('');
			}
		});
		
		// 비밀번호 확인
		$('#pwck').blur(function() {
			if($('#pw').val() != $(this).val()) {
				$('#pwckMsg').text('비밀번호가 일치하지 않습니다');
			} else {
				$('#pwckMsg').text('');
			}
		});
		
		// 이메일 직접입력 선택했을 때 input 태그 추가하기
		$('#emailDomain').click(function() { 
			console.log($(this).val());
			if($(this).val() == '직접입력') { 
				if($('#inputDomain').length == 0) {
					$('#email').append('<input type="text" id="inputDomain">');// 태그 추가
				}
			} else {
				if($('#inputDomain').length == 1) {
					$('#inputDomain').remove();
				}
			}
		});
		
		// 이메일 유효성검사
		$('#emailId').blur(function() {
			if($(this).val() == '') {
				$('#emailMsg').text('이메일을 입력하세요');
			} else {
				$('#emailMsg').text('');
				$('#emailDomain').focus();
			}
		});
		let emailDomain;
		$('#emailDomain').click(function() {		
			if($(this).val() == '') {
				$('#emailMsg').text('이메일을 입력하세요');
			} else if($(this).val() == '직접입력') {
				$('#inputDomain').on('change',function(){
					emailDomain=$('#inputDomain').val();
					$('#emailMsg').text('');
				});			
			} else {
				emailDomain=$(this).val();
				$('#emailMsg').text('');
			}
			$('#customerEmail').val($('#emailId').val()+'@'+emailDomain);
			console.log('email: '+$('#customerEmail').val());
		});

		// 전화번호
		$('.phoneNum').blur(function() {
			$('.phoneNum').each(function() { 		
				if($(this).val() == '') {
					$('#phoneMsg').text('전화번호를 입력하세요');
				} else {
					phoneNumber = $($('.phoneNum')[0]).val()+'-'+$($('.phoneNum')[1]).val()+'-'+$($('.phoneNum')[2]).val();
				}
				if($($('.phoneNum')[0]).val() != '' && $($('.phoneNum')[1]).val() != '' && $($('.phoneNum')[2]).val() != ''){
					$('#phoneMsg').text('');
				}
			});
			$('#phone').val(phoneNumber);
		});
	
		// 생년월일
		let year;
		let month;
		let date;
		let birth;
		$('#year').blur(function() {
			if($(this).val() == '0') {
				$('#birthMsg').text('년도를 선택하세요');
			} else {
				$('#birthMsg').text('');
				$('#month').focus();
				year=$(this).val();
			}
		});
		$('#month').blur(function() {
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
		$('#date').blur(function() {
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
			}
			console.log('birth: '+birth);
		});
		
		
		// 주소
		let address;
		let addressDetail;
		$('#address').blur(function() {
			if($(this).val() == '') {
				$('#addressMsg').text('주소를 입력하세요');
			} else {
				$('#addressMsg').text('');
				$('#addressDetail').focus();
				address=$(this).val();
			}
		});
		
		// 상세주소
		$('#addressDetail').blur(function() {
			if($(this).val() == '') {
				$('#addressDetailMsg').text('상세주소를 입력하세요');
			} else {
				$('#addressDetailMsg').text('');
				addressDetail=$(this).val();
			}
		});
		
		if(address != '' && addressDetail != '') {
			$('#customerAddress').val(address+addressDetail);
		}
		
		// 마케팅 동의
		$('.marketing').blur(function() {
			if($(this).val() == '') {
				$('#marketingMsg').text('마케팅메일 수신여부를 체크해주세요');
			} else {
				$('#marketingMsg').text('');
			}
		});
		
		
		
		$('#insertBtn').click(function() {
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
<body>
	<div>
		<form action="${pageContext.request.contextPath}/signup" method="post" id="insertForm">
			<table>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" id="id" name="customerId">
						<div>
							<span id="idMsg" class="checkMsg"></span>
							<span id="idCheckMsg"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" id="pw" name="customerPw">
						<div>
							<span id="pwMsg" class="checkMsg"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td>
						<input type="password" id="pwck">
						<div>
							<span id="pwckMsg" class="checkMsg"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" id="name" name="customerName">
						<div>
							<span id="nameMsg" class="checkMsg"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td>
						<input type="text" id="nickname" name="customerNickname">
						<div>
							<span id="nickMsg" class="checkMsg"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="customerGender" value="남">남
						<input type="radio" name="customerGender" value="여">여
						<div>
							<span id="genderMsg" class="checkMsg"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						<input type="hidden" id="phone" name="customerPhone">
						<input type="number" class="phoneNum" min="0" oninput="handleOnInput(this, 3)">-<input type="number" class="phoneNum" min="0" oninput="handleOnInput2(this, 4)">-<input type="number" class="phoneNum" min="0" oninput="handleOnInput2(this, 4)">
						<div>
							<span id="phoneMsg" class="checkMsg"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="hidden" id="customerEmail" name="customerEmail">
						<input type="text" id="emailId">
						@
						<span id="email">
							<select	id="emailDomain">
								<option value="google.com">google.com</option>
								<option value="naver.com">naver.com</option>
								<option value="직접입력">직접입력</option>
							</select>
						</span>
						<div>
							<span id="emailMsg" class="checkMsg"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="hidden" id="birth" name="customerBirth">
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
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="hidden" id="customerAddress" name="customerAddress">
						<input type="text" id="address" class="address" readonly="readonly">
						<input type="text" id="postcode" name="customerPostcode" readonly="readonly">
						<button type="button" id="addressBtn">주소찾기</button>
						<div>
							<span id="addressMsg" class="checkMsg"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td>
						<input type="text" id="addressDetail" class="address">
						<div>
							<span id="addressDetailMsg" class="checkMsg"></span>
						</div>
					</td>
				</tr>
			</table>
			
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
			
			<button type="button" id="insertBtn">가입하기</button>
		</form>
	</div>
	<div>
		이미 회원이신가요?
		<a href="${pageContext.request.contextPath}/login">로그인하기</a>
	</div>
</body>
</html>