<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	$(function() {
		// 문자열로 받아온 옵션값과 옵션재고값 쉼표 기준으로 자르기
		let optionStr=$('#optionStr').val();
		let optionList=optionStr.split(',');
		let optionNoStr=$('#optionNoStr').val();
		let optionNoList=optionNoStr.split(',');
		let quantityStr=$('#quantityStr').val();
		let quantityList=quantityStr.split(',');
		//console.log('quantityList: '+quantityList[0]);
		
		// select 태그에 option 넣기
		for(let count=0; count < optionList.length; ++count) {
			let option = $('<option value="'+count+'">'+optionList[count]+' [재고'+quantityList[count]+']'+'</option>');
			$('#selectOption').append(option);
		}
		
		let stock=0;
		let goodsNo='';
		let quantity=$('#selectQuantity').val();
		let selectOptionNo=0;
		
		// 옵션이 없을 때
		if(optionStr == '') { 
			$('#goodsOptionNo').val(optionNoStr);
			quantity=quantityStr; // 수량
			goodsNo=optionNoStr; // 상품번호
			stock=Number(quantityStr); // 재고
			console.log('quantity: '+quantity);
			console.log('optionNoStr: '+optionNoStr);
		}
		
		// 선택옵션이 있을 때
		$('#selectOption').change(function() {
			if($('#selectOption').val() == '') { // 옵션선택을 안했을 때
				goodsNo=0;
				return true;
			}
			selectOptionNo=Number($('#selectOption').val()); // 선택된 옵션값으로 상품번호를 찾는다
			console.log('selectOptionNo:'+selectOptionNo);
			goodsNo=optionNoList[selectOptionNo]; // 상품번호
			stock=Number(quantityList[selectOptionNo]); // 상품의 재고
			console.log('goodsNo:'+goodsNo);
			console.log('stock:'+stock);
			
		});
		
		$('#selectQuantity').change(function() {
			let selectQuantity=$(this).val();
			quantity=selectQuantity;
			console.log(quantity);
		});

		//console.log('quantity :'+quantity);
		//console.log('goodsNo :'+goodsNo);
		
		$('#cartBtn').click(function() {
			// 폼으로 넘길 변수에 값 넣기
			$('input[name=cartQuantity]').val(Number(quantity)); // 수량
			$('input[name=goodsOptionNo]').val(Number(goodsNo)); // 상품번호
			let ckQuantity=$('input[name=cartQuantity]').val();
			let ckOption=$('input[name=goodsOptionNo]').val();
			console.log('수량:'+ckQuantity+'/상품번호:'+ckOption);
			
			// 옵션&수량체크
			if(ckOption == 0) {
				alert('옵션을 선택하세요');
				return true;
			} else if(ckOption > 0 && ckQuantity > stock) {
				alert('재고가 부족합니다. '+stock+'개 이하로 담아주세요.');
				quantity=stock;
				$('input[name=cartQuantity]').val(stock);
				$('#selectQuantity').val(stock);
				return true;
			} else if(ckOption > 0 && ckQuantity == 0) {
				alert('수량은 1개 이상 선택해주세요.');
				quantity=1;
				$('input[name=cartQuantity]').val(1);
				$('#selectQuantity').val(1);
				return true;
			} else {
				console.log('장바구니담기완료');
				$('#cartForm').submit();
			}
		})
		
	});

</script>
</head>
<body>
	<input type="hidden" id="optionStr" value="${goodsOne.goodsOptionContent}">
	<input type="hidden" id="optionNoStr" value="${goodsOne.goodsOptionNo}">
	<input type="hidden" id="quantityStr" value="${goodsOne.goodsOptionQuantity}">
	<table>
		<tr>
			<td>
				<img src="${pageContext.request.contextPath}/upload/goodsImg/${goodsOne.goodsImgOriginName}" width="300" height="300">
			</td>
			<td>
				${goodsOne.goodsName}
				<div>
					${goodsOne.goodsPrice}원
				</div>
				<c:if test="${goodsOne.goodsOptionContent ne ''}">
					<div>
						<select id="selectOption">
							<option value="">선택</option>	
						</select>
					</div>
				</c:if>
				<div>
					<input type="number" id="selectQuantity" value="1">
				</div>
				<div>
					<button type="button" id="cartBtn">장바구니 담기</button>
				</div>
			</td>
		</tr>
	</table>
	<form action="${pageContext.request.contextPath}/insertCart" method="get" id="cartForm">
		<input type="hidden" name="goodsOptionNo">
		<input type="hidden" name="cartQuantity">
	</form>
</body>
</html>