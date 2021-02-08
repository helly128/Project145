<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>lessonMain.jsp</title>
<style type="text/css">
.likeAction {
	border: none;
	background: transparent;
}

.namediv {
	height: 60px;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
	border-radius: 5px;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
	border-radius: 5px;
}
</style>
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
						<form action="lessonMain.do" method="get" id="form">
							<div class="row justify-content-center">
								<div class="col-lg-2 col-sm-4 col-6">
									<div class="search-input">
										<label for="category"> <i
											class="lni lni-grid-alt theme-color"></i>
										</label> <select name="vegType" id="vegType">
											<option value="" selected
												<c:if test="${vo.getVegType() == '' }">selected="selected"</c:if>>TYPE</option>
											<option value="비건"
												<c:if test="${vo.getVegType() == '비건' }">selected="selected"</c:if>>비건</option>
											<option value="락토"
												<c:if test="${vo.getVegType() == '락토' }">selected="selected"</c:if>>락토</option>
											<option value="오보"
												<c:if test="${vo.getVegType() == '오보' }">selected="selected"</c:if>>오보</option>
											<option value="락토오보"
												<c:if test="${vo.getVegType() == '락토오보' }">selected="selected"</c:if>>락토오보</option>
										</select>
									</div>
								</div>
								<div class="col-lg-3 col-sm-5 col-6">
									<div class="search-input">
										<label for="keyword"> <a
											href="javascript:form.submit()"> <i
												class="lni lni-search-alt theme-color"></i>
										</a>
										</label> <input type="text" name="keyword" id="keyword"
											value="${vo.getKeyword() }">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="row" id="cards">
				<c:forEach var="lesson" items="${lessons }">
					<div class="col-xl-3 col-lg-6 col-md-6">
						<div class="single-product">
							<div class="product-img">
								<a href="/lessonProduct.do?cId=${lesson.getCId() }"> <img
									src="/images/${lesson.getCImg() }" width="100" height="250"
									onerror="this.src='/images/loveurth (3).jpg'" alt="클래스이미지"
									style="cursor: pointer;">
								</a>
							</div>
							<div class="product-content">
								<div class="namediv">
									<h4 class="name">
										<a href="/lessonProduct.do?cId=${lesson.getCId() }">${lesson.getCTitle() }</a>
									</h4>
								</div>
								<ul class="address">
									<li><i class="lni lni-calendar"></i> ${lesson.getCStart() }</li>
									<li>~ ${lesson.getCEnd() }</li>
									<li><i class="lni lni-map-marker"></i>${lesson.getVegType() }</li>
									<li><i class="lni lni-package"></i> 조회수:
										${lesson.getCHit() }</li>
								</ul>
								<div class="product-bottom">
									<h3 class="price">
										<fmt:formatNumber value="${lesson.getCPrice() }"
											pattern="#,###" />
										원
									</h3>
									<div>
										<button type="button" class="likeAction"
											data-id="${lesson.getCId() }">
											<c:if test="${lesson.getLikeFlag() > 0 }">
												<img class="likeImg" src="/images/filled_like.png"
													style="width: 30px;" alt="꽉찬하트">
											</c:if>
											<c:if test="${lesson.getLikeFlag() == 0 }">
												<img class="likeImg" src="/images/empty_like.png"
													style="width: 30px;" alt="빈하트">
											</c:if>
										</button>
									</div>
								</div>
								<br>
								<div class="product_bottom">
									<c:if test="${lesson.CJoin != lesson.CParti }">
										<c:choose>
											<c:when test="${today < lesson.getCStart()}">
												<button id="status" disabled type="button"
													class="btn btn-outline-success">클래스 준비중</button>
											</c:when>
											<c:when test="${today <= lesson.getCEnd()}">
												<button id="status" disabled type="button"
													class="btn btn-outline-success">클래스 진행중</button>
											</c:when>
											<c:when test="${today > lesson.getCEnd()}">
												<button id="status" disabled type="button"
													class="btn btn-outline-success">클래스 마감</button>
											</c:when>
										</c:choose>
									</c:if>
									<c:if test="${lesson.CJoin == lesson.CParti }">
										<button id="status" disabled type="button"
											class="btn btn-outline-success">모집 마감</button>
									</c:if>
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
		function goList(p) {
			var vegType = document.getElementById("vegType").value;
			var keyword = document.getElementById("keyword").value;

			if (vegType == "none" || keyword == '') {
				location.href = "lessonMain.do?page=" + p
			} else {
				location.href = "lessonMain.do?page=" + p + "&vegType="
						+ vegType + "&keyword=" + keyword;

			}

		}

		$(function() {

			$("#cards")
					.on(
							'click',
							'.likeAction',
							function() {

								if ('${mId}' == null || '${mId}' == '') {
									alert("로그인 후 이용가능합니다.")
								} else {
									var classId = $(this).data('id')

									if ($(this).children('img').attr('src') == '/images/empty_like.png') {
										$.ajax({
											url : 'lessonLike.do/' + classId,
											type : 'post',
											contentType : "application/json",
											success : function(result) {

											}
										}) // ajax end
										$(this).children('img').attr('src',
												'/images/filled_like.png')
									} else {
										$.ajax({
											url : 'lessonUnLike.do/' + classId,
											type : 'post',
											contentType : 'application/json',
											success : function(result) {

											}
										}) //ajax end
										$(this).children('img').attr('src',
												'/images/empty_like.png')
									}
								}
							})

		})//ready end
	</script>
</body>
</html>