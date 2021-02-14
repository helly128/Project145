<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
	border: 1px solid #8c8c8c;
	width: 97%;
	text-align: center;
	vertical-align: bottom;
	padding: 5px;
	border-radius: 8px;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div class="row">

		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<form id="frm" name="frm" action="restBizInsert.do" method="post" encType="multipart/form-data">
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
								<img id="rest-image" src="/images/images-empty.png" width="100%" alt="restaurant image">
								<div class="div-image">
									<span class="label">사진 업로드</span> <input type="file"
										name="uploadfile" class="restPic" accept="image/*"
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
								<p class="mb-2 mt-2">
									<strong>식당명 (*필수)</strong>
								</p>
								<input type="text" class="input-text mb-4" name="restName" required>
								<p class="mb-2 mt-4">
									<strong>운영시간</strong>
								</p>
								<textarea class="input-textarea mb-2" name="restTime"
									style="width: 97%;" rows=3></textarea>
								<p class="mb-2 mt-2">
									<strong>주소 (*필수)</strong>
								</p>
								<input type="text" class="input-text mb-4" name="restAddress" required>
								<p class="mb-2 mt-2">
									<strong>연락처 (*필수)</strong>
								</p>
								<input type="text" class="input-text" name="restTel" required>
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
											<th style="width: 44px;">메뉴</th>
											<th style="width: 30px;">채식타입</th>
											<th style="width: 34px;">가격</th>
											<th style="width: 20px;">삭제</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
								<div class="d-grid gap-2 d-md-flex justify-content-md-end">
									<button type="button" id="addMenuBtn" class="btn btn-primary">메뉴추가</button>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div align="center" class="mb-5 reservBtn">
					<input type="submit" class="btn btn-primary" value="입력">
					&nbsp;&nbsp; <input type="reset" class="btn btn-primary" value="리셋">
					&nbsp;&nbsp; <button type="button" class="btn btn-primary" onclick="location.href='restBizList.do'">목록보기</button>
				</div>
			</form>
		</div>
		<div class="col-lg-1"></div>
	</div>
	
	
	<script>
		//사진 미리보기 설정
		function setImage(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.getElementById("rest-image");
				img.setAttribute("src", event.target.result);

			}

			reader.readAsDataURL(event.target.files[0]);
		}

		//checkbox 중 체크된 row만 value 설정해서 delete
		function checkForm() {
			$("#checkBox").change(function() {
				if ($("#checkBox").is(":checked")) {
					$("#checkBox").value("true");
				}
			})
		}
		
		$(function(){
			var length = 0;
			//메뉴추가 버튼 클릭 시 행 추가
			$("#addMenuBtn").on('click', function(){
				var tr = $("<tr>").attr("role", "row");
				tr.append($("<td>").append($("<input>").addClass('menu-input').attr({
					type: 'text',
					name: 'menuVoList['+length+'].menuName',
					required: 'true'
				})));
				tr.append($("<td>").append($("<input>").addClass('menu-input').attr({
					type: 'text',
					name: 'menuVoList['+length+'].menuVegeType'
				})));
				tr.append($("<td>").append($("<input>").addClass('menu-input').attr({
					type: 'text',
					name: 'menuVoList['+length+'].menuPrice',
					required: 'true'
				})));
				tr.append($("<td>").append($("<button>").addClass('btn btn-primary deleteBtn deleteBtn'+length).attr({
					type: 'button'
				}).text('입력 취소')));
				var menuFlag = $("<input>").addClass('menuFlag'+length).attr({
					type: 'hidden',
					name: 'menuVoList['+length+'].newMenuFlag',
					value: 'true'
				});
				
				$("#dataTable > tbody").append(tr);
				$("#dataTable > tbody").append(menuFlag);
				
				length++;
			});
			
			
			//입력취소 버튼 누르면 해당하는 행, newMenuFlag 삭제
			$('#dataTable').on('click', '.deleteBtn', function(){
				$(this).closest('tr').remove();
				var className = $(this).attr('class').split(' ');
				var num = className[3].replace('deleteBtn', '');
				$('.menuFlag' + num).remove();
			});
		});
		
	</script>
</body>
</html>