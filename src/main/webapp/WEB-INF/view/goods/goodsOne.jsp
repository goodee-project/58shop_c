<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		
		// 선택옵션 존재할 때
		$('#selectOption').change(function() {
			$('#goodsOptionNo').val($('#selectOption').val());
			let optionNo=Number($('#selectOption').val());
			let checkStock=Number($('#option'+optionNo).val());
			//console.log(checkStock);
			$('#optionStock').data('stock', checkStock);
		});
		
		// 선택옵션 없을 때
		let optionNo=$('#oneOption').val();
		//console.log(optionNo);
		if(optionNo) {
			$('#goodsOptionNo').val(optionNo);
		}
		
		// 수량
		$('#cartQuantity').val($('#quantity').val());
		$('#quantity').change(function() {
			$('#cartQuantity').val($('#quantity').val());
		});
		
		$('#cartBtn').click(function() {
			let check=0; // check == 2 일 때 submit
			console.log($('#optionStock').data('stock'));
			
			// 재고 확인
			let stock=0;
			let optionStock=$('#optionStock').data('stock'); //옵션이 있을 때
			let oneStock=$('#oneStock').val(); //옵션이 없을 때
			let quantity=Number($('#quantity').val());
			//console.log('oneStock: '+oneStock);
			//console.log('optionStock: '+optionStock);
			if(typeof optionStock == "undefined") {
				stock=Number(oneStock);
			} else {
				stock=Number(optionStock);
			}
			
			if(quantity > stock) {
				alert('재고가 부족합니다. '+stock+'개 이하로 담아주세요.');
				$('#quantity').val(stock);
				$('#cartQuantity').val(stock);
				return true;
			} else if(quantity == null || quantity == 0) {
				alert('수량을 1개 이상 선택하세요');
				$('#quantity').val(1);
				$('#cartQuantity').val(1);
				return true;
			} else {
				++check;
			}
			
			// 옵션확인
			let optionCheck=$('#goodsOptionNo').val();
			if(!optionCheck || optionCheck == '선택') {
				alert('옵션을 선택하세요');
			} else {
				++check;
			}
			console.log('옵션번호: '+$('#goodsOptionNo').val());
			console.log('선택수량: '+$('#cartQuantity').val());
			
			// check == 2 일 때 submit
			if(check == 2) {
				console.log('장바구니담기완료');
				$('#cartForm').submit();
				return true;
			}
			
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
					<img src="${pageContext.request.contextPath}/upload/goodsImg/${g.goodsImgOriginName}" width="300" height="300">
				</td>
				<td>
					<div>
						${g.goodsName}
					</div>
					<div>
						<a href="${pageContext.request.contextPath}/goods/goodsCompany?companyId=${g.companyId}">
							${g.companyName}
						</a>
					</div>
					<div>
						${g.goodsPrice}원
					</div>
					
					<c:choose>
						<c:when test="${g.quantitySum > 0}">
						
							<c:choose>	
								<c:when test="${fn:length(goodsOption) > 1}"><!-- 옵션이 2개 이상일 때 -->
									<select id="selectOption">
										<option>선택</option>
										<c:forEach var="i" items="${goodsOption}">
											<option value="${i.goodsOptionNo}">${i.goodsOptionContent} [재고:${i.goodsOptionQuantity}]</option>
										</c:forEach>
									</select>
									<span id="optionStock"></span>
									<c:forEach var="j" items="${goodsOption}"> <!-- 옵션 수량 확인하기 -->
										<input id="option${j.goodsOptionNo}" type="hidden" value="${j.goodsOptionQuantity}">
									</c:forEach>
								</c:when>
								<c:when test="${fn:length(goodsOption) == 1}"><!-- 옵션이 하나뿐일 때 -->
									<c:forEach var="s" items="${goodsOption}">
										<input type="hidden" id="oneOption" value="${s.goodsOptionNo}">
										<input type="hidden" id="oneStock" value="${s.goodsOptionQuantity}">
									</c:forEach>
								</c:when>
							</c:choose>
							<div>
								<input type="number" id="quantity" value=1>
							</div>
							<div>
								<button type="button" id="cartBtn">장바구니 담기</button>
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<input type="number" value="0" readonly="readonly">
							</div>
							<div>
								<button type="button">품절</button>
							</div>
						</c:otherwise>
					
					</c:choose>
					
				</td>
			</tr>
		</table>
		<form action="${pageContext.request.contextPath}/insertCart" method="get" id="cartForm">
			<input type="hidden" id="cartQuantity" name="cartQuantity">
			<input type="hidden" id="goodsOptionNo" name="goodsOptionNo">
		</form>
	</div>
	</c:forEach>
</body>
</html>