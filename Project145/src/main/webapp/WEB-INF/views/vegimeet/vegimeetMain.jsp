<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VEGIMEET - Untact</title>
</head>
<body>
	<section class="latest-product-area pt-130 pb-110">
		<div class="container">
			<div class="row">
				<div class="mx-auto col-xl-6 col-lg-7 col-md-10">
					<div class="text-center section-title mb-60">
						<h1>당신의 챌린지에 참여하세요 📢</h1>
						<p>초보자들도 도전 가능한 다양한 언택트 만남, 챌린지를 개설하고 참여하세요</p>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-1"></div>
				<div class="col-lg-6 col-sm-5 col-10">
					<div class="search-input">
						<label for="keyword"><i
							class="lni lni-search-alt theme-color"></i></label> <input type="text"
							name="keyword" id="keyword" placeholder="Product keyword">
					</div>
				</div>
				<div class="col-lg-1"></div>
				<div class="col-lg-3 col-sm-5 col-10">
					<div class="search-btn">
						<button class="main-btn btn-hover">
							Search <i class="lni lni-search-alt"></i>
						</button>
					</div>
				</div>
				<div class="col-lg-1"></div>
			</div>
			<div class="row">
				<c:forEach var="vo" items="${list }">
					<div class="col-xl-3 col-lg-6 col-md-6">
						<div class="single-product">
							<div class="product-img">
								<a href="/vegimeetSelect.do?unId=${vo.meetId }"> <img
									src="images/salad.jpg">
								</a>
								<div class="product-action">
									<a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
								</div>
							</div>
							<div class="product-content">
								<div class="namediv">
									<h3 class="name">
										<a href="/vegimeetSelect.do?unId=${vo.meetId }">${vo.meetTitle }</a>
									</h3>
								</div>
								<ul class="address">
									<li><i class="lni lni-user"></i> 이름 넣어야함</li>
									<li><i class="lni lni-package"></i> ${vo.meetParticipant }</li>
									<li><i class="lni lni-calendar"></i> ${vo.meetStart } ~ ${vo.meetEnd }</li>

								</ul>
								<div class="product-bottom">
									<h3 class="price">${vo.meetFund }원</h3>
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