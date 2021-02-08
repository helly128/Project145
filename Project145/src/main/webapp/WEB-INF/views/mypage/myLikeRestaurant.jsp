<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myLikeRestaurant.jsp</title>
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
			<h1 class="h3 mb-0 text-gray-800">내가 좋아하는 RESTAURANT 🧡</h1>
		</div>

		<div class="row">
			<c:forEach items="${list }" var="list">
				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card h-100">
						<img class="card-img-top" src="/images/${list.restPic }"
							width="100" height="200"
							onerror="this.src='/images/loveurth (3).jpg'"
							style="cursor: pointer;"
							onClick="location.href='restaurantDetail.do?restId=${list.rId}'">
						<div class="card-body">
							<h4 class="card-title"
								onClick="location.href='restaurantDetail.do?restId=${list.rId}'"
								style="cursor: pointer;">${list.restName }</h4>
							<ul class="address" align="left">
								<li>주소 : <br>${list.restAddress }</li>
								<br>
								<li>연락처 : <br>${list.restTel }</li>
								<br>
								<li>리뷰수 : ${list.restReviewCount }</li>
							</ul>
						</div>
						<div class="card-footer" align="right">
							<button type="button" class="likeAction"
								data-id="${list.originId }">
								<img class="likeImg" src="/images/filled_like.png"
									style="width: 30px;">
							</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<script type="text/javascript">
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