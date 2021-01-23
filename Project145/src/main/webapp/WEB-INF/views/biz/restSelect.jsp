<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당상세</title>
</head>
<body>
	<div class="row">

		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<div class="row">
				<div class="col-lg-5 mb-4">
					<div class="card shadow h-100">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">대표 사진</h6>
						</div>
						<!-- Card Body -->
						<div class="card-body">
							<div class="p-2">
								<img src="${restVo.restPic }" width="100%">
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-7 mb-4">
					<div class="card shadow h-100">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">식당 정보</h6>
						</div>
						<div class="card-body">
							<h3 class="fw-bold">
								<strong>${restVo.restName }</strong>
							</h3>
							<p class="mb-0 mt-4">
								<strong>운영시간</strong>
							</p>
							<p>${restVo.restTime }</p>
							<p class="mb-0 mt-2">
								<strong>주소</strong>
							</p>
							<p>${restVo.restAddress }</p>
							<p class="mb-0 mt-2">
								<strong>연락처</strong>
							</p>
							<p>${restVo.restTel }</p>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">메뉴</h6>
						</div>
						<div class="card-body">
							<table class="table dataTable" id="dataTable" width="100%"
								cellspacing="0" role="grid" aria-describedby="dataTable_info"
								style="width: 100%; text-align: center;">
								<thead>
									<tr role="row">
										<th style="width: 44px;">메뉴</th>
										<th style="width: 54px;">채식타입</th>
										<th style="width: 34px;">가격</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="menuVo" items="${menuList }">
										<tr role="row" class="tr-hover">
											<td>${menuVo.menuName }</td>
											<td>${menuVo.menuVegeType }</td>
											<td><fmt:formatNumber value="${menuVo.menuPrice }"
													pattern="#,###" />원</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div align="center" class="mb-5 restBtn">
				<button class="btn btn-primary" onclick="location.href='restBizDetail.do?restId=${restVo.restId}'">가게 정보 수정</button>
				&nbsp;&nbsp;
				<button class="btn btn-primary" onclick="">가게 삭제</button>
			</div>
			<div class="mb-5">
				<hr>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">예약</h6>
							<div class="dropdown no-arrow">
								<a class="dropdown-toggle" href="#" role="button"
									id="dropdownMenuLink" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> <i
									class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
								</a>
								<div
									class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
									aria-labelledby="dropdownMenuLink" style="">
									<div class="dropdown-header">예약상태</div>
									<a class="dropdown-item" href="#">예약대기</a> <a
										class="dropdown-item" href="#">예약완료</a>
								</div>
							</div>
						</div>
						<!-- Card Body -->
						<div class="card-body">
							<table class="table dataTable" id="dataTable" width="100%"
								cellspacing="0" role="grid" aria-describedby="dataTable_info"
								style="width: 100%; text-align: center;">
								<thead>
									<tr role="row">
										<th style="width: 15px;"><input type="checkbox"
											class="table-checkbox"></th>
										<th class="sorting_asc" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" aria-sort="ascending"
											style="width: 44px;">예약자아이디</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" style="width: 54px;">예약자명</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" style="width: 54px;">예약일</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" style="width: 20px;">인원</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" style="width: 34px;">예약상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="reservVo" items="${reservList }">
										<tr role="row" class="tr-hover">
											<td><input type="checkbox" class="td-checkbox"></td>
											<td>${reservVo.getMId() }</td>
											<td>${reservVo.restReservName }</td>
											<td>${reservVo.restReservDate }</td>
											<td>${reservVo.restReservPeople }</td>
											<td>${reservVo.restReservStatus }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div align="center" class="mb-5 reservBtn">
				<button class="btn btn-primary" onclick="">예약 수락</button>
				&nbsp;&nbsp;
				<button class="btn btn-primary" onclick="">예약 거절</button>
			</div>
		</div>
		<div class="col-lg-1"></div>
	</div>

</body>
</html>