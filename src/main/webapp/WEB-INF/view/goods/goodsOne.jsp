<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
  		-webkit-appearance: none;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	$(function() {
		
		$('#selectOption').change(function() {
			$('#goodsOptionNo').val($('#selectOption').val());
		});
		
		$('#quantity').change(function() {
			$('#cartQuantity').val($('#quantity').val());
		});
		
		$('#cartBtn').click(function() {
			console.log('옵션번호: '+$('#goodsOptionNo').val());
			console.log('선택수량: '+$('#cartQuantity').val());
			
			// 재고 확인
			let quantity=Number($('#quantity').val());
			let stock=Number($('#stock').val());
			if(quantity > stock) {
				alert('재고가 부족합니다. '+stock+'개 이하로 담아주세요.');
				$('#quantity').val(stock);
			}
			
			//$('#cartForm').submit();
		});
	});
</script>

</head>
<body>
	<c:forEach var="g" items="${goodsOne}">
	<div>
		<h4>${g.goodsName}</h4>
	</div>
	<div>
		<table>
			<tr>
				<td>
					<img src="${pageContext.request.contextPath}/upload/goodsImg/${g.goodsImgOriginName}" width="150" height="150">
				</td>
			</tr>
			<tr>
				<td>${g.companyName}</td>
				<td>${g.goodsPrice}원</td>
				<td>
					<select id="selectOption">
						<option>선택</option>
						<c:forEach var="i" items="${goodsOption}">
							<option value="${i.goodsOptionNo}">${i.goodsOptionContent} [재고:${i.goodsOptionQuantity}]</option>
						</c:forEach>
					</select>
					<c:forEach var="s" items="${goodsOption}">
						<input type="hidden" id="stock" value="${s.goodsOptionQuantity}">
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td>
					<span>수량:</span>
					<input type="number" id="quantity">
				</td>
			</tr>
		</table>
		<form action="${pageContext.request.contextPath}/insertCart" method="get" id="cartForm">
			<input type="hidden" id="cartQuantity">
			<input type="hidden" id="goodsOptionNo">
			<button type="button" id="cartBtn">장바구니 담기</button>
		</form>
	</div>
	</c:forEach>
</body>
</html>