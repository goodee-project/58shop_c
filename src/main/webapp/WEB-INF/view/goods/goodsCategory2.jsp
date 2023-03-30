<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	$(function() {
		
		// controller에서 넘어온 옵션값 선택하기
		if($('input[name=keyword]').val() != 'new') {
			let defaultWord=$('input[name=keyword]').val();
			$('#selectOption').val(defaultWord);
		}
		
		// 정렬옵션값 변수에 넣어서 폼으로 넘기기
		$('#selectOption').change(function() {
			let option=$(this).val();
			$('input[name=keyword]').val(option);
			$('#goodsCompanyForm').submit();
		});
		
		// 검색값 변수에 넣어서 폼으로 넘기기(버튼클릭이벤트)
		$('#searchBtn').click(function() {
			let clickSearch=$('#searchword').val();
			$('input[name=searchword]').val(clickSearch);
			$('#goodsCompanyForm').submit();
		});
		
		// 검색값 변수에 넣어서 폼으로 넘기기(엔터키이벤트)
		$('#searchword').keydown(function(key) {
			if(key.keyCode && key.keyCode == 13) {
				let enterSearch=$('#searchword').val();
				$('input[name=searchword]').val(enterSearch);
				$('#goodsCompanyForm').submit();
			}
		});	
	});
</script>
<body>
	<form action="${pageContext.request.contextPath}/goods/goodsCompany" method="get" id="goodsCompanyForm">
		<input type="hidden" name="searchword" value="${searchword}">
		<input type="hidden" name="keyword" value="${keyword}">
		<input type="hidden" name="companyId" value="${companyId}">
	</form>
	<c:forEach var="n" items="${selectGoodsCompany}" begin="0" end="0">
		<h3>${n.companyName}</h3>
	</c:forEach>
	<div>
		<input type="text" id="searchword" value="${searchword}">
		<button type="button" id="searchBtn">검색</button>
	</div>
	<div>
		<select id="selectOption">
			<option value="new">신상품순</option>
			<option value="high">높은가격순</option>
			<option value="low">낮은가격순</option>
		</select>
	</div>
	<table>
		<c:forEach var="c" items="${selectGoodsCompany}">
			<tr>
				<td>
					<a href="${pageContext.request.contextPath}/goods/goodsOneCompany?companyId=${companyId}&goodsNo=${c.goodsNo}">
						<img src="${pageContext.request.contextPath}/upload/goodsImg/${c.goodsImgOriginName}" width="200" height="200">
					</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/goods/goodsOneCompany?companyId=${companyId}&goodsNo=${c.goodsNo}">
						${c.goodsName}
					</a>
				</td>
				
				<td>
					<c:choose>
						<c:when test="${c.quantitySum == '0'}">
							품절
						</c:when>
						<c:otherwise>
							${c.goodsPrice}원
						</c:otherwise>
					</c:choose>
				
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>