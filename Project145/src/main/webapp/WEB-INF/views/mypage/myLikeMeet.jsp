<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>likeMeet.jsp</title>
<style type="text/css">
.likeAction {
	border: none;
	background: transparent;
}
</style>
</head>
<body>
	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">내가 좋아하는 챌린지 💜</h1>
		</div>

		<div class="row">
			<c:forEach items="${list }" var="list">
				<div class="col-xl-3 col-md-6 mb-4">
					<div class="card border-left-success shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<button type="button" class="likeAction"
										data-id="${list.originId }" align="center">
										<img class="likeImg" src="/images/filled_like.png"
											style="width: 30px;" alt="꽉찬 하트">
									</button>
									<br> <br>
									<div
										class="text-xs font-weight-bold text-success text-uppercase mb-1">
										<fmt:formatDate value="${list.meetStart }"
											pattern="yyyy-MM-dd" />
										-
										<fmt:formatDate value="${list.meetEnd }" pattern="yyyy-MM-dd" />
									</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800"
										onClick="location.href='/vegimeetSelect.do?meetId=${list.meetId }'"
										style="cursor: pointer;">${list.meetTitle }</div>
									<br> <span style="font-size: 10">펀드금액 : <fmt:formatNumber
											value="${list.meetFund }" pattern="#,###" /> 원
									</span>
								</div>
							</div>

						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<script>
			function dateFormat(dat) {
				var date = new Date(dat);
				var year = date.getFullYear();
				var month = date.getMonth() + 1;
				var day = date.getDate();
				if (min < 10) {
					min = '0' + min;
				}
				var newDate = year + "-" + month + "-" + day;
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