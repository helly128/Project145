<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/assets/images/favicon.png"
	type="image/png">

<!--====== Animate CSS ======-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/animate.css">

<!--====== Tiny slider CSS ======-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/tiny-slider.css">

<!--====== glightbox CSS ======-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/glightbox.min.css">

<!--====== Line Icons CSS ======-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/LineIcons.2.0.css">

<!--====== Selectr CSS ======-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/selectr.css">

<!--====== Nouislider CSS ======-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/nouislider.css">

<!--====== Bootstrap CSS ======-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/bootstrap-5.0.5-alpha.min.css">

<!--====== Style CSS ======-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/style.css">
<title>Insert title here</title>

</head>
<body>

	<!--====== HEADER PART START ======-->

	<header class="header_area">
		<div id="header_navbar" class="header_navbar">
			<div class="container position-relative">
				<div class="row align-items-center">
					<div class="col-xl-12">
						<nav class="navbar navbar-expand-xl">
							<a class="navbar-brand" href="/main.do"> <img id="logo"
								src="<%=request.getContextPath()%>/resources/assets/images/logo/logo.svg"
								alt="Logo">
							</a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="toggler-icon"></span> <span class="toggler-icon"></span>
								<span class="toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse sub-menu-bar"
								id="navbarSupportedContent">
								<ul id="nav" class="navbar-nav">
									<li class="nav-item"><a class="page-scroll"
										href="/lessonMain.do">클래스</a></li>
									<li class="nav-item"><a class="page-scroll"
										href="/recipeMain.do">레시피 </a></li>
									<li class="nav-item"><a class="page-scroll"
										data-toggle="collapse" data-target="#sub-nav"
										aria-controls="sub-nav" aria-expanded="false"
										aria-label="Toggle navigation" href="javascript:void(0)">식당
											<div class="sub-nav-toggler">
												<span></span>
											</div>
									</a>
										<ul class="sub-menu collapse" id="sub-nav">
											<li><a href="category.html">Category Grid</a></li>
											<li><a href="category-list.html">Category List</a></li>
										</ul></li>
									<li class="nav-item"><a class="page-scroll"
										href="product-details.html">베지Meet</a></li>
								</ul>
							</div>
							<ul class="header-btn d-sm-flex">

								<c:if test="${mId eq null}">
									<li><a href="/loginForm.do"
										class="main-btn btn-hover d-none d-md-block">로그인</a></li>
								</c:if>
								<c:if test="${mId eq null}">
									<li><a href="/memberRegister.do"
										class="main-btn btn-hover d-none d-md-block">회원가입</a></li>
								</c:if>
								<c:if test="${mId ne null}">
									<li><a href="/logout.do"
										class="main-btn btn-hover d-none d-md-block">로그아웃</a></li>
								</c:if>
								<li><a href="/mypage.do" class="main-btn btn-hover d-none d-md-block"> <span
										class="d-md-none"><i class="lni lni-user"></i></span> <span
										class="d-none d-md-block">마이페이지테스트중</span>
								</a>
								<li><a href="/restBizList.do"
									class="main-btn btn-hover d-none d-md-block">사업자페이지</a></li>
							</ul>
						</nav>
						<!-- navbar -->
					</div>
				</div>
				<!-- row -->
			</div>
			<!-- container -->
		</div>
		<!-- header navbar -->
	</header>

	<!--====== HEADER PART ENDS ======-->

	<!--====== 메인배너부분 ======-->
	<section id="home" class="hero-area bg_cover">
		<div class="container">
			<div class="row">
				<div class="mx-auto col-lg-9 col-xl-9 col-md-10">
					<div class="text-center hero-content">
						<h1 class="mb-30 wow fadeInUp" data-wow-delay=".2s"
							style="color: black">다함께 건강하게, 채식 한 끼.</h1>
						<p class="wow fadeInUp" data-wow-delay=".4s" style="color: black">메인화면을
							잘 맹글어볼게유 흑흑</p>
						<a href="https://rebrand.ly/gg-classilist/" rel="nofollow"
							class="main-btn btn-hover">Purchase Now</a>

					</div>
				</div>
			</div>
		</div>
	</section>
	<!--======메인배너부분 END ======-->

	<!--====== SEARCH PART START ======-->
	<div class="search-area">
		<div class="container">
			<div class="search-wrapper">
				<form action="#">
					<div class="row justify-content-center">
						<div class="col-lg-4 col-sm-5 col-10">
							<div class="search-input">
								<label for="keyword"><i
									class="lni lni-search-alt theme-color"></i></label> <input type="text"
									name="keyword" id="keyword" placeholder="Product keyword">
							</div>
						</div>
						<div class="col-lg-3 col-sm-5 col-10">
							<div class="search-input">
								<label for="category"><i
									class="lni lni-grid-alt theme-color"></i></label> <select
									name="category" id="category">
									<option value="none" selected disabled>비건 레벨</option>
									<option value="none">비건</option>
									<option value="none">락토</option>
									<option value="none">오보</option>
									<option value="none">락토오보</option>
								</select>

							</div>
						</div>
						<div class="col-lg-3 col-sm-5 col-10">
							<div class="search-input">
								<label for="location"><i
									class="lni lni-map-marker theme-color"></i></label> <select
									name="location" id="location">
									<option value="none" selected disabled>Locations</option>
									<option value="none">수도권</option>
									<option value="none">강원</option>
									<option value="none">충남</option>
									<option value="none">충북</option>
									<option value="none">경상</option>
									<option value="none">경남</option>
									<option value="none">전북</option>
									<option value="none">전남</option>
								</select>
							</div>
						</div>
						<div class="col-lg-2 col-sm-5 col-10">
							<div class="search-btn">
								<button class="main-btn btn-hover">
									Search <i class="lni lni-search-alt"></i>
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--====== SEARCH PART END ======-->


	<!--====== 식당 섹션 ======-->
	<section class="latest-product-area pt-130 pb-80">
		<div class="container">
			<div class="row">
				<div class="mx-auto">
					<div class="text-left section-title mb-60">
						<a href="#"><h1>Popular Restaurant🥗</h1></a>
						<p>요즘,여기 모르는 사람 있나?</p>
					</div>
				</div>
			</div>

			<div class="row">

				<div class="col-xl-3 col-lg-6 col-md-6">
					<div class="single-product">
						<div class="product-img">
							<a href="product-details.html"> <img
								src="/resources/assets/images/product/l-product-1.jpg" alt="">
							</a>
							<div class="product-action">
								<a href="javascript:void(0)"><i class="lni lni-heart"></i></a> <a
									href="javascript:void(0)" class="share"><i
									class="lni lni-share"></i></a>
							</div>
						</div>

						<div class="product-content">
							<h3 class="name">
								<a href="product-details.html">Apple iPhone x</a>
							</h3>
							<span class="update">Last Update: 5 hours ago</span>
							<ul class="address">
								<li><a href="javascript:void(0)"><i
										class="lni lni-calendar"></i> 20 June, 2023</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-map-marker"></i> Canada</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> Used</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">$120.99</h3>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-lg-6 col-md-6">
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
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
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

				<div class="col-xl-3 col-lg-6 col-md-6">
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
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> Used</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">$80.99</h3>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-lg-6 col-md-6">
					<div class="single-product">
						<div class="product-img">
							<a href="product-details.html"> <img
								src="/resources/assets/images/product/l-product-1.jpg" alt="">
							</a>
							<div class="product-action">
								<a href="javascript:void(0)"><i class="lni lni-heart"></i></a> <a
									href="javascript:void(0)" class="share"><i
									class="lni lni-share"></i></a>
							</div>
						</div>

						<div class="product-content">
							<h3 class="name">
								<a href="product-details.html">Apple iPhone x</a>
							</h3>
							<span class="update">Last Update: 5 hours ago</span>
							<ul class="address">
								<li><a href="javascript:void(0)"><i
										class="lni lni-calendar"></i> 20 June, 2023</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-map-marker"></i> Canada</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> Used</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">$120.99</h3>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!--====== 식당 섹션 끝 ======-->

	<!--====== 레시피 섹션 시작 ======-->
	<section class="latest-product-area pt-100 pb-80">
		<div class="container">
			<div class="row">
				<div class="mx-auto">
					<div class="text-left section-title mb-60">
						<a href="#"><h1>Popular Receipe🥪</h1></a>
						<p>요즘,이거 안 만들어 본 사람 있나?
						<p>
					</div>
				</div>
			</div>

			<div class="row">

				<div class="col-xl-3 col-lg-6 col-md-6">
					<div class="single-product">
						<div class="product-img">
							<a href="product-details.html"> <img
								src="/resources/assets/images/product/l-product-1.jpg" alt="">
							</a>
							<div class="product-action">
								<a href="javascript:void(0)"><i class="lni lni-heart"></i></a> <a
									href="javascript:void(0)" class="share"><i
									class="lni lni-share"></i></a>
							</div>
						</div>

						<div class="product-content">
							<h3 class="name">
								<a href="product-details.html">Apple iPhone x</a>
							</h3>
							<span class="update">Last Update: 5 hours ago</span>
							<ul class="address">
								<li><a href="javascript:void(0)"><i
										class="lni lni-calendar"></i> 20 June, 2023</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-map-marker"></i> Canada</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> Used</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">$120.99</h3>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-lg-6 col-md-6">
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
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
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

				<div class="col-xl-3 col-lg-6 col-md-6">
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
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> Used</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">$80.99</h3>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-lg-6 col-md-6">
					<div class="single-product">
						<div class="product-img">
							<a href="product-details.html"> <img
								src="/resources/assets/images/product/l-product-1.jpg" alt="">
							</a>
							<div class="product-action">
								<a href="javascript:void(0)"><i class="lni lni-heart"></i></a> <a
									href="javascript:void(0)" class="share"><i
									class="lni lni-share"></i></a>
							</div>
						</div>

						<div class="product-content">
							<h3 class="name">
								<a href="product-details.html">Apple iPhone x</a>
							</h3>
							<span class="update">Last Update: 5 hours ago</span>
							<ul class="address">
								<li><a href="javascript:void(0)"><i
										class="lni lni-calendar"></i> 20 June, 2023</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-map-marker"></i> Canada</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> Used</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">$120.99</h3>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</section>
	<!--====== 레시피 섹션 끝 ======-->



	<!--====== 클래스 섹션 ======-->
	<section class="latest-product-area pt-100 pb-80">
		<div class="container">
			<div class="row">
				<div class="mx-auto">
					<div class="text-left section-title mb-60">
						<a href="#"><h1>Popular Class👀</h1></a>
						<p>요즘,이거 안 들어 본 사람 있나?
						<p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-3 col-lg-6 col-md-6">
					<div class="single-product">
						<div class="product-img">
							<a href="product-details.html"> <img
								src="/resources/assets/images/product/l-product-1.jpg" alt="">
							</a>
							<div class="product-action">
								<a href="javascript:void(0)"><i class="lni lni-heart"></i></a> <a
									href="javascript:void(0)" class="share"><i
									class="lni lni-share"></i></a>
							</div>
						</div>

						<div class="product-content">
							<h3 class="name">
								<a href="product-details.html">Apple iPhone x</a>
							</h3>
							<span class="update">Last Update: 5 hours ago</span>
							<ul class="address">
								<li><a href="javascript:void(0)"><i
										class="lni lni-calendar"></i> 20 June, 2023</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-map-marker"></i> Canada</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> Used</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">$120.99</h3>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-lg-6 col-md-6">
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
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
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

				<div class="col-xl-3 col-lg-6 col-md-6">
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
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> Used</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">$80.99</h3>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-xl-3 col-lg-6 col-md-6">
					<div class="single-product">
						<div class="product-img">
							<a href="product-details.html"> <img
								src="/resources/assets/images/product/l-product-1.jpg" alt="">
							</a>
							<div class="product-action">
								<a href="javascript:void(0)"><i class="lni lni-heart"></i></a> <a
									href="javascript:void(0)" class="share"><i
									class="lni lni-share"></i></a>
							</div>
						</div>

						<div class="product-content">
							<h3 class="name">
								<a href="product-details.html">Apple iPhone x</a>
							</h3>
							<span class="update">Last Update: 5 hours ago</span>
							<ul class="address">
								<li><a href="javascript:void(0)"><i
										class="lni lni-calendar"></i> 20 June, 2023</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-map-marker"></i> Canada</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> Used</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">$120.99</h3>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	<!--====== 클래스 섹션 끝 ======-->



	<!--====== 베지meet섹션 시작 ======-->
	<section class="latest-product-area pt-100 pb-110">
		<div class="container">
			<div class="row">
				<div class="mx-auto">
					<div class="text-left section-title mb-60">
						<a href="#"><h1>Popular 베지Meet🙌</h1></a>
						<p>요즘,여기서 안 만나 본 사람 있나?
						<p>
					</div>
				</div>
			</div>

			<div class="row">

				<div class="col-xl-3 col-lg-6 col-md-6">
					<div class="single-product">
						<div class="product-img">
							<a href="product-details.html"> <img
								src="/resources/assets/images/product/l-product-1.jpg" alt="">
							</a>
							<div class="product-action">
								<a href="javascript:void(0)"><i class="lni lni-heart"></i></a> <a
									href="javascript:void(0)" class="share"><i
									class="lni lni-share"></i></a>
							</div>
						</div>

						<div class="product-content">
							<h3 class="name">
								<a href="product-details.html">Apple iPhone x</a>
							</h3>
							<span class="update">Last Update: 5 hours ago</span>
							<ul class="address">
								<li><a href="javascript:void(0)"><i
										class="lni lni-calendar"></i> 20 June, 2023</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-map-marker"></i> Canada</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> Used</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">$120.99</h3>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xl-3 col-lg-6 col-md-6">
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
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
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

				<div class="col-xl-3 col-lg-6 col-md-6">
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
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> Used</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">$80.99</h3>
							</div>
						</div>
					</div>
				</div>

