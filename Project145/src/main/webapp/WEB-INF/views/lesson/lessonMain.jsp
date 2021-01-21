<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lessonMain.jsp</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="mx-auto">
				<div class="text-left section-title mb-60">
					<a href="#"><h1>클래스를 들어봅시다 📢</h1></a>
					<p>요즘, 이거 못하는 사람 있나?</p>
				</div>
			</div>
		</div>

		<div class="row">
			<!-- 클래스리스트 시작 -->
			<c:forEach var="lesson" items="${lessons }">
				<div class="col-xl-4 col-lg-6 col-md-6">
					<input type="hidden" value="${lesson.getCId() }">
					<div class="single-product">
						<div class="product-img">
							<a href="/lessonProduct.do?cId=${lesson.getCId() }"> <img
								src="/images/${lesson.getCImg() }" width="150" height="250">
							</a>
							<div class="product-action">
								<a href="javascript:void(0)"><i class="lni lni-heart"></i></a> <a
									href="javascript:void(0)" class="share"><i
									class="lni lni-share"></i></a>
							</div>
						</div>
						<div class="product-content">
							<input type="hidden" value="클래스아이디">
							<h3 class="name">
								<a href="product-details.html">${lesson.getCTitle() }</a>
							</h3>
							<span class="update">${lesson.getCDesc() }</span>
							<ul class="address">
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> ${lesson.getLecName() }</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> ${lesson.getCHit() }</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-calendar"></i> ${lesson.getCEnd() }</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-map-marker"></i> ${lesson.getVegType() }</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">${lesson.getCPrice() }원</h3>
								<a href="javascript:void(0)" class="link-ad">좋아요</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- 클래스리스트 카드 끝 -->


		</div>
	</div>
</body>
</html>