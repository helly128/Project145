<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.replebox {
	margin-left: 10%;
	margin-right: 10%;
}

.rereplebox {
	margin-left: 15%;
	margin-right: 15%;
}
</style>
</head>
<body>
	<div class="container">

		<div>
			<a href="/recipeMain.do" style="margin-top: 5%"><h2>⬅</h2></a>
		</div>
		<div class="category-list-item">
			<h2>🍏${recipeSelect.getRTitle() }</h2>
			<br />
			<div class="row">
				<div class="col-lg-10">
					<div class="icon">
						<i class="lni lni-users">${recipeSelect.getMId()} </i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i
							class="lni lni-calendar">${recipeSelect.getRDate()}</i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i
							class="lni lni-book">${recipeSelect.getRHit()}</i>
					</div>
					<div class="recipecontent">
						<textarea rows="5" cols="60">${recipeSelect.getRContent() }</textarea>
					</div>
				</div>
				<div class="col-lg-2">
					<img src="${recipeSelect.getRImage()}" height="200px" width="200px">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-10"></div>
				<div class="col-lg-2">
					<button
						onclick="location.href='/recipeUpdate.do?rId=${recipeSelect.getRId()}'">Edit</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button>Delete</button>
				</div>
			</div>
		</div>
		<hr />

		<br />
		<!-- 관련 재료 -->
		<div>
			<h3>🍋Ingredient</h3>
			<br />
			<div class="row">
				<div class="col-lg-4">
					Used Ingredient<br /> <br />
					<ol style="margin-left: 10%">
						<c:forEach var="recipeMaterial" items="${recipeMaterial }">
							<li>${recipeMaterial.getMatName()}&nbsp;${recipeMaterial.getMatVol()}</li>
						</c:forEach>

					</ol>

				</div>
				<div class="col-lg-8">
					Go to Cheapest Mall<br /> <br />
					<ol>
						<li>mall1_주소 [가격]</li>
						<li>mall2_주소 [가격]</li>
						<li>mall3_주소 [가격]</li>
					</ol>
				</div>
			</div>
		</div>

		<hr />
		<br />
		<!-- 관련 클래스 -->
		<div>
			<h3>📖Related Class</h3>
			<div class="row">
				<!-- 클래스리스트 시작 -->
				<c:forEach var="lesson" items="${lessons }">
					<div class="col-xl-3 col-lg-3 col-md-3">
						<input type="hidden" value="${lesson.getCId() }">
						<div class="single-product">
							<div class="product-img">
								<a href="/lessonProduct.do?cId=${lesson.getCId() }"> <img
									src="/images/${lesson.getCImg() }" width="150" height="250">
								</a>
								<div class="product-action">
									<a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
									<a href="javascript:void(0)" class="share"><i
										class="lni lni-share"></i></a>
								</div>
							</div>
							<div class="product-content">
								<input type="hidden" value="클래스아이디">
								<h3 class="name">
									<a href="product-details.html">${lesson.CTitle }</a>
								</h3>
								<span class="update">${lesson.getCDesc() }</span>
								<ul class="address">
									<li><a href="javascript:void(0)"><i
											class="lni lni-user"></i> ${lesson.lecName }</a></li>
									<li><a href="javascript:void(0)"><i
											class="lni lni-package"></i> ${lesson.CHit }</a></li>
									<li><a href="javascript:void(0)"><i
											class="lni lni-calendar"></i> ${lesson.CEnd }</a></li>
									<li><a href="javascript:void(0)"><i
											class="lni lni-map-marker"></i> ${lesson.vegType }</a></li>
								</ul>
								<div class="product-bottom">
									<h3 class="price">${lesson.CPrice }원</h3>
									<a href="javascript:void(0)" class="link-ad">좋아요</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<br />

		<hr />
		<div>
			<div class="container">
				<div class="search-wrapper">
					<form action="#">
						<div class="row justify-content-center">
							<div class="col-lg-10 col-sm-8 col-10">
								<div class="search-input">
									<input type="text" name="keyword" id="keyword"
										placeholder="🤷‍♂️댓글을 입력 해 주세요">
								</div>
							</div>
							<div class="col-lg-2 col-sm-5 col-10">
								<!-- Submit button -->
								<button type="button" class="middle-btn">댓글</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- 댓글-->
		<div class="replebox">
			<div class="single-box">
				<div class="row">
					<div class="icon col-lg-1">
						<h1>
							<i class="lni lni-bulb"></i>
						</h1>
					</div>
					<div class="icon col-lg-11">
						<h5>작성자</h5>
						<h5>작성일자</h5>
					</div>
				</div>
			</div>
			<div class="row">
				<p>Buy and sell everything from used cars to mobile phones and
					computer or search for property.Buy and sell everything from used
					cars to mobile phones and computer or search for property.Buy and
					sell everything from used cars to mobile phones and computer or
					search for property.</p>
			</div>
			<div class="row">
				<div class="col-lg-10">
					<a>↪</a>
				</div>
				<div class="col-lg-2">
					<a>🚫</a>
				</div>
			</div>

		</div>
		<br />
		<div class="re-reple">
			<div class="search-wrapper">
				<form action="#">
					<div class="row justify-content-center">
						<div class="col-lg-6 col-sm-4 col-3">
							<div class="search-input">
								<input type="text" name="keyword" id="keyword"
									placeholder="🤷‍♂️댓글을 입력 해 주세요">
							</div>
						</div>
						<div class="col-lg-2 col-sm-2 col-1">
							<!-- Submit button -->
							<button type="button" class="middle-btn">댓글</button>
						</div>
					</div>
				</form>
			</div>
			<!-- 대댓글-->
			<div class="rereplebox">
				<div class="single-box">
					<div class="row">
						<div class="icon col-lg-1">
							<h1>
								<i class="lni lni-bulb"></i>
							</h1>
						</div>
						<div class="icon col-lg-11">
							<h5>작성자</h5>
							<h5>작성일자</h5>
						</div>
					</div>
				</div>
				<div class="row">
					<p>Buy and sell everything from used cars to mobile phones and
						computer or search for property.Buy and sell everything from used
						cars to mobile phones and computer or search for property.Buy and
						sell everything from used cars to mobile phones and computer or
						search for property.</p>
				</div>
				<div class="row">
					<div class="col-lg-10">
						<a>↪</a>
					</div>
					<div class="col-lg-2">
						<a>🚫</a>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>