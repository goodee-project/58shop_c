<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<aside class="col-lg-3" id="sidebar">
		<div style="position: relative; z-index: 8;">
			<nav class="custom-menu">
			<ul>
				
				<li>
					<a href="${pageContext.request.contextPath}/goods/category?typeNo=1">Beauty</a>
					<ul>
						<li>
							<a href="${pageContext.request.contextPath}/goods/category?typeNo=2">Perfume</a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=3">Woman</a></li>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=4">Man</a></li>
							</ul>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/goods/category?typeNo=5">Hair/Body</a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=6">HairShampoo/Conditioner</a></li>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=7">BodyWash/Lotion</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/goods/category?typeNo=8">Fashion</a>
					<ul>
						<li>
							<a href="${pageContext.request.contextPath}/goods/category?typeNo=9">Woman</a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=10">Outer</a></li>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=11">Top</a></li>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=12">Bottom</a></li>
							</ul>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/goods/category?typeNo=13">Man</a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=14">Outer</a></li>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=15">Top</a></li>
								<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=16">Bottom</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/goods/category?typeNo=17">Market</a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=18">Fresh</a></li>
						<li><a href="${pageContext.request.contextPath}/goods/category?typeNo=19">Meal Kit</a></li>
					</ul>
				</li>
			</ul>
			</nav>
		</div>
		<!--/sticky -->
</aside>
<!--/aside -->