<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>adminMemeber</title>

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
		<h1 class="h3 mb-2 text-gray-800">회원 관리</h1>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
			</div>
			<div class="card-body">
				<div class="col-sm-12 col-md-6">
					<div class="dataTables_length" id="dataTable_length">
						<label>
						<select name="dataTable_length"
							aria-controls="dataTable"
							class="custom-select custom-select-sm form-control form-control-sm">
							<option value="10">Type</option>
							<option value="25">25</option>
							<option value="50">50</option>
							<option value="100">100</option>
						</select> 
						</label>
					</div>
					<div id="dataTable_filter" class="dataTables_filter">
						<label>
						<input type="search" class="form-control form-control-sm">
						<button style="border: 1px; background: none;">검색</button>
						</label>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>회원 ID</th>
								<th>비건 타립</th>
								<th>이메일</th>
								<th>회원 권한</th>
								<th>누적신고 횟수</th>
								<th>이용 현황</th>
							</tr>
						</thead>
						<tbody>
							<c:foreach var="vo items="${ }">
							<tr>
								<td>${vo.getMId() }</td>
								<td>${vo.getVegtype() }</td>
								<td>${vo.getEmail() }</td>
								<td>${vo.getAuth() }</td>
								<td>${vo.getReport() }</td>
								<td>
								<label>
									<select name="dataTable_length"
											aria-controls="dataTable"
											class="custom-select custom-select-sm form-control form-control-sm">
										<option value="able">이용가능</option>
										<option value="unable">이용정지</option>
									</select> 
								</label>
								
								</td>
							</tr>
							</c:foreach>
						</tbody>
						<tfoot>
							<tr>
								<th>회원 ID</th>
								<th>비건 타립</th>
								<th>이메일</th>
								<th>회원 권한</th>
								<th>누적신고 횟수</th>
								<th>이용 현황</th>
							</tr>
						</tfoot>
					</table>
				</div>
				<div class="dataTables_paginate paging_simple_numbers"
					id="dataTable_paginate">
					<ul class="pagination">
						<li class="paginate_button page-item previous disabled"
							id="dataTable_previous"><a href="#"
							aria-controls="dataTable" data-dt-idx="0" tabindex="0"
							class="page-link">Previous</a></li>
						<li class="paginate_button page-item active"><a href="#"
							aria-controls="dataTable" data-dt-idx="1" tabindex="0"
							class="page-link">1</a></li>
						<li class="paginate_button page-item "><a href="#"
							aria-controls="dataTable" data-dt-idx="2" tabindex="0"
							class="page-link">2</a></li>
						<li class="paginate_button page-item "><a href="#"
							aria-controls="dataTable" data-dt-idx="3" tabindex="0"
							class="page-link">3</a></li>
						<li class="paginate_button page-item "><a href="#"
							aria-controls="dataTable" data-dt-idx="4" tabindex="0"
							class="page-link">4</a></li>
						<li class="paginate_button page-item "><a href="#"
							aria-controls="dataTable" data-dt-idx="5" tabindex="0"
							class="page-link">5</a></li>
						<li class="paginate_button page-item next" id="dataTable_next"><a
							href="#" aria-controls="dataTable" data-dt-idx="6" tabindex="0"
							class="page-link">Next</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>

</html>