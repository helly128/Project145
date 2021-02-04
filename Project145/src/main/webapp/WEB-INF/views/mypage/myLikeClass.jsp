<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
</style>
</head>
<body>
	<div class="container">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">내가 좋아하는 CLASS 💙</h1>
		</div>

		<div class="row">
			<c:forEach items="${list }" var="list">
				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card h-100">
						<img class="card-img-top" src="/images/${list.cImg }" width="100"
							height="200" onerror="this.src='/images/loveurth (3).jpg'">
						<div class="card-body">
							<h4 class="card-title">${list.cTitle }</h4>
							<ul class="address" align="left">
								<li>수강기간 : <br> <fmt:formatDate
										value="${list.cStart }" pattern="yyyy/MM/dd" /> - <br> <fmt:formatDate
										value="${list.cEnd }" pattern="yyyy/MM/dd" />
								</li>
								<li>TYPE : ${list.vegType }</li>
								<li>조회수 : ${list.cHit }</li>
							</ul>
							<a href="#" class="btn btn-warning btn-icon-split"><span
								class="text">강의현황 : ${list.status }</span></a>
						</div>
						<div class="card-footer" align="right">
							<button type="button" class="likeAction"
								data-id="${list.originId }">
								<img class="likeImg" src="/images/filled_like.png"
									style="width: 30px;" onerror="this.src='/images/loveurth (3).jpg'">
							</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<script>
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

		$(function() {
			$(".likeAction").on('click', function() {
				var originId = $(this).data('id')
				$.ajax({
					url : 'HeartCancel.do/' + originId,
					type : 'post',
					contentType : 'application/json',
					success : function(result) {
						location.reload();
					}
				}) // ajax end

				//$(this).chileren('img').attr('src','/images/empty_like.png')

			}) // click end 
		}) // ready end
	</script>
</body>
</html>