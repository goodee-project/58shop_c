<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	.loginMsg {
		color:red;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		let loginMsgCheck=0;
		
		$('#id').focus();

		$('#loginBtn').click(function() {
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
					++ loginMsgCheck;
					return false;
				} 
			});
			console.log('loginMsgCheck: '+loginMsgCheck);
			console.log('length: '+$('.loginMsg').length);
			
			if(loginMsgCheck == $('.loginMsg').length) { // loginMsgCheck의 길이와 loginMsg class개체 개수와 같으면 submit
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
						<input type="text" id="loginId" name="loginId">
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
						<input type="password" id="loginPw" name="loginPw">
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
</body>
</html>