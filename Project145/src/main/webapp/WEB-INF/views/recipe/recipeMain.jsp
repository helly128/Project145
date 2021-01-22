<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recipeMain</title>
<style>
.single-product {
	height: 500px;
}

</style>
<script>
	function moveurl(category) {
		location.href = category;
	}
</script>


</head>
<body>
	<!--====== LATEST PRODUCT PART START ======-->
	<div class="container">
		<div class="row">
			<div class="mx-auto">
				<div class="text-center section-title mb-60">
					<h1>🥪레시피🥪</h1>
					<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr sed
						diam nonumy eirmod tempor invidunt dolore magna.</p>
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
										class="lni lni-search-alt theme-color"></i></label> <input type="text"
										name="keyword" id="keyword" placeholder="Product keyword">
								</div>
							</div>

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

						</div>
					</form>
				</div>
			</div>
		</div>
		<p />
		<!-- 검색바 끝 -->
		<div class="row">
			<!-- 레시피리스트 시작 -->
			<%-- ${recipes} --%>
			<c:forEach var="vo" items="${recipes}">
				<div class="col-xl-3 col-lg-6 col-md-6">
					<div class="single-product">
						<div class="product-img">
							<a href="/recipeDesc.do?rId=${vo.getRId() }"> <img
								src="${vo.getRImage()}" alt=""  height="300px" width="300px">
							</a>
						</div>
						<div class="product-content">
							<div class="namediv">
								<h5 class="name">
									<a href="/recipeDesc.do?rId=${vo.getRId()} ">${vo.getRTitle()}</a>
								</h5>
							</div>
							<ul class="address">
								<li><a href="javascript:void(0)"><i
										class="lni lni-calendar"></i>${vo.getRDate() }</a></li>
								<li><a href="javascript:void(0)"><i
										class="lni lni-user"></i>${vo.getMId() }</li>
								<!-- <li><a href="javascript:void(0)"><i
											class="lni lni-package"></i> Used</a></li> -->
							</ul>
							<div class="product-bottom">
								<h5 class="price"></h5>
								<a  ></a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- 레시피 리스트 카드 끝 -->


		</div>
	<button onclick="location.href='/recipeInsert.do'">Write</button>
	</div>

	<!--====== LATEST PRODUCT PART ENDS ======-->

</body>
</html>