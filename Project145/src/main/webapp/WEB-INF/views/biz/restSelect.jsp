<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<div class="col-lg-5">
					<div class="card shadow mb-4">
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
				<div class="col-lg-7">
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">식당 정보</h6>
						</div>
						<div class="card-body" style="height: 100%">
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
						<div class="card-body">The styling for this basic card
							example is created by using default Bootstrap utility classes. By
							using utility classes, the style of the card component can be
							easily modified with no need for any custom CSS!</div>
					</div>
				</div>
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
						<div class="card-body">Dropdown menus can be placed in the
							card header in order to extend the functionality of a basic card.
							In this dropdown card example, the Font Awesome vertical ellipsis
							icon in the card header can be clicked on in order to toggle a
							dropdown menu.</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-1"></div>
	</div>

</body>
</html>