<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.name {
	height: 60px;
	display: block;
	width: 100%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.product-bottom {
	height: 30px;
}

#home {
	height: 100ps;
}
</style>
</head>
<body onload="doPopupopen();">
	<!--====== 메인배너부분 ======
	<section id="home" class="hero-area bg_cover">
		<div class="container">
			<div class="row">
				<div class="mx-auto col-lg-9 col-xl-9 col-md-10">
					<div class="text-center hero-content">
						<h1 class="mb-30 wow fadeInUp" data-wow-delay=".2s"
							style="color: black">다함께 건강하게, 채식 한 끼.</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
	======메인배너부분 END ======-->

	<!--====== 클래스 섹션 ======-->
	<section class="latest-product-area pt-50 pb-80 pt-100">
		<div class="container">
			<div class="row">
				<div class="mx-auto">
					<div class="text-left section-title mb-30">
						<a href="/lessonMain.do"><h2>
								Popular Class <i class="lni lni-paperclip"></i> →
							</h2></a>
						<p>요즘,이거 안 들어 본 사람 있나?</p>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach var="lessonM" items="${mainListLesson }">
					<div class="col-xl-3 col-lg-6 col-md-6">
						<div class="single-product">
							<div class="product-img">
								<a href="/lessonProduct.do?cId=${lessonM.cId }"> <img
									src="/images/${lessonM.cImg }" alt="클래스사진"
									onerror="this.src='/images/loveurth (3).jpg'" width="100"
									height="250">
								</a>
							</div>
							<div class="product-content" style="height: 220px;">
								<h4 class="name">
									<a href="/lessonProduct.do?cId=${lessonM.cId }">${lessonM.cTitle }</a>
								</h4>
								<ul class="address">
									<li><i class="lni lni-heart-filled"></i> ${lessonM.cnt }</li>
									<li><a href="javascript:void(0)"><i
											class="lni lni-user"></i> ${lessonM.cLecid }</a></li>
									<li><a href="javascript:void(0)"><i
											class="lni lni-calendar"></i> <fmt:formatDate
												value="${lessonM.cStart }" pattern="yyyy-MM-dd" /> </a></li>
									<li><a href="javascript:void(0)">~ <fmt:formatDate
												value="${lessonM.cEnd }" pattern="yyyy-MM-dd" /></a></li>


								</ul>
								<div class="product-bottom">
									<h4 class="price">
										<fmt:formatNumber value="${lessonM.cPrice }" pattern="#,###" />
										원
									</h4>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!--====== 클래스 섹션 끝 ======-->

	<!--====== 레시피 섹션 시작 ======-->
	<section class="latest-product-area pt-30 pb-80">
		<div class="container">
			<div class="row">
				<div class="mx-auto">
					<div class="text-left section-title mb-60">
						<a href="/recipeMain.do"><h2>
								Popular Receipe <i class="lni lni-chef-hat"></i> →
							</h2></a>
						<p>요즘,이거 안 만들어 본 사람 있나?</p>
					</div>
				</div>
			</div>

			<div class="row">
				<c:forEach var="recipeM" items="${mainListRecipe }">
					<div class="col-xl-3 col-lg-6 col-md-6">
						<div class="single-product">
							<div class="product-img">
								<a href="recipeDesc.do?rId=${recipeM.rId}"> <img
									src="${recipeM.rImage }" alt="레시피 사진"
									onerror="this.src='/images/loveurth (3).jpg'" width="100"
									height="250">
								</a>
							</div>

							<div class="product-content">
								<h4 class="name">
									<a href="recipeDesc.do?rId=${recipeM.rId}">${recipeM.rTitle }</a>
								</h4>
								<ul class="address">
									<li><i class="lni lni-heart-filled"></i> ${recipeM.cnt }</li>
									<li><a href="javascript:void(0)"><i
											class="lni lni-user"></i> ${recipeM.rType }</a></li>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</section>
	<!--====== 레시피 섹션 끝 ======-->

	<!--====== 베지meet섹션 시작 ======-->
	<section class="latest-product-area pt-30 pb-110">
		<div class="container">
			<div class="row">
				<div class="mx-auto">
					<div class="text-left section-title mb-60">
						<a href="/vegimeetList.do"><h2>
								Popular Challenge <i class="lni lni-telegram-original"></i> →
							</h2></a>
						<p>요즘,여기서 안 만나 본 사람 있나?</p>
					</div>
				</div>
			</div>

			<div class="row">
				<c:forEach var="meetM" items="${mainListMeet }">
					<div class="col-xl-3 col-lg-6 col-md-6">
						<div class="single-product">
							<div class="product-img">
								<a href="/vegimeetSelect.do?meetId=${meetM.meetId }"> <img
									src="/images/${meetM.mPic }" alt="챌린저사진"
									onerror="this.src='/images/loveurth (3).jpg'" width="100"
									height="250">
								</a>
							</div>
							<div class="product-content" style="height: 220px;">
								<h4 class="name">
									<a href="/vegimeetSelect.do?meetId=${meetM.meetId }">${meetM.mTitle }</a>
								</h4>
								<ul class="address">
									<li><a href="javascript:void(0)"><i
											class="lni lni-heart-filled"></i> ${meetM.cnt }</a></li>
									<li><a href="javascript:void(0)"><i
											class="lni lni-user"></i> ${meetM.mParti }</a></li>
									<li><a href="javascript:void(0)"><i
											class="lni lni-calendar"></i> <fmt:formatDate
												value="${meetM.mStart }" pattern="yyyy-MM-dd" /> </a></li>
									<li><a href="javascript:void(0)"> ~ <fmt:formatDate
												value="${meetM.mEnd }" pattern="yyyy-MM-dd" /></a></li>

								</ul>
								<div class="product-bottom">
									<h4 class="price">
										<fmt:formatNumber value="${meetM.mFund }" pattern="#,###" />
										원
									</h4>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!--====== 베지밋 섹션 끝 ======-->


	<!--====== 식당 섹션 ======-->
	<section class="latest-product-area pt-30 pb-80">
		<div class="container">
			<div class="row">
				<div class="mx-auto">
					<div class="text-left section-title mb-60">
						<a href="/restaurant.do"><h2>
								Popular Restaurant <i class="lni lni-dinner"></i> →
							</h2></a>
						<p>요즘,여기 모르는 사람 있나?</p>
					</div>
				</div>
			</div>

			<div class="row">
				<c:forEach var="restM" items="${mainListRest }">
					<div class="col-xl-3 col-lg-6 col-md-6">
						<div class="single-product">
							<div class="product-img">
								<a href="restaurantDetail.do?restId=${restM.restId}"> <img
									src="/images/${restM.rPic }" alt="레스토랑사진"
									onerror="this.src='/images/loveurth (3).jpg'" width="100"
									height="250">
								</a>
							</div>
							<div class="product-content" style="height: 200px;">
								<h4 class="name">
									<a href="restaurantDetail.do?restId=${restM.restId}">${restM.rName }</a>
								</h4>
								<span class="update" style="height: 50px;">${restM.rAddress }</span>
								<ul class="address" style="height: 60px;">
									<li><i class="lni lni-heart-filled"></i> ${restM.cnt }</li>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!--====== 식당 섹션 끝 ======-->


	<script type="text/javascript">
		function dateFormat(dat) {
			var date = new Date(dat);
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var day = date.getDate();
			var hour = date.getHours();
			var min = date.getMinutes();
			if (min < 10) {
				min = '0' + min;
			}
			var newDate = year + "
								-" + month + "-" + day;
			return newDate;
		}

		function
								doPopupopen() {
			window
					.open(
							"popup.jsp",
							"popup01",
							"width=500,
								height=600, left=1300, top=200, location=no, menubar=no,
								scrollbars=no");
		}
	
								</script>





</body>
</html>