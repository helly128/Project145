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
		<h1 class="h3 mb-2 text-gray-800">내가 만든 MEET를 확인하세요!!👓</h1>
		<br> <br>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary"></h6>
			</div>
			<div class="card-body">
				<div class="col-sm-12 col-md-6">
					<!-- 
					<div id="dataTable_filter" class="dataTables_filter">
						<label><input type="search"
							class="form-control form-control-sm">
							<button style="border: none; background: none;">🔍검색</button></label>
					</div>
				 -->
				</div>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>제목</th>
								<th>참여기간</th>
								<th>참여자수</th>
								<th>펀드총액</th>
								<th>참여자 평균 달성율</th>
							</tr>
						</thead>
						<c:forEach items="${list }" var="list">
							<tbody>
								<tr>
									<td>${list.meetTitle}</td>
									<td><fmt:formatDate value="${list.meetStart }"
											pattern="yyyy-MM-dd" /> - <fmt:formatDate
											value="${list.meetEnd }" pattern="yyyy-MM-dd" /></td>
									<td>${list.meetParticipant }</td>
									<td><fmt:formatNumber value="${list.meetFund }"
											pattern="#,###" /> 원</td>
									<td><div class="row no-gutters align-items-center">
											<div class="col-auto">
												<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${list.allAchiv }%</div>
											</div>
											<div class="col">
												<div class="progress progress-sm mr-2">
													<div class="progress-bar bg-info" role="progressbar"
														style="width: ${list.allAchiv }%" aria-valuenow="50"
														aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
										</div></td>
								</tr>
							</tbody>
						</c:forEach>
						<tfoot>
							<tr>
								<th>제목</th>
								<th>참여기간</th>
								<th>참여자수</th>
								<th>펀드총액</th>
								<th>참여자 평균 달성율</th>
							</tr>
						</tfoot>
					</table>
				</div>
				<my:paging paging="${paging }" jsFunc="goList" />
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
		function goList(p) {
			location.href = "myMeet.do?page=" + p;
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