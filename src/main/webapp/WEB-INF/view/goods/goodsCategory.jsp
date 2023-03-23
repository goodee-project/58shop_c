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
		function wordAction(keyword, searchword) {
			location.href='${pageContext.request.contextPath}/goods/category?typeNo='+$('#typeNo').val()+'&keyword='+keyword+'&searchword='+searchword;
		}
		
		// 조건별 정렬 & 상품이름 검색
		$(function() {	
			let selectedValue=$('#selectedValue').val();
			let hiddenword=$('#hiddenword').val();
			let keyword;
			let searchword;
			if(selectedValue) {
				$('#keyword').val(selectedValue);
			}
			if(hiddenword) {
				$('#searchword').val(hiddenword);
			}
			
			// 정렬값 변경
			$('#keyword').change(function() {
				keyword=$(this).val();
				searchword=$('#searchword').val();
				wordAction(keyword, searchword);
			});
			
			// 검색(검색버튼이벤트)
			$('#searchBtn').click(function() {
				searchword=$('#searchword').val();
				keyword=$('#keyword').val();
				wordAction(keyword, searchword);
			});
			
			// 검색(엔터키이벤트)
			$('#searchword').keydown(function(key) {
				if(key.keyCode && key.keyCode == 13) { // 키코드 13은 엔터키
					searchword=$('#searchword').val();
					keyword=$('#keyword').val();
					wordAction(keyword, searchword);
				}
			});
		});
	</script>
<body>
	<c:forEach var="cn" items="${categoryName}">
		<h3>
			${cn.typeContent}
			<c:if test="${cn.parent != ''}">
				(${cn.parent})
			</c:if>
		</h3>
		<div>${cn.typeName}</div>
	</c:forEach>
	<div>
		<input type="text" name="searchword" id="searchword">
		<input type="hidden" id="hiddenword" value="${searchword}">
		<button type="button" id="searchBtn">검색</button>
	</div>
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
		<c:forEach var="i" items="${selectGoodsCategory}">
			<tr>
				<td>
					<a href="${pageContext.request.contextPath}/goods/goodsOne?goodsNo=${i.goodsNo}">
						<img src="${pageContext.request.contextPath}/upload/goodsImg/${i.goodsImgOriginName}" width="70" height="70">
					</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/goods/goodsOne?goodsNo=${i.goodsNo}">
						${i.goodsName}
					</a>		
				</td>
				<td>${i.goodsPrice}</td>
				<td>
					<a href="${pageContext.request.contextPath}/goods/goodsCompany?companyId=${i.companyId}">${i.companyName}</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>