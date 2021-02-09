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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.tr-hover:hover {
	background: #f8f9fc;
}
</style>
</head>
<body>
	<div class="container">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">받은 문의 목록</h6>
			</div>
			<div class="card-body">
				<c:if test="${fn:length(cEnqList) != 0 }">
					<div class="table-responsive">

						<div id="dataTable_wrapper"
							class="dataTables_wrapper dt-bootstrap4" style="width: 98%">
							<div class="row">
								<div class="col-sm-12">

									<table class="table table-bordered dataTable" id="dataTable"
										role="grid" aria-describedby="dataTable_info"
										style="width: 100%; text-align: center;">
										<thead>
											<tr role="row">
												<th style="width: 300px;">내용</th>
												<th style="width: 50px;">받은날짜</th>
												<th>상태</th>
												<th>옵션</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="cEnqList" items="${cEnqList }">
												<tr role="row" class="tr-hover">
													<td>${cEnqList.enqContent }</td>
													<td><a href="#">${cEnqList.enqDate}</a></td>
													<td>${cEnqList.enqResult }</td>
													<td>
														<button class="btn btn-outline-primary"
															value="${cEnqList.enqNo}" onclick='enqOpen(this)'
															style="font-size: 20px; z-index: 99;">
															<i class="fa fa-envelope-open-o"></i>
														</button>

														<button class="btn btn-outline-primary"
															onclick="classcollabo(this)"
															style="font-size: 20px; z-index: 99; padding: 9px 7px 3px 11px">
															<i class="fa fa-krw"></i>
														</button>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${fn:length(cEnqList) == 0 }">
					<h3>받은 문의가 없습니다.</h3>
				</c:if>
			</div>
		</div>
	</div>



	<div class="container">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">보낸 문의 목록</h6>
			</div>
			<div class="card-body">
				<c:if test="${fn:length(myEnqList) != 0 }">
					<div class="table-responsive">

						<div id="dataTable_wrapper"
							class="dataTables_wrapper dt-bootstrap4" style="width: 98%">
							<div class="row">
								<div class="col-sm-12">

									<table class="table table-bordered dataTable" id="dataTable"
										role="grid" aria-describedby="dataTable_info"
										style="width: 100%; text-align: center;">
										<thead>
											<tr role="row">
												<th style="width: 300px;">내용</th>
												<th style="width: 50px;">보낸날짜</th>
												<th>받은답변</th>
												<th>옵션</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="myEnqList" items="${myEnqList }">
												<tr role="row" class="tr-hover">
													<td>${myEnqList.enqContent }</td>
													<td><a href="#">${myEnqList.enqDate}</a></td>
													<td>${myEnqList.enqResult }</td>
													<td>
														<button class="btn btn-outline-primary"
															value="${myEnqList.enqNo}" onclick='enqOpen(this)'
															style="font-size: 20px; z-index: 99;">
															<i class="fa fa-envelope-open-o"></i>
														</button>

														<button class="btn btn-outline-primary"
															value="${myEnqList.enqNo}" onclick="enqdel(this)"
															style="font-size: 20px; z-index: 99;">
															<i class="fa fa-trash-o"></i>
														</button>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${fn:length(myEnqList) == 0 }">
					<h3>보낸 문의가 없습니다.</h3>
				</c:if>
			</div>
		</div>
	</div>

	<script>
		function enqDel(v) {
			console.log(v.value);
			if (confirm('해당 클래스를 삭제합니다.')) {
				location.href = 'enqDelete.do?enqNo=' + v.value;
			} else {
				alert('삭제 취소');
			}
		}
	</script>
</body>
</html>