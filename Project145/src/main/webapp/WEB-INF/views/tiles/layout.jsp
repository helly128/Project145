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
	min-height: 500px;
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

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
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
							<a class="navbar-brand" href="index.html">채식당 <a
								class="navbar-brand" href="/main.do"> </a>
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
											href="/vegimeetList.do">베지Meet</a></li>
									</ul>
								</div>
								<ul class="header-btn d-sm-flex">

									<c:if test="${auth eq null}">
										<li><a href="/loginForm.do"
											class="main-btn btn-hover d-none d-md-block">로그인</a></li>
									</c:if>
									<c:if test="${mId eq null && password eq null}">
										<li><a href="/memberRegister.do"
											class="main-btn btn-hover d-none d-md-block">회원가입</a></li>
									</c:if>
									<c:if test="${mId ne null && password ne null}">
										<li><a href="/logout.do"
											class="main-btn btn-hover d-none d-md-block">로그아웃</a></li>
									</c:if>
									<!-- <li><a href="#" class="main-btn account-btn"> <span
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
									</ul></li> -->
									<c:if test="${mId ne null && password ne null}">
										<li><a href="/mypage.do"
											class="main-btn btn-hover d-none d-md-block">마이페이지테스트중</a></li>
									</c:if>

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


	<article>

		<br> <br> <br> <br>
		<tiles:insertAttribute name="content" />
	</article>



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
							<a href="index.html" class="d-inline-block mb-30"> </a>
						</div>
					</div>

					<div class="col-xl-2 col-md-4 order-md-2 order-xl-1 col-sm-6">
						<div class="footer-widget">
							<h4>Quick Link</h4>
							<ul class="link">
								<li><a href="javascript:void(0)">클래스</a></li>
								<li><a href="/recipeMain.do">레시피</a></li>
								<li><a href="javascript:void(0)">식당</a></li>
								<li><a href="/vegimeetList.do">베지Meet</a></li>
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