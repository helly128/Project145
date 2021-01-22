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
	<section class="latest-product-area pt-130 pb-110">
		<div class="container">
			<div class="row">
				<div class="mx-auto col-xl-6 col-lg-7 col-md-10">
					<div class="text-center section-title mb-60">
						<h1>클래스를 들어봅시다 📢</h1>
						<p>요즘, 이거 못하는 사람 있나?</p>
					</div>
				</div>
			</div>
			<div class="search-area">
				<div class="container">
					<div class="search-wrapper">
						<form action="#">
							<div class="row justify-content-center">
								<div class="col-lg-3 col-sm-5 col-10">
									<div class="search-input">
										<label for="keyword"><i
											class="lni lni-search-alt theme-color"></i></label> <input
											type="text" name="keyword" id="keyword"
											placeholder="Product keyword">
									</div>
								</div>

<<<<<<< HEAD
								<div class="col-lg-3 col-sm-5 col-10">
									<div class="search-input" style="margin-bottom: 5%">
										<label for="category"><i
											class="lni lni-grid-alt theme-color"></i></label> <select
											name="category" onchange="moveurl(this.value);" id="category">
											<form name=move method=post>
												<option value="none" selected disabled>Categories</option>
												<option value="/recipeBegan.do">비건</option>
												<option value="/recipeRacto.do">락토</option>
												<option value="/recipeOvo.do">오보</option>
												<option value="/recipeRactoOvo.do">락토오보</option>
										</select>

									</div>
								</div>

=======
		<div class="row">
			<!-- 클래스리스트 시작 -->
			<c:forEach var="lesson" items="${lessons }">
				<div class="col-xl-3 col-lg-6 col-md-6">
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
>>>>>>> branch 'main' of https://github.com/helly128/Project145.git
							</div>
						</form>
					</div>
				</div>
			</div>
			<p />
			<div class="row">
				<c:forEach var="lesson" items="${lessons }">
					<div class="col-xl-3 col-lg-6 col-md-6">
						<div class="single-product">
							<div class="product-img">
								<a href="/recipeDesc.do"> <img src="images/salad.jpg" alt="">
								</a>
								<div class="product-action">
									<a href="javascript:void(0)"><i class="lni lni-heart"></i></a>

								</div>
							</div>

							<div class="product-content">
								<div class="namediv">
									<h3 class="name">
										<a href="/recipeDesc.do">${lesson.getCTitle() }</a>
									</h3>
								</div>
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
			</div>
		</div>
	</section>
</body>
</html>