<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="jy" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recipeMain</title>
<style>
.single-product {
	height: 400px;
}

.product-content {
	height: 40px;
}

.likeAction {
	border: none;
	background: transparent;
}
</style>
<script>
	function moveurl(category) {
		location.href = category;
	}
</script>


</head>
<body>
	<section class="latest-product-area pt-130 pb-110">
		<!--====== LATEST PRODUCT PART START ======-->
		<div class="container">
			<div class="row">
				<div class="mx-auto">
					<div class="text-center section-title mb-60">
						<h1>🥪레시피를 공유해봅시다.🥪</h1>
						<p>요즘,이거 안 만들어 본 사람 있나?</p>
					</div>
				</div>
			</div>
			<div class="search-area">
				<div class="container">
					<div class="search-wrapper">
						<form action="recipeMain.do" name="form" id="form" method="get">
							<div class="row justify-content-center">

								<div class="col-lg-3 col-sm-5 col-10">
									<div class="search-input" style="margin-bottom: 5%">
										<label for="category"><i
											class="lni lni-grid-alt theme-color"></i></label> <select
											name="RType" id="RType">
											<option value="none" selected disabled>RecipeType</option>
											<option value="">전체</option>
											<option value="비건"
												<c:if test="${vo.getRType() == '비건' }">selected="selected"</c:if>>비건</option>
											<option value="락토"
												<c:if test="${vo.getRType() == '락토' }">selected="selected"</c:if>>락토</option>
											<option value="오보"
												<c:if test="${vo.getRType() == '오보' }">selected="selected"</c:if>>오보</option>
											<option value="락토오보"
												<c:if test="${vo.getRType() == '락토오보' }">selected="selected"</c:if>>락토오보</option>
										</select>
									</div>
								</div>
								<div class="col-lg-3 col-sm-5 col-10">
									<div class="search-input">
										<label for="keyword"> <a
											href="javascript:form.submit()"> <i
												class="lni lni-search-alt theme-color"></i>
										</a>
										</label> <input type="text" name="keyword" id="keyword"
											placeholder="keyword" value="${vo.getKeyword() }">
									</div>
								</div>
								<div class="col-lg-1 col-sm-1 col-2">
									<button class="btn btn-success" type="submit">👀</button>
								</div>
							</div>
						</form>
						<div class="col-lg-2 col-sm-3 col-4">
							<button class="btn btn-success"
								onclick="location.href='recipeInsert.do'">Write New
								Now!📝</button>
						</div>
						<br /> <br />


					</div>
				</div>
			</div>
			<p />
			<!-- 검색바 끝 -->
			<!-- 레시피리스트 시작 -->
			<%-- ${recipes} --%>
			<div>
				<div class="row" id="cards">
					<c:forEach var="vo" items="${recipes}" varStatus="status">
						<div class="col-xl-3 col-lg-6 col-md-6">
							<div class="single-product">
								<div class="product-img">
									<a href="/recipeDesc.do?rId=${vo.getRId() }"> <img
										src="${vo.getRImage()}" alt="" height="300px" width="300px">
									</a>
								</div>
								<div class="product-content">
									<div class="namediv">
										<h5 class="name">
											<a href="/recipeDesc.do?rId=${vo.getRId()} ">${vo.getRTitle()}</a>
										</h5>
									</div>
									<ul class="address">
										<li><i class="lni lni-calendar"></i>&nbsp;&nbsp;${vo.getRDate() }</li>
										<li><i class="lni lni-user"></i>&nbsp;&nbsp;${vo.getMId() }</li>
									</ul>
								</div>
								<div align="right">
									<button type="button" class="likeAction"
										data-id="${vo.getRId() }">
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
					</c:forEach>
				</div>
			</div>
			<!-- 레시피 리스트 카드 끝 -->
			<!-- 페이징 처리 추가 -->
			<div class="paging" align="center">
				<jy:paging paging="${paging}" jsFunc="goList" />
				<script>
					function goList(p) {
						location.href = "recipeMain.do?page=" + p;
					}
					$(function() {
						$('#cards')
								.on(
										'click',
										'.likeAction',
										function() {
											if ('${mId}' == null
													|| '${mId}' == '') {
												alert('로그인 후 이용가능합니다.');
											} else {
												var rId = $(this).data('id');
												if ($(this).children('img')
														.attr('src') == '/images/empty_like.png') {
													$
															.ajax({
																url : 'recipeLike.do/'
																		+ rId,
																type : 'post',
																contentType : "application/json",
																success : function(
																		result) {
																}
															});
													$(this)
															.children('img')
															.attr('src',
																	'/images/filled_like.png');
												} else {
													$(this)
															.children('img')
															.attr('src',
																	'/images/empty_like.png');
													$
															.ajax({
																url : 'recipeUnlike.do/'
																		+ rId,
																type : 'post',
																contentType : "application/json",
																success : function(
																		result) {
																}
															});
													$(this)
															.children('img')
															.attr('src',
																	'/images/empty_like.png');
												}
											}
										})

					});
				</script>

			</div>
			<%-- <!-- 페이징 2 -->
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/recipeMain.do?page=${paging.startPage - 1 }&pageUnit=${paging.pageUnit}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.page }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.page }">
					<a href="/recipeMain.do?page=${p }&pageUnit=${paging.pageUnit}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/recipeMain.do?page=${paging.endPage+1 }&pageUnit=${paging.pageUnit}">&gt;</a>
		</c:if>
	</div> --%>
		</div>

		<!--====== LATEST PRODUCT PART ENDS ======-->
	</section>
</body>
</html>