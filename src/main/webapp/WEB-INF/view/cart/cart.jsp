<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<!--  장바구니에 상품 없을때 -->
	<div>
		<c:if test="${empty productList && empty list}">
			장바구니에 담긴 상품이 없습니다.
			<div>
				<a href="${pageContext.request.contextPath}/home/main">상품추가 하러가기</a>
			</div>
		</c:if>
	</div>
	
	<!-- 회원 장바구니 리스트 -->
	<c:if test="${not empty list}">
		<table>
			<thead>
				<tr>
					<td>상품번호</td>
					<td>업체명</td>
					<td>이미지</td>
					<td>상품명</td>
					<td>수량</td>
					<td>가격</td>
					<td>삭제</td>
				</tr>		
			</thead>
			<tbody>
				<c:forEach var="1" items="${list}">
				<tr>
					<td>${l.goodsNo}</td>
					<td>${l.companyName}</td>
					<td>
						<img src="${pageContext.request.contextPath}/upload/${l.goodsImgSaveName}" width="80" height="80">
					</td>
					<td>${l.goodsName}</td>
					<td>
						<form action="${pageContext.request.contextPath}/">
							<input type="hidden" name="goodsNo" value="${l.goodsNo}">
							<div>
								<input type="text" name="cartQuantity" value="${l.cartQuantity}">					
							</div>
							<button type="submit">수정</button>
						</form>
					</td>
					<td><fmt:formatNumber value="${l.goodsPrice}" pattern="#,###"/>원</td>
					<td>
	                  <a href="${pageContext.request.contextPath}/customer/customerCartRemove?goodsNo=${l.goodsNo}"></a>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td >총수량 : ${o.sumQuantity}개</td>
					<td colspan="2">총가격 : <fmt:formatNumber value="${p.sumPrice}" pattern="#,###"/>원</td>
				</tr>	
			</tbody>
		</table>
		<div>
			<a href="${pageContext.request.contextPath}/customer/customerCartOrder" >주문하기</a>
			<a href="${pageContext.request.contextPath}/home/main">상품추가</a>	
		</div>
	</c:if>
	
	
</body>
</html>