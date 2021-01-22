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
	background: #f7f7f7;
	border: none;
	width: 97%;
	padding: 15px;
}

.input-textarea {
	background: #f7f7f7;
	border: none;
	resize: none;
	width: 97%;
	padding: 15px;
}

.div-image {
	position: relative;
	text-align: center;
	width: 150px;
	text-align: center;
	margin-top: 20px;
	margin-left: auto;
	margin-right: auto;
}

.label {
	position: relative;
	z-index: 0;
	display: inline-block;
	width: 100%;
	background: #6C9852;
	cursor: pointer;
	color: #fff;
	padding: 10px 0;
	text-transform: uppercase;
	font-size: 12px;
}

.restPic {
	display: inline-block;
	position: absolute;
	z-index: 1;
	width: 100%;
	height: 50px;
	top: 0;
	left: 0;
	opacity: 0;
	cursor: pointer;
}

.menu-input {
	border: none;
	width: 97%;
	text-align: center;
	vertical-align: bottom;
	padding: 5px;
	border-radius: 5px;
}

.deleteBtn {
	height: 35px;
}
</style>
<script>
	$(function() {
		$("#checkBox").change(function() {
			if ($("#checkBox").is(":checked")) {

			}
		})
	});
</script>
</head>
<body>
	<div class="row">

		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<form id="frm" name="frm" action="restBizUpdate.do">
				<div class="row">
					<div class="col-lg-5 mb-4">
						<div class="card shadow h-100">
							<!-- Card Header - Dropdown -->
							<div
								class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary">대표 사진</h6>
							</div>
							<!-- Card Body -->
							<div class="image-container p-3">
								<img id="rest-image" src="${restVo.restPic }" width="100%">
								<div class="div-image">
									<span class="label">사진 업로드</span> <input type="file"
										name="restPic" class="restPic" accept="image/*"
										onchange="setImage(event);">
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
								<input type="hidden" name="restId" value="${restVo.restId }">
								<h3 class="fw-bold">
									<strong>${restVo.restName }</strong>
								</h3>
								<p class="mb-2 mt-4">
									<strong>운영시간</strong>
								</p>
								<textarea class="input-textarea mb-2" name="restTime"
									style="width: 97%;" rows=3>${restVo.restTime }</textarea>
								<p class="mb-2 mt-2">
									<strong>주소</strong>
								</p>
								<input type="text" class="input-text mb-4" name="restAddress"
									value="${restVo.restAddress }">
								<p class="mb-2 mt-2">
									<strong>연락처</strong>
								</p>
								<input type="text" class="input-text" name="restTel"
									value="${restVo.restTel }">
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
							<div class="card-body mx-3">
								<table class="table dataTable" id="dataTable" width="100%"
									cellspacing="0" role="grid" aria-describedby="dataTable_info"
									style="width: 100%; text-align: center;">
									<thead>
										<tr role="row">
											<th class="sorting_asc" tabindex="0"
												aria-controls="dataTable" aria-sort="ascending"
												style="width: 44px;">메뉴</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												style="width: 35px;">채식타입</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												style="width: 34px;">가격</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												style="width: 20px;">삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="menuVo" items="${menuList }">
											<input type="hidden" name="menuId" value="${menuVo.menuId }">
											<tr role="row" class="tr-hover">
												<td><input class="menu-input" type="text"
													name="menuName" value="${menuVo.menuName }"></td>
												<td><input class="menu-input" type="text"
													name="menuVegeType" value="${menuVo.menuVegeType }"></td>
												<td><input class="menu-input" type="text"
													name="menuPrice" value="${menuVo.menuPrice }"></td>
												<td><input type="checkbox" id="checkBox"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div align="center" class="mb-5 reservBtn">
					<input type="submit" class="btn btn-primary" value="수정">
					&nbsp;&nbsp; <input type="reset" class="btn btn-primary" value="취소">
				</div>
			</form>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<script>
		function setImage(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.getElementById("rest-image");
				img.setAttribute("src", event.target.result);

			}

			reader.readAsDataURL(event.target.files[0]);
		}

		function deleteRow(event) {

		}
	</script>
</body>
</html>