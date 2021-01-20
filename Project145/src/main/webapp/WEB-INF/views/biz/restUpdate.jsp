<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당상세</title>
<style>
.input-text {
	background: #f2f2f2;
	border: none;
	width: 97%;
}

.input-textarea {
	background: #f2f2f2;
	border: none;
	resize: none;
	width: 97%;
	padding: 1px;
}
</style>
</head>
<body>
	<div class="row">

		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<form id="frm" name="frm">
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
								<div>
									<input type="file" name="restPic" accept="image/*">
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
								<textarea class="input-textarea" name="restTime"
									style="width: 97%;">${restVo.restTime }</textarea>
								<p class="mb-0 mt-2">
									<strong>주소</strong>
								</p>
								<input type="text" class="input-text" name="restAddress" value="${restVo.restAddress }">
								<p class="mb-0 mt-2">
									<strong>연락처</strong>
								</p>
								<input type="text" class="input-text" name="restTel" value="${restVo.restTel }">
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
											<th class="sorting_asc" tabindex="0"
												aria-controls="dataTable" rowspan="1" colspan="1"
												aria-sort="ascending" style="width: 44px;">메뉴</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1" style="width: 54px;">채식타입</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1" style="width: 34px;">가격</th>
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

				<div align="center" class="mb-5 reservBtn">
					<button class="btn btn-primary" onclick="">수정</button>
					&nbsp;&nbsp;
					<button class="btn btn-primary" onclick="">취소</button>
				</div>
			</form>
		</div>
		<div class="col-lg-1"></div>
	</div>

</body>
</html>