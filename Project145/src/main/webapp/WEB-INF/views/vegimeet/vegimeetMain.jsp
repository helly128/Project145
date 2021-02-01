<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VEGIMEET - Untact</title>
<style>
.product-bottom {
	padding-bottom: 20px;
}

.name {
	display: block;
	width: 100%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.name:hover {
	color: #6C9852;
	cursor: pointer;
}

.class {
	background: #6C9852;
}

.likeAction {
	border: none;
	background: transparent;
}

.insertBtn {
	width: 130px;
	background: #6C9852;
	border-radius: 10px;
	color: white;
	height: 40px;
}

.insertBtn:hover {
	color: white;
}

.myCard {
	border: 1px solid rgba(124, 134, 154, 0.25);
	border-radius: 10px;
    transition: all 0.3s ease-out 0s;
    box-shadow: 0px 3px 35px rgb(218 222 228 / 30%);
	cursor: pointer;
}

.myCard:hover {
	box-shadow: 0px 12px 35px rgba(218, 222, 228, 0.65);
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<section class="latest-product-area pt-130 pb-110">
		<div class="container">
			<c:if test="${fn:length(myList) != 0}">
				<div class="addPic mb-5 p-2">
					<h5>📷 챌린지 인증샷 등록</h5>
					<div class="row">
						<c:forEach var="myMeet" items="${myList }">
							<div class="col-xl-4 col-lg-6 col-md-6 myCard mx-2 p-2 my-2 "
								data-id="${myMeet.meetId }">
								<div class="row">
									<div class="col-xl-7 col-lg-7 col-md-7">
										<img src="images/${myMeet.meetPic }" style="width: 300px;">
									</div>
									<div class="col-xl-5 col-lg-5 col-md-5">
										${myMeet.meetTitle }</div>
								</div>
								<div align="right">달성률 ${myMeet.partiVo.achiv }%
									(${myMeet.partiVo.success }/${myMeet.totalDay })</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>
			<div class="row">
				<div class="mx-auto col-xl-8 col-lg-9 col-md-10">
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
			<div class="row" id="cards">
				<c:forEach var="vo" items="${list }" varStatus="status">
					<div class="col-xl-3 col-lg-6 col-md-6">
						<div class="single-product">
							<div class="product-img">
								<a href="/vegimeetSelect.do?meetId=${vo.meetId }"> <img
									src="images/salad.jpg">
								</a>
							</div>
							<div class="product-content">
								<div class="namediv">
									<h3 class="name"
										onclick="location.href='/vegimeetSelect.do?meetId=${vo.meetId }'">${vo.meetTitle }</h3>
								</div>
								<ul class="address">
									<li><i class="lni lni-user"></i> 이름 넣어야함</li>
									<li><i class="lni lni-package"></i> ${vo.meetParticipant }</li>
									<li><i class="lni lni-calendar"></i> ${vo.meetStart }</li>
									<li>~ <i class="lni lni-calendar"></i> ${vo.meetEnd }
									</li>
								</ul>
								<div class="product-bottom border-bottom">
									<h3 class="price">${vo.meetFund }원</h3>
									<div>
										<button type="button" class="likeAction"
											data-id="${vo.meetId }">
											<c:if test="${vo.likeFlag > 0 }">
												<img class="likeImg" src="/images/filled_like.png"
													style="width: 30px;">
											</c:if>
											<c:if test="${vo.likeFlag == 0 }">
												<img class="likeImg" src="/images/empty_like.png"
													style="width: 30px;">
											</c:if>
										</button>
									</div>
								</div>
								<br>
								<div align="right">
									<c:if test="${vo.dday > 0 }">
										<h4 style="color: #6C9852;">마감 ${vo.dday }일 전!</h4>
									</c:if>
									<c:if test="${vo.dday <= 0}">
										<h4>마감</h4>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<div align="right">
				<button class="btn insertBtn" onclick="location.href='/vegimeet/'">챌린지
					개설</button>
			</div>
		</div>
	</section>

	<script>
		$(function() {
			$('#cards')
					.on(
							'click',
							'.likeAction',
							function() {
								if ('${mId}' == null || '${mId}' == '') {
									alert('로그인 후 이용가능합니다.');
								} else {
									var meetId = $(this).data('id');
									if ($(this).children('img').attr('src') == '/images/empty_like.png') {
										$.ajax({
											url : 'vegimeetLike.do/' + meetId,
											type : 'post',
											contentType : "application/json",
											success : function(result) {
											}
										});
										$(this).children('img').attr('src',
												'/images/filled_like.png');
									} else {
										$(this).children('img').attr('src',
												'/images/empty_like.png');
										$
												.ajax({
													url : 'vegimeetUnlike.do/'
															+ meetId,
													type : 'post',
													contentType : "application/json",
													success : function(result) {
													}
												});
										$(this).children('img').attr('src',
												'/images/empty_like.png');
									}
								}
							})

			$('.myCard').on('click', function() {
				var meetId = $(this).data('id');
				window.open('vegimeetPicInsertForm.do?meetId='+meetId, '인증샷 등록', 'width=500, height=500');
			});
		});
	</script>
</body>
</html>