<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.tr-hover:hover {
	background: #f8f9fc;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="container">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">식당 목록</h6>
			</div>
			<div class="card-body">

				<div class="table-responsive">
					<div id="dataTable_wrapper"
						class="dataTables_wrapper dt-bootstrap4" style="width: 98%">
						<div class="row">
							<div class="col-sm-12">
								<c:if test="${auth =='rbiz' }">
									<div align="right" class="mb-2">
										<button class="btn btn-outline-primary"
											onclick="location.href='restBizInsertForm'">식당 추가</button>
									</div>
								</c:if>
								<c:if test="${fn:length(restList) != 0 }">
									<table class="table table-bordered dataTable" id="dataTable"
										cellspacing="0" role="grid" aria-describedby="dataTable_info"
										style="width: 100%; text-align: center;">
										<thead>
											<tr role="row">
												<th style="width: 45px;">가게명</th>
												<th style="width: 60px;">위치</th>
												<th style="width: 34px;">예약요청</th>
												<th style="width: 34px;">예약완료</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="restaurant" items="${restList }">
												<tr role="row" class="tr-hover"
													onclick="location.href='restBizSelect.do?restId=${restaurant.restId }'">
													<td>${restaurant.restName }</td>
													<td>${restaurant.restAddress }</td>
													<td>${restaurant.restReservWait }</td>
													<td>${restaurant.restReservAccept }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
							</div>
						</div>
					</div>
				</div>

				<c:if test="${fn:length(restList) == 0 }">
					<div style="text-align: center;">
						<h3>등록된 식당이 없습니다.</h3>
					</div>
				</c:if>
			</div>
		</div>
	</div>


</body>
</html>