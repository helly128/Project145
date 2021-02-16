<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RestaurantMain.jsp</title>
<style>
.likeAction {
	border: none;
	background: transparent;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
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
						<form action="restaurant.do" method="get" id="frm">
							<div class="row justify-content-center">
								<div class="col-lg-2 col-sm-4 col-6">
									<div class="search-input">
										<label for="category"> <i
											class="lni lni-grid-alt theme-color"></i>
										</label> <select name="menuVegeType" id="menuVegeType">
											<form name=move method=post>
												<option value="" selected>채식타입</option>
												<option value="비건"
													<c:if test="${vo.menuVegeType == '비건' }">selected="selected"</c:if>>비건</option>
												<option value="락토"
													<c:if test="${vo.menuVegeType == '락토' }">selected="selected"</c:if>>락토</option>
												<option value="오보"
													<c:if test="${vo.menuVegeType == '오보' }">selected="selected"</c:if>>오보</option>
												<option value="락토오보"
													<c:if test="${vo.menuVegeType == '락토오보' }">selected="selected"</c:if>>락토오보</option>
											</form>
										</select>
									</div>
								</div>
								<div class="col-lg-3 col-sm-5 col-6">
									<div class="search-input">
										<label for="keyword"> <a
											href="javascript:frm.submit()"> <i
												class="lni lni-search-alt theme-color"></i>
										</a>
										</label> <input type="text" name="keyword" id="keyword"
											placeholder="식당이름으로 검색해보세요" value="${vo.getKeyword() }">
									</div>
								</div>
								<div class="col-lg-2 col-sm-4 col-6">
									<div class="restaurantInsertButton" style="margin-bottom: 5%">
										<input class="aaa" type="button" name="restInsert"
											id="restInsert" onclick="location.href='restaurantForm.do'"
											style="border-radius: 50px; text-align: center;"
											value="식당 제보하기">
									</div>
								</div>
							</div>


						</form>




					</div>
				</div>
			</div>
			<!-- 검색바 끝 -->
			<%-- ${restaurant} --%>
			<div class="row" id="cards">
				<!-- 식당 리스트 시작 -->
				<c:forEach var="vo" items="${restaurants}">
					<div class="col-xl-3 col-lg-6 col-md-6">
						<div class="single-product">
							<div class="product-img">
								<a href="/restaurantDetail.do?restId=${vo.getRestId() }"> <img
									src="images/${vo.getRestPic() }" alt="" height="300px" width="300px">
								</a>
							</div>

							<div class="product-content">
								<div class="namediv col-lg-12" style="float: left;">
									<h3 class="name">
										<a href="/restaurantDetail.do?restId=${vo.getRestId() }">${vo.getRestName() }</a>
									</h3>
								</div>
								<br />
								<div>
									<table >
										<tr>
											<td> <i class="lni lni-star" ></i> </td>
											<td> ${vo.getStar() } </td>
										</tr>
										<tr height="50px">
											<td style="vertical-align:top"> <i class="lni lni-map-marker" ></i> </td>
											<td style="vertical-align:top"> ${vo.getRestAddress() } </td>
										</tr>
									</table>
									
								</div>
								<br>
								<!-- 좋아요 -->
								<div class="likehear" align="right">
									<button type="button" class="likeAction"
										data-id="${vo.restId }">
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
						</div>
					</div>
				</c:forEach>
			</div>
			<my:paging paging="${paging }" jsFunc="goList" />
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
									/* 로그인 된 상태 */
									var restId = $(this).data('id');
									if ($(this).children('img').attr('src') == '/images/empty_like.png') {
										$
												.ajax({
													url : 'restaurantLike.do/'
															+ restId,
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
										$.ajax({
											url : 'restaurantUnlike.do/'
													+ restId,
											type : 'post',
											contentType : "application/json",
											success : function(result) {
												console.log(result);
											}
										});
										$(this).children('img').attr('src',
												'/images/empty_like.png');
									}
								}
							})
		});

		function goList(p) {
			var menuVegeType = document.getElementById("menuVegeType").value;
			var keyword = document.getElementById("keyword").value;

			if (menuVegeType == "none" || keyword == '') {
				location.href = "restaurant.do?page=" + p
			} else {
				location.href = "restaurant.do?page=" + p + "&menuVegeType="
						+ menuVegeType + "&keyword=" + keyword;
			}

		}
	</script>
</body>
</html>