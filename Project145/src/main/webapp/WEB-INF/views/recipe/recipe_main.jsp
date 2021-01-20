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
					<a href="#"><h1>👀맛난 레시피 보자 보자 어디 보자! 👀<h1></a>
					<p>요즘, 이거 안 만들어본 사람 있나?</p>
				</div>
			</div>
		</div>

		<div class="row">
		<!-- 레시피리스트 데이터 -->
			<c:forEach var="" items="">
				<div class="col-xl-4 col-lg-6 col-md-6">
					<div class="single-product">
						<div class="product-img">
							<a href="/lessonProduct.do"> <img
								src="/resources/assets/images/product/l-product-1.jpg" alt="">
							</a>
							<div class="product-action">
								<a href="javascript:void(0)"><i class="lni lni-heart"></i></a> <a
									href="javascript:void(0)" class="share"><i
									class="lni lni-share"></i></a>
							</div>
						</div>
						<div class="product-content">
							<input type="hidden" value="레시피아이디">
							<h3 class="name">
								<a href="product-details.html">레시피제목 R_TITLE</a>
							</h3>
							<span class="update">레시피내용 R_CONTENT</span>
							<ul class="address">
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> </a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i>타입 R_TYPE</a></li>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>
			
			<div class="col-xl-4 col-lg-6 col-md-6">
				<div class="single-product">
					<div class="product-img">
						<a href="product-details.html"> <img
							src="/resources/assets/images/product/l-product-2.jpg" alt="">
						</a>
						<div class="product-action">
							<a href="javascript:void(0)"><i class="lni lni-heart"></i></a> <a
								href="javascript:void(0)" class="share"><i
								class="lni lni-share"></i></a>
						</div>
					</div>

					<div class="product-content">
						<h3 class="name">
							<a href="product-details.html">Apple MacBook Air</a>
						</h3>
						<span class="update">Last Update: 5 hours ago</span>
						<ul class="address">
							<li><a href="javascript:void(0)"><i
									class="lni lni-calendar"></i> 20 June, 2023</a></li>
							<li><a href="javascript:void(0)"><i
									class="lni lni-map-marker"></i> Canada</a></li>
							<li><a href="javascript:void(0)"><i class="lni lni-user"></i>
									Stifen Jon</a></li>
							<li><a href="javascript:void(0)"><i
									class="lni lni-package"></i> Used</a></li>
						</ul>
						<div class="product-bottom">
							<h3 class="price">$420.99</h3>
							<a href="javascript:void(0)" class="link-ad"><i
								class="lni lni-checkmark-circle"></i> Verified Ad</a>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xl-4 col-lg-6 col-md-6">
				<div class="single-product">
					<div class="product-img">
						<a href="product-details.html"> <img
							src="/resources/assets/images/product/l-product-3.jpg" alt="">
						</a>
						<div class="product-action">
							<a href="javascript:void(0)"><i class="lni lni-heart"></i></a> <a
								href="javascript:void(0)" class="share"><i
								class="lni lni-share"></i></a>
						</div>
					</div>

					<div class="product-content">
						<h3 class="name">
							<a href="product-details.html">Cctv camera</a>
						</h3>
						<span class="update">Last Update: 5 hours ago</span>
						<ul class="address">
							<li><a href="javascript:void(0)"><i
									class="lni lni-calendar"></i> 20 June, 2023</a></li>
							<li><a href="javascript:void(0)"><i
									class="lni lni-map-marker"></i> Canada</a></li>
							<li><a href="javascript:void(0)"><i class="lni lni-user"></i>
									Stifen Jon</a></li>
							<li><a href="javascript:void(0)"><i
									class="lni lni-package"></i> Used</a></li>
						</ul>
						<div class="product-bottom">
							<h3 class="price">$80.99</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>