<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//핸드폰번호에는 숫자만 입력가능하게 하는 함수
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
	
	// 생일 숫자만 입력
	function handleOnInput3(el, maxlength) {
		  if(el.value.length > maxlength)  {
		    el.value=el.value.substr(0, maxlength);
		  }
	}
	
	$(document).ready(function() {
		let phoneNumber=0;
		let totalEmail;
		let totalAddress;
		let textCheck=0; 
		
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
		
		$('#insertBtn').click(function() {
			
			//
			
			
			
			// 전화번호 확인
			$('.phoneNum').each(function() {
				
				if($(this).val() == '') {
					$('#phoneMsg').text('전화번호를 입력하세요');
				} else {
					$('#phoneMsg').text('');
					phoneNumber = $($('.phoneNum')[0]).val()+'-'+$($('.phoneNum')[1]).val()+'-'+$($('.phoneNum')[2]).val();
					console.log(phoneNumber);
					$('#phone').val(phoneNumber);
					console.log('phoneNumber: '+$('#phone').val());
				}
			});
			
			// 이메일 확인
			
			
		});

	});
</script>
<body>
	<div>
		<form action="${pageContext.request.contextPath}/insertCustomer" method="post" id="insertForm">
			<table>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" id="id" name="customerId">
						<div>
							<span id="idMsg" class="checkMsg"></span>
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
					<td>이름</td>
					<td>
						<input type="text" id="name" name="customerName">
						<div>
							<span id="nameMsg" class="checkMsg"></span>
						</div>
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="gender" value="남">남
						<input type="radio" name="gender" value="여">여
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
						<input type="text" id="emailID">
						@
						<select	id="emailDomain">
							<option value="google.com">google.com</option>
							<option value="naver.com">naver.com</option>
							<option>직접입력</option>
						</select>
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
							<c:forEach var="i" begin="1940" end="2023">
								<option value="${2023-i+1940}">${2023-i+1940}</option>
							</c:forEach>
						</select>
						<select id="month">
							<c:forEach var="j" begin="1" end="12">
								<option value="${j}">${j}</option>
							</c:forEach>
						</select>					
						<input type="number" id="date" min="1" max="31" oninput="handleOnInput3(this, 2)">
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="hidden" id="customerAddress" name="customerAddress">
						<input type="text" id="address" class="address" readonly="readonly">
						<input type="text" id="postcode" name="postcode" readonly="readonly">
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
						<input type="checkbox" class="marketing" name="marketing" value="동의">동의
						<input type="checkbox" class="marketing" name="marketing" value="미동의">미동의
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
						<input type="checkbox" class="customerInfo" name="customerInfo" value="동의">동의
					</td>
				</tr>
			</table>
			
			<button type="button" id="insertBtn">가입하기</button>
		</form>
	</div>
</body>
</html>