<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myLikeClass.jsp</title>
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
							height="200" alt="">
						<div class="card-body">
							<h3 class="card-title">${list.cTitle }</h3>
							<p class="card-text">${list.cDesc }</p>
							<p style="font: bold;">
								시작일 <i class="lni lni-calendar"></i>
								<fmt:formatDate value="${list.cStart }"
									pattern="yyyy-MM-dd HH:mm" />
							</p>
							<p>
								종료일 <i class="lni lni-calendar"></i>
								<fmt:formatDate value="${list.cEnd }" pattern="yyyy-MM-dd HH:mm" />
							</p>
						</div>
						<div class="card-footer">
							<a href="#" class="btn btn-primary">${list.cStatus }</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<script>
		function goList(p) {
			location.href = ".do?page=" + p;
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
			var newDate = year + "-" + month + "-" + day + " " + hour + ":"
					+ min;
			return newDate;
		}
	</script>
</body>
</html>