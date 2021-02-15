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

<title>adminRestaurant</title>

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
		<h1 class="h3 mb-2 text-gray-800">식당 관리</h1>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">식당 목록</h6>
			</div>
			<div class="card-body">
			<form action="adminRestaurant.do" method="get" id="frm">
				<div>
					<div class="col-sm-5 col-md-4 col-lg-2"
						style="margin-right: 0px; float: left;">
						<div class="dataTables_length" id="dataTable_length">
							<label> 
								<select name="adminConfirm" id="adminConfirm"
										aria-controls="dataTable"
										class="custom-select custom-select-sm form-control form-control-sm">
									<option value="" selected>전 체</option>
									<option value="true"
										<c:if test="${vo.adminConfirm == 'true' }">selected="selected"</c:if>>등록허가
									</option>
									<option value="false"
										<c:if test="${vo.adminConfirm == 'false' }">selected="selected"</c:if>>등록대기
									</option>
									<option value="canceled"
										<c:if test="${vo.adminConfirm == 'canceled' }">selected="selected"</c:if>>등록거부
									</option>
							</select>
							</label>
						</div>
					</div>
					<div class="" style="margin-right: 0px; float: left;">
						<div id="" class="dataTables_filter">
							<input type="search" id="keyword" name="keyword" placeholder="식당ID/이름"
								class="form-control form-control-sm col-sm-4 col-md-6 col-lg-9"
								style="float: left;" value="${vo.getKeyword() }">
							<button style="border: 1px; background: none; float: right;" onclick = "location.href = 'javascript:frm.submit()'">검색</button>
						</div>
					</div>
				</div>
			</form>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>식당 ID</th>
								<th>식당이름</th>
								<th>등록 현황</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vo" items="${adminRestaurant }">
								<tr>
									<td id="restid">${vo.getRestId() }</td>
									<td id="restname"  onclick="location.href='/restAdminConfirm.do?rest=${vo.getRestId() }'" style="cursor:pointer;">
											${vo.getRestName() }</td>
									<td id="adminConfirmSelect">
											<c:if test="${vo.adminConfirm == 'true' }">등록허가</c:if>
											<c:if test="${vo.adminConfirm == 'false' }">등록대기</c:if>
											<c:if test="${vo.adminConfirm == 'canceled' }">등록거부</c:if>
									</td>
									<td id="confirmReason">${vo.getConfirmReason() }</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>식당 ID</th>
								<th>식당이름</th>
								<th>등록 현황</th>
								<th>비고</th>
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
			var adminConfirm = document.getElementById("adminConfirm").value;
			var keyword = document.getElementById("keyword").value;

			if (adminConfirm == "none" || keyword == '') {
				location.href = "adminRestaurant.do?page=" + p
			} else {
				location.href = "adminRestaurant.do?page=" + p
				+ "&restaurant=" + restaurant + "&keyword=" + keyword;
			}

		}
		
		
 		/* 회원이용현황 변경 */
/*		function changeAvailable(c) {
			 var returnValue = confirm('회원의 이용현황을 바꾸시겠습니까?');
			 //alert(returnValue);
			 if ( returnValue == true ) {
				//console.log(returnValue);
				//console.log(c.value);
				var memberId = $(c).data("mid");//$(c).closest("tr").find("td").eq(0).text()
				$.ajax({
				 url:'changeAvailable.do' ,
				 data:{mId:memberId, available:c.value},
				 type:'post',
				 dataType:"json",
				 success:function(result) {
				 	if(result == 1) {
				 		alert("상태변경이 성공했습니다.")
				 	} else {
				 		alert("상태변경에 실패했습니다.");
				 		if(c.value == 'able') {
							$(this).val("unable");				 			
				 		}else{
				 			$(this).val("able");
				 		}
				 		
				 	}				 
				 }
				}) // ajax end
					 

			 } 
		} */
	</script>


</body>

</html>