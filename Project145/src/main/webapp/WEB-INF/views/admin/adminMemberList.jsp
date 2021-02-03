<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
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
			<form action="adminMemberSelect.do" method="get" id="frm">
				<div>
					<div class="col-sm-5 col-md-4 col-lg-1"
						style="margin-right: 0px; float: left;">
						<div class="dataTables_length" id="dataTable_length">
							<label> <select name="available" id="available"
								aria-controls="dataTable"
								class="custom-select custom-select-sm form-control form-control-sm">
									<option value="none" selected disabled>이용현황</option>
									<option value="able"
										<c:if test="${vo.available == 'able' }">selected="selected"</c:if>>이용가능</option>
									<option value="unable"
										<c:if test="${vo.available == 'unable' }">selected="selected"</c:if>>이용정지</option>
							</select>
							</label>
						</div>
					</div>
					<div class="" style="margin-right: 0px; float: left;">
						<div id="" class="dataTables_filter">
							<input type="search" id="keyword" name="keyword"
								class="form-control form-control-sm col-sm-4 col-md-6 col-lg-9"
								style="float: left;" value="${vo.getKeyword() }">
							<button style="border: 1px; background: none; float: right;" onclick = "location.href = 'javascript:frm.submit()'">검색</button>
						</div>
					</div>
				</div>
			</form>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>회원 ID</th>
								<th>회원이름</th>
								<th>이메일</th>
								<th>회원 권한</th>
								<th>누적신고 횟수</th>
								<th>이용 현황</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${adminMember }">
								<tr>
									<td id="mid">${vo.getMId() }</td>
									<td id="mname">${vo.getMName() }</td>
									<td id="email">${vo.email }</td>
									<td id="auth">${vo.auth }</td>
									<td id="report">${vo.report }</td>
									<td>
										<label> 
											<select name="dataTable_length" id="availableSelect"
											aria-controls="dataTable"
											class="custom-select custom-select-sm form-control form-control-sm">
												<option value="able"  <c:if test="${vo.available == 'able' }">selected="selected"</c:if>>이용가능</option>
												<option value="unable" <c:if test="${vo.available == 'unable' }">selected="selected"</c:if>>이용정지</option>
											</select>
										</label>
									</td>
								</tr>
							</c:forEach>
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
				<my:paging paging="${paging }" jsFunc="goList" />
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function goList(p) {
			var available = document.getElementById("available").value;
			var keyword = document.getElementById("keyword").value;

			if (available == "none" || keyword == '') {
				location.href = "adminMemberSelect.do?page=" + p
			} else {
				location.href = "adminMemberSelect.do?page=" + p
						+ "&available=" + available + "&keyword=" + keyword;
			}

		}
		
		
		$(function() {
			$("#availableSelect").change(function() {
				 var returnValue = confirm('회원의 이용현황을 바꾸시겠습니까?');
				 //alert(returnValue);

				 if ( returnValue == true ) {
					 console.log(returnValue);
					 if ("${vo.available}" == "able" ) {						
						 console.log('${vo.available}');
						 var memberId = $(this).$('#mid').val()
						 $.ajax({
							 url:'changUnable.do/' + memberId,
							 type:'post',
							 contentType:"json",
							 success:function(result) {
	
							 }
						 }) // ajax end
						 $(this).val("unable");
					 } else if ( '${available}' == 'unable' ) {
						 $.ajax({
							 url:'changAble.do' + memberId,
							 type:'post',
							 contentType:"json",
							 success:function(result) {
		
							 }
						 }) // ajax end
						 $(this).val("able");
					 }
				 } 
			})
		});
	</script>


</body>

</html>