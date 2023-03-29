<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		
		<!-- jQuery -->
		<!-- CDN 주소 추가 방식 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>		
		
		<style>
			.img {
				width : 100px;
				height : 100px;
			}
		
		</style>		
		
		<script>
		
			$(function() {
				
				let customerPay = Number('<c:out value = "${cusMap.customerPay}"/>');	// 고객 보유 페이
				let customerPoint = Number('<c:out value = "${cusMap.customerPoint}"/>');	// 고객 보유 포인트
				let reward = Number('<c:out value = "${cusMap.reward}"/>');	// 등급할인
				let totalPrice = $('#totalPrice').val();	// 등급할인, 포인트 미적용
				
				
				// 포인트 블러 이벤트
				$('#usePoint').blur(function() {
					
					let pointCheck = false;
					
					let usePoint = Number($('#usePoint').val());	// 사용할 포인트
					
					if(0 <= usePoint && usePoint <= customerPoint) {
						
						
						if(usePoint <= totalPrice) {
							
							$('#finalPrice').val(parseInt((totalPrice - usePoint) * (100 - reward) / 100));
							
							console.log($('#finalPrice').val() + ' <-- finalPrice')
							
							pointCheck = true;
							
						} else {
							
							alert('사용할 수 있는 최대 포인트는 ' + totalPrice + ' 입니다.');
							$('#usePoint').val('');
							
						}
						
						
					} else {
						
						alert('올바른 사용 가능한 포인트를 적어주세요.(미사용시 0)');
						
						$('#usePoint').val('');
						
					}
					
					console.log(pointCheck)
					console.log(usePoint)
				
				
				});
				
				
			});		
		
		
		</script>
		
	</head>
	
	<body>
		<div>
			<h3>주문 폼</h3>
			
			<div>
				<form>
					<div>
						<h4>구매자 정보</h4>
						
						<div>
							<input type = "text" name = "customerName" value = "${cusMap.customerName }" readonly = "readonly">
						</div>
						
						<div>
							<input type = "text" name = "customerPhone" value = "${cusMap.customerPhone }" readonly = "readonly">
						</div>
						
						<div>
							<input type = "text" name = "customerEmail" value = "${cusMap.customerEmail }" readonly = "readonly">
						</div>
						
					</div>
					
					<div>
						<h4>배송지</h4>
						<div>
							<input type = "text" name = "customerAddressNo" value = "1" readonly = "readonly">customerAddressNo 임시
						</div>
												
					
						
					</div>
					
					
					<div>
						<h4>주문 정보</h4>
						
						<div>
							<table border = "1">
								<tr>
									<th>이미지</th>
									<th>상품명</th>
									<th>회사명</th>
									<th>가격</th>
									<th>옵션명</th>
									<th>수량</th>
								</tr>
							
								<c:forEach var="o" items="${orderInfoList }">
									<tr>
										<td>
											<img class = "img" src = "${pageContext.request.contextPath}/upload/goodsImg/${o.goodsImgSaveName }">
										</td>
										<td>${o.goodsName }</td>
										<td>${o.companyName }</td>
										<td>${o.goodsPrice}</td>
										<td>${o.goodsOptionContent }</td>
										<td>${o.goodsOrderQuantity }</td>
									</tr>
									
									<c:set var="totalPrice" value="${totalPrice = totalPrice + (o.goodsPrice * o.goodsOrderQuantity) }"></c:set>
									
								</c:forEach>
								
							</table>
						
						
						</div>
						
						
						<div>
							<h4>결제 정보</h4>
							
							<div>
								총 가격(등급할인, 포인트 미적용) :
								<c:out value="${totalPrice }"></c:out>
								<input type = "hidden" name = "totalPrice" id = "totalPrice" value = "${totalPrice }">
							</div>
						
							<div>
								보유 페이 : ${cusMap.customerPay }
							</div>
							
							<div>
								보유 포인트 : ${cusMap.customerPoint }
							</div>
						
						
							<div>
								사용할 포인트 : 
								<input type = "number" name = "usePoint" id = "usePoint" value = "0">
								
							</div>
						
							<div>
								등급 할인 : ${cusMap.reward } %
							</div>
						
							<div>
								총 결제 금액(포인트, 등급할인 적용) :
								<input type = "number" name = "finalPrice" id = "finalPrice" readonly = "readonly"> 
							</div>
						
						
						
						
						</div>
						
						
						
					
					</div>
					
					
					
					
					<button type = "submit">결제하기</button>
					
					
					
					
				</form>
				
				
			</div>
		
		</div>
		
	</body>
</html>