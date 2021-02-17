<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>myBegiUntact.jsp</title>
</head>
<body id="page-top">
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">내가 참여한 챌린지를 확인하세요!!👓</h1>
		<br> <br>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary"></h6>
			</div>
			<div class="card-body">
				<div class="col-sm-12 col-md-6">
					<div class="dataTables_length" id="dataTable_length">

						<!-- 
						<label><select name="dataTable_length"
							aria-controls="dataTable"
							class="custom-select custom-select-sm form-control form-control-sm"><option
									value="10">Type</option>
								<option value="25">25</option>
								<option value="50">50</option>
								<option value="100">100</option></select> </label>
					 -->

					</div>
					<!-- 
					<div class="row">
						<div id="dataTable_filter" class="dataTables_filter">
							<label><input type="search"
								class="form-control form-control-sm">
								<button style="border: none; background: none;">🔍검색</button></label>
						</div>
					</div>
				 -->
				</div>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" cellspacing="0">
						<thead>
							<tr>
								<th>제목</th>
								<th>참여기간</th>
								<th>펀드액</th>
								<th>오늘 참여여부</th>
								<th>총 달성률(success)</th>
								<th>결과</th>
							</tr>
						</thead>
						<c:forEach items="${list }" var="list">
							<tbody>
								<tr>
									<td style="cursor: pointer;"
										onClick="location.href='/vegimeetSelect.do?meetId=${list.meetId }'">${list.meetTitle }</td>
									<td><fmt:formatDate value="${list.meetStart }"
											pattern="yyyy-MM-dd" /> ~ <fmt:formatDate
											value="${list.meetEnd }" pattern="yyyy-MM-dd" /></td>
									<td><fmt:formatNumber value="${list.myFund }"
											pattern="#,###" /> 원</td>
									<td><c:choose>
											<c:when test="${today <= list.meetEnd }">
												<c:if test="${list.todayFlag == true }">⭕</c:if>
												<c:if test="${list.todayFlag == false }">❌</c:if>
											</c:when>
											<c:when test="${today > list.meetEnd }">
											완료</c:when>
										</c:choose></td>
									<td><div class="row no-gutters align-items-center">
											<div class="col">
												<div>
												<%--
													<h4 class="small font-weight-bold">
														목표기간 (${list.totalDay }일) <span class="float-right">${list.dayAchiv }%</span>
													</h4>
													<div class="progress mb-4">
														<div class="progress-bar bg-danger" role="progressbar"
															style="width: ${list.dayAchiv }%" aria-valuenow="20"
															aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												 --%>
												</div>
												<div>
													<h4 class="small font-weight-bold">
														나의 달성률 <span class="float-right">${list.achiv }%</span>
													</h4>
													<div class="progress mb-4">
														<div class="progress-bar bg-success" role="progressbar"
															style="width: ${list.achiv }%" aria-valuenow="20"
															aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div></td>
									<td><c:choose>
											<c:when test="${today <= list.meetEnd }">참여중</c:when>
											<c:when test="${today > list.meetEnd }">완료</c:when>
										</c:choose></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
				<my:paging paging="${paging }" jsFunc="goList" />
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function goList(p) {
			location.href = "myBegiUntact.do?page=" + p
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