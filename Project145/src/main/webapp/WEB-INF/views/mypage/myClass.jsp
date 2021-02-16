<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myLikeClass.jsp</title>
<style type="text/css">
.likeAction {
	border: none;
	background: transparent;
}

.card-title {
	display: block;
	width: 100%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<div class="container">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">CLASS를 확인하세요!! ✔</h1>
		</div>
		<!-- Page Features -->
		<div class="row text-center">
			<c:forEach var="list" items="${list }">
				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card h-100">
						<img class="card-img-top" src="/images/${list.cImg }" width="200"
							height="200" onerror="this.src='/images/loveurth (3).jpg'"
							alt="클래스 이미지" style="cursor: pointer;"
							onclick="location.href='lessonProduct.do?cId=${list.cId}'">
						<div class="card-body">
							<h3 class="card-title" style="cursor: pointer;"
								onclick="location.href='lessonProduct.do?cId=${list.cId}'">${list.cTitle }</h3>
							<p style="font: bold;">
								<i class="lni lni-calendar"> 시작일 </i>
								<fmt:formatDate value="${list.cStart }" pattern="yyyy-MM-dd" />
							</p>
							<p>
								<i class="lni lni-calendar"> 종료일 </i>
								<fmt:formatDate value="${list.cEnd }" pattern="yyyy-MM-dd" />
							</p>
						</div>
						<div class="card-footer"></div>
					</div>
				</div>
			</c:forEach>
		</div>
		<my:paging paging="${paging }" jsFunc="goList" />
	</div>
	<script>
		function goList(p) {
			location.href = "myClass.do?page=" + p;
		}

		function dateFormat(dat) {
			var date = new Date(dat);
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var day = date.getDate();
			var hour = date.getHours();
			var min = date.getMinutes();
			if (min < 10) {
				min = '0' + min;
			}
			var newDate = year + "-" + month + "-" + day;
			return newDate;
		}
	</script>
</body>
</html>