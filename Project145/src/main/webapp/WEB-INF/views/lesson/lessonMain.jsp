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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>lessonMain.jsp</title>
<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
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
											class="lni lni-grid-alt theme-color"></i></label> <select
											name="vegType" id="vegType">
											<option value="none" selected disabled>TYPE</option>
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
										<label for="keyword"><a
											href="javascript:form.submit()"><i
												class="lni lni-search-alt theme-color"></i></a></label> <input
											type="text" name="keyword" id="keyword"
											value="${vo.getKeyword() }">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach var="lesson" items="${lessons }">
					<div class="col-xl-3 col-lg-6 col-md-6">
						<div class="single-product">
							<div class="product-img">
								<a href="/lessonProduct.do?cId=${lesson.getCId() }"> <img
									src="images/salad.jpg" alt="">
								</a>
								<div class="product-action">
									<a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
								</div>
							</div>
							<div class="product-content">
								<div class="namediv">
									<h3 class="name">
										<a href="/lessonProduct.do?cId=${lesson.getCId() }">${lesson.getCTitle() }</a>
									</h3>
								</div>
								<ul class="address">
									<li><i class="lni lni-user"></i> ${lesson.getLecName() }</li>
									<li><i class="lni lni-package"></i> ${lesson.getCHit() }</li>
									<li><i class="lni lni-calendar"></i> ${lesson.getCEnd() }</li>
									<li><i class="lni lni-map-marker"></i>
										${lesson.getVegType() }</li>
								</ul>
								<div class="product-bottom">
									<h3 class="price">${lesson.getCPrice() }원</h3>
									<a href="javascript:void(0)" class="link-ad">🤍</a>
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
	</script>
</body>
</html>