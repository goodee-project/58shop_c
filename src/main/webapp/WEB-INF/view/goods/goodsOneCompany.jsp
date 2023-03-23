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
		for(var count=0; count < optionList.length; ++count) {
			let option = $('<option value="'+count+'">'+optionList[count]+' [재고'+quantityList[count]+']'+'</option>');
			$('#selectOption').append(option);
		}
		
		let quantity;
		
		// 옵션이 없을 때
		if(optionStr == '') {
			$('#goodsOptionNo').val(optionNoStr);
			quantity=quantityStr;
			console.log('quantity: '+quantity);
			console.log('optionNoStr: '+optionNoStr);
		}
		
		// 선택옵션이 있을 때
		$('#selectOption').change(function() {
			let selectOptionNo=Number($('#selectOption').val());
			//console.log(selectOptionNo);
			$('#goodsOptionNo').val(selectOptionNo);
			quantity=quantityList[selectOptionNo];
			console.log(quantity);
		});
		
		$('#selectQuantity').change(function() {
			$('#cartQuantity').val($(this).val());
		});
		
		$('#cartBtn').click(function() {
			let chk=$('#cartQuantity').val();
			let chk2=$('#goodsOptionNo').val();
			console.log(chk);
			console.log(chk2);
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
				<span>${goodsOne.goodsName}</span>
				<span>${goodsOne.goodsPrice}원</span>
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
	<form action="${pageContext.request.contextPath}/insertCart" method="get">
		<input type="hidden" name="goodsOptionNo">
		<input type="hidden" name="cartQuantity">
	</form>
</body>
</html>