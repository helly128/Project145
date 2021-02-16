<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myLikeRecipe.jsp</title>
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
			<h1 class="h3 mb-0 text-gray-800">내가 좋아하는 RECIPE 🧡</h1>
		</div>

		<div class="row">
			<c:forEach items="${list }" var="list">
				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card h-100">
						<img class="card-img-top" src="${list.rImage }" width="100"
							height="200" onerror="this.src='/images/loveurth2 (1).jpg'"
							alt="레시피 이미지"
							onclick="location.href='recipeDesc.do?rId=${list.rId}'"
							style="cursor: pointer;">
						<div class="card-body">
							<h4 class="card-title">${list.rTitle }</h4>
							<ul class="address" align="left">
								<li>베지타입 : ${list.rType }</li>
								<li>작성자 : ${list.mId }</li>
								<li>조회수 : ${list.rHit }</li>
							</ul>
						</div>
						<div class="card-footer" align="right">
							<button type="button" class="likeAction"
								data-id="${list.originId }">
								<img class="likeImg" src="/images/filled_like.png"
									style="width: 30px;" alt="꽉찬하트">
							</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<script>
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