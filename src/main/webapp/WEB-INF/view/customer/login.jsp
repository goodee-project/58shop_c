<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	.loginMsg {
		color:#FF3300;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		
		$('#id').focus();

		$('#loginBtn').click(function() {
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
				$('#loginForm').submit();
			}
		});
		
	});
</script>

</head>
<body>
	<form action="${pageContext.request.contextPath}/login" method="post" id="loginForm">
		<div>
			<table>
				<tr>
					<td>ID</td>
					<td>
						<input type="text" id="loginId" name="customerId">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<span id="idMsg" class="loginMsg"></span>
					</td>
				</tr>
				<tr>
					<td>PASSWORD</td>
					<td>
						<input type="password" id="loginPw" name="customerPw">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<span id="pwMsg" class="loginMsg"></span>
					</td>
				</tr>
			</table>
		</div>
		<button type="button" id="loginBtn">login</button>
	</form>
	<div>
		아직 회원이 아니신가요?
		<a href="${pageContext.request.contextPath}/signup">회원가입</a>
	</div>
</body>
</html>