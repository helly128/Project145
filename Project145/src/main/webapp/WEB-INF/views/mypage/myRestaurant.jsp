<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>myBegiContact</title>
</head>
<body id="page-top">
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">내가 예약한 Restaurant를 확인하세요!! 💛</h1>
		<br>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">예약시간을 잊지마세요^^</h6>
			</div>
			<div class="card-body">
				<!-- 
				<div class="col-sm-12 col-md-6">
					<div class="dataTables_length" id="dataTable_length">
						<label><select name="dataTable_length"
							aria-controls="dataTable"
							class="custom-select custom-select-sm form-control form-control-sm"><option
									value="10">Type</option>
								<option value="25">25</option>
								<option value="50">50</option>
								<option value="100">100</option></select> </label>
					</div>
					<div id="dataTable_filter" class="dataTables_filter">
						<label><input type="search"
							class="form-control form-control-sm">
							<button style="border: none; background: none;">🔍검색</button></label>
					</div>
				</div>
			 -->
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>식당이름</th>
								<th>예약날짜</th>
								<th>예약자명</th>
								<th>예약인원</th>
								<th>예약현황</th>
							</tr>
						</thead>
						<c:forEach var="list" items="${list }">
							<tbody>
								<tr>
									<td
										onClick="location.href='restaurantDetail.do?restId=${list.rId}'"
										style="cursor: pointer;">${list.restName }</td>
									<td><fmt:formatDate value="${list.restReservDate }"
											pattern="yyyy-MM-dd HH:mm" /></td>
									<td>${list.restReservName }</td>
									<td>${list.restReservPeople }</td>
									<td>${list.restReservStatus }</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
				<my:paging paging="${paging }" jsFunc="goList" />
			</div>
		</div>
	</div>
	<script>
		function goList(p) {
			location.href = "myRestaurant.do?page=" + p;
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