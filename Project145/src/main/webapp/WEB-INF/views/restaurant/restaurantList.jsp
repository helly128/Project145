<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RestaurantMain.jsp</title>

<style type="text/css">

#restInsert:hover {
	background-color:#6c9852;
	color:white;
}

.lni-heart-filled {
	color: white;
}

.lni-heart-filled:hover {
	color: pink;
}

.lni-heart-filled:clicked {
	color: red;
}

</style>

</head>
<body>
	<section class="latest-product-area pt-130 pb-110">
		<div class="container">
			<div class="row">
				<div class="mx-auto col-xl-6 col-lg-7 col-md-10">
					<div class="text-center section-title mb-60">
						<h1>🏡 식 당 🏡</h1>
						<p>???????????????</p>
					</div>
				</div>
			</div>
			<div class="search-area">
				<div class="container">
					<div class="search-wrapper">
						<form action="#">
							<div class="row justify-content-center">
								<div class="col-lg-2 col-sm-4 col-6">
									<div class="search-input" >
										<label for="category">
										<i class="lni lni-grid-alt theme-color"></i>
										</label> 
										<select name="category" onchange="moveurl(this.value);" id="category">
											<form name=move method=post>
												<option value="none" selected disabled>Categories</option>
												<option value="/restaurantBegan.do">비건</option>
												<option value="/restaurantRacto.do">락토</option>
												<option value="/restaurantOvo.do">오보</option>
												<option value="/restaurantRactoOvo.do">락토오보</option>
											</form>
										</select>
									</div>
								</div>
								<div class="col-lg-3 col-sm-5 col-6">
									<div class="search-input">
										<label for="keyword"><i
											class="lni lni-search-alt theme-color"></i></label> <input
											type="text" name="keyword" id="keyword"
											placeholder="Product keyword">
									</div>
								</div>
								<div class="col-lg-2 col-sm-4 col-6">
									<div class="restaurantInsertButton" style="margin-bottom: 5%">
										<input class="aaa" type="button" name="restInsert" id="restInsert" onclick="location.href='restaurantForm.do'"
											   style="border-radius: 50px; text-align:center;" value="식당 제보하기">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 검색바 끝 -->
			<%-- ${restaurant} --%>
			<div class="row">
			<!-- 식당 리스트 시작 -->
				<c:forEach var="vo" items="${restaurants}">
					<div class="col-xl-3 col-lg-6 col-md-6">
						<div class="single-product">
							<div class="product-img">
								<a href="/restaurantImformation.do?restId=${vo.getRestId() }"> 
									<img src="images/salad.jpg" alt="" height="300px" width="300px">
								</a>
								<div class="product-action">
									<a href="javascript:void(0)"><i class="lni lni-heart-filled" onclick="redheart"></i></a>
									
									
								</div>
							</div>

							<div class="product-content">
								<div class="namediv">
									<h3 class="name">
										<a href="/restaurantImformation.do?restId=${vo.getRestId() }">${vo.getRestName() }</a> 
									</h3>
								</div>
								<ul class="address">
									<li><a href="javascript:void(0)"><i class="lni lni-star"></i></i> ${vo.getRestStarAvg() }</a></li>
									<li><a href="javascript:void(0)"><i
											class="lni lni-package"></i> ${vo.getRestTime()}</a></li>
								</ul>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
</body>
</html>