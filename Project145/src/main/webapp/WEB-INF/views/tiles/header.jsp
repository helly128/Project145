<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
article {
   
 
   padding: 1em;
   overflow: hidden;
   min-height: 400px;
}


</style>
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

<body>
	<div></div>
	<div class="preloader">
		<div class="loader">
			<div class="ytp-spinner">
				<div class="ytp-spinner-container">
					<div class="ytp-spinner-rotator">
						<div class="ytp-spinner-left">
							<div class="ytp-spinner-circle"></div>
						</div>
						<div class="ytp-spinner-right">
							<div class="ytp-spinner-circle"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>





<header class="header_area">
		<div id="header_navbar" class="header_navbar">
			<div class="container position-relative">
				<div class="row align-items-center">
					<div class="col-xl-12">
						<nav class="navbar navbar-expand-lg">
							<a class="navbar-brand" href="/main.do"> <img id="logo"
								src="<%=request.getContextPath()%>/resources/assets/images/logo/logo.svg" alt="Logo">
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
										href="index.html">클래스</a></li>
									<li class="nav-item"><a class="page-scroll"  href="/recipeMain.do" >레시피
									</a></li>
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
							<ul class="header-btn d-md-flex">
								
									
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
								<li><a href="#" class="main-btn account-btn"> <span
										class="d-md-none"><i class="lni lni-user"></i></span> <span
										class="d-none d-md-block">My Account</span>
								</a>
									<ul class="dropdown-nav">
										<li><a href="dashboard.html">Dashboard</a></li>
										<li><a href="profile-settings.html">Profile Settings</a></li>
										<li><a href="post-ad.html">Post Ad</a></li>
										<li><a href="my-ads.html">My Ads</a></li>
										<li><a href="offers.html">Offers/Messages</a></li>
										<li><a href="payments.html">Payments</a></li>
										<li><a href="favorites.html">Favorites</a></li>
										<li><a href="privacy.html">Privacy</a></li>
										<li><a href="javascript:void(0)">Sign Out</a></li>
									</ul></li>
									<li><a href="/mypage.do"
									class="main-btn btn-hover d-none d-md-block">마이페이지테스트중</a></li>

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
