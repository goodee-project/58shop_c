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
		function keywordAction(keyword) {
			location.href='${pageContext.request.contextPath}/goods/category?typeNo='+$('#typeNo').val()+'&keyword='+keyword;
		}
		
		$(function() {	
			let selectedValue=$('#selectedValue').val();
			if(selectedValue) {
				$('#keyword').val(selectedValue);
			}
			$('#keyword').change(function() {
				let keyword=$(this).val();
				keywordAction(keyword);
			});
		});
	</script>
<body>
	<div>
		<input type="hidden" id="typeNo" value="${typeNo}">
		<input type="hidden" id="selectedValue" value="${keyword}">
		<select id="keyword">
			<option value="new">신상품순</option>
			<option value="low">낮은가격순</option>
			<option value="high">높은가격순</option>
		</select>
	
	</div>

	<table>
		<tr>
			<th>상품카테고리</th>
			<th>상품명</th>
			<th>상품가격</th>
			<th>업체명</th>
		</tr>
		<c:forEach var="i" items="${selectGoodsCategory}">
			<tr>
				<td>${i.typeContent}</td>
				<td>${i.goodsName}</td>
				<td>${i.goodsPrice}</td>
				<td>${i.companyId}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>