<div class="col-xl-3 col-lg-6 col-md-6">
					<div class="single-product">
						<div class="product-img">
							<a href="product-details.html"> <img
								src="/resources/assets/images/product/l-product-1.jpg" alt="">
							</a>
							<div class="product-action">
								<a href="javascript:void(0)"><i class="lni lni-heart"></i></a> <a
									href="javascript:void(0)" class="share"><i
									class="lni lni-share"></i></a>
							</div>
						</div>

						<div class="product-content">
							<h3 class="name">
								<a href="product-details.html">Apple iPhone x</a>
							</h3>
							<span class="update">Last Update: 5 hours ago</span>
							<ul class="address">
								<li><a href="javascript:void(0)"><i
										class="lni lni-calendar"></i> 20 June, 2023</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-map-marker"></i> Canada</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i> Stifen Jon</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-package"></i> Used</a></li>
							</ul>
							<div class="product-bottom">
								<h3 class="price">$120.99</h3>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</section>
	<!--====== 베지밋 섹션 끝 ======-->


	<!--====== FOOTER PART START ======-->
	<footer class="footer-area">
		<div class="widget-wrapper">
			<div class="map-img">
				<img src="/resources/assets/images/footer/map-img.svg" alt="">
			</div>
			<div class="container">
				<div class="row">

					<div class="col-xl-4 col-md-7">
						<div class="footer-widget about">
							<a href="index.html" class="d-inline-block mb-30"> <img
								src="<%=request.getContextPath()%>/resources/assets/images/logo/logo.svg"
								alt="/main.do">
							</a>
						</div>
					</div>

					<div class="col-xl-2 col-md-4 order-md-2 order-xl-1 col-sm-6">
						<div class="footer-widget">
							<h4>Quick Link</h4>
							<ul class="link">
								<li><a href="javascript:void(0)">클래스</a></li>
								<li><a href="/recipeMain.do">레시피</a></li>
								<li><a href="javascript:void(0)">식당</a></li>
								<li><a href="javascript:void(0)">베지Meet</a></li>
								<li><a href="javascript:void(0)">Contact</a></li>
							</ul>
						</div>
					</div>

					<div class="col-xl-2 col-md-4 order-md-3 order-xl-2 col-sm-6">
						<div class="footer-widget">
							<h4>Support</h4>
							<ul class="link">
								<li><a href="javascript:void(0)">Live Chat</a></li>
								<li><a href="javascript:void(0)">Privacy Policy</a></li>
								<li><a href="javascript:void(0)">Purchase</a></li>
								<li><a href="javascript:void(0)">Protection</a></li>
								<li><a href="javascript:void(0)">Support</a></li>
							</ul>
						</div>
					</div>

					<div class="col-xl-2 col-md-4 order-md-4 order-xl-3 col-sm-6">
						<div class="footer-widget">
							<h4>Information</h4>
							<ul class="link">
								<li><a href="javascript:void(0)">Company</a></li>
								<li><a href="javascript:void(0)">Contact Info</a></li>
								<li><a href="javascript:void(0)">Blog & Articles</a></li>
								<li><a href="javascript:void(0)">Terms of Service</a></li>
								<li><a href="javascript:void(0)">Privacy Policy</a></li>
							</ul>
						</div>
					</div>

					<div class="col-xl-2 col-md-5 order-md-1 order-xl-4 col-sm-6">
						<div class="footer-widget">
							<h4>Contact Us</h4>
							<ul>
								<li><span>Phone:</span> 0345983672937</li>
								<li><span>Email:</span> yourmail@gmail.com</li>
								<li><span>Location:</span> United State of America</li>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="copy-right">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="text-center">
							<p>
								Designed & Developed By <a href="https://graygrids.com/"
									rel="nofollow" target="_blank">GrayGrids</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<!--====== BACK TOP TOP PART START ======-->
	<a href="#" class="back-to-top btn-hover"><i
		class="lni lni-chevron-up"></i></a>
	<!--====== BACK TOP TOP PART ENDS ======-->


	<!--====== Bootstrap js ======-->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/bootstrap.bundle-5.0.0.alpha-min.js"></script>

	<!--====== Tiny slider js ======-->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/tiny-slider.js"></script>

	<!--====== wow js ======-->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/wow.min.js"></script>

	<!--====== glightbox js ======-->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/glightbox.min.js"></script>

	<!--====== Selectr js ======-->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/selectr.min.js"></script>

	<!--====== Nouislider js ======-->
	<script
		src="<%=request.getContextPath()%>/resources/assets/js/nouislider.js"></script>

	<!--====== Main js ======-->
	<script src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>

	<script>
		//========= glightbox
		const myGallery = GLightbox({
			'href' : 'assets/video/Free App Landing Page Template - AppLand.mp4',
			'type' : 'video',
			'source' : 'youtube', //vimeo, youtube or local
			'width' : 900,
			'autoplayVideos' : true,
		});

		//======== tiny slider for feature-product-carousel
		tns({
			slideBy : 'page',
			autoplay : false,
			mouseDrag : true,
			gutter : 20,
			nav : false,
			controls : true,
			controlsPosition : 'bottom',
			controlsText : [
					'<span class="prev"><i class="lni lni-chevron-left"></i></span>',
					'<span class="next"><i class="lni lni-chevron-right"></i></span>' ],
			container : ".feature-product-carousel",
			items : 1,
			center : false,
			autoplayTimeout : 5000,
			swipeAngle : false,
			speed : 400,
			responsive : {
				768 : {
					items : 2,
				},

				992 : {
					items : 2,
				},

				1200 : {
					items : 3,
				}
			}
		});

		//======== tiny slider for testimonial
		tns({
			slideBy : 'page',
			autoplay : false,
			mouseDrag : true,
			gutter : 20,
			nav : true,
			controls : false,
			container : ".testimonial-carousel",
			items : 1,
			center : false,
			autoplayTimeout : 5000,
			swipeAngle : false,
			speed : 400,
			responsive : {
				768 : {
					items : 2,
				},
				1200 : {
					items : 3,
				}
			}
		});
	</script>
</body>
</html>
