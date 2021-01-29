<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>myBegiContact</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>

<body id="page-top">
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">내가 예약한 Restaurant를 확인하세요!! 💛</h1><br>
		
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
									<td>${list.restName }</td>
									<td><fmt:formatDate value="${list.restReservDate }"
											pattern="yyyy-MM-dd HH:mm" /></td>
									<td>${list.restReservName }</td>
									<td>${list.restReservPeople }</td>
									<td>${list.restReservStatus }</td>
								</tr>
							</tbody>
						</c:forEach>
						<tfoot>
							<tr>
								<th>식당이름</th>
								<th>예약날짜</th>
								<th>예약자명</th>
								<th>예약인원</th>
								<th>예약현황</th>
							</tr>
						</tfoot>
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