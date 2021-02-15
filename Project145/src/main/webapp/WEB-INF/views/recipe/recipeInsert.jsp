<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recipe Insert</title>
<style>
input, textarea {
	border: 1px solid #6C9852;
	width: 100%;
}

row.plus {
	margin-left: 20%;
	margin-right: 20%;
}

.addMat, .deleteMat {
	background: transparent;
	border: none;
	font-size: 35px;
	color: #6C9852;
}

.matInput {
	margin: 0px;
}
</style>
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<div class="container">
		<div>
			<a href="/recipeMain.do" style="margin-top: 5%"><h2>⬅</h2></a>
		</div>
		<div class="category-list-item">
			<form id="frm" action="/recipeInsertResult.do" method="post"
				onsubmit="return checkForm();">
				<h3>recipe title🍏</h3>
				<div class="my-3">
					<select name="rType" id="rType">
						<option value="" selected disabled>비건 레벨</option>
						<option value="비건">비건</option>
						<option value="락토">락토</option>
						<option value="오보">오보</option>
						<option value="락토오보">락토오보</option>
					</select>
				</div>
				<input type="text" name="rTitle" placeholder="제목을 입력하세요" required>
				<br />
				<p style="color: red">
					<strong>*업로드한 사진 중 첫번째 사진이 대표사진으로 등록됩니다. 한 개 이상의 사진을
						등록해주세요.</strong>
				</p>
				<div>
					<textarea id="ckeditor" required></textarea>
				</div>
				<input type="hidden" name="rContent" id="rContent"> <input
					type="hidden" name="rImage" id="rImage">
				<hr>
				<br />
				<!-- 관련 재료 -->
				<h3>Ingredient🍋</h3>
				<br />
				<div class="material">
					Used Ingredient<br /> <br />
					<div class="row mb-3">
						<div class="col-lg-5 col-md-5 col-sm-12">
							<input type="text" class="matInput" name="recipeMatVoList[0].matName" placeholder="재료명 (예: 두부)">
						</div>
						<div class="col-lg-5 col-md-5 col-sm-12">
							<input type="text" class="matInput" name="recipeMatVoList[0].matVol" placeholder="분량 (예: 한 모)">
						</div>
						<div class="col-lg-2 col-md-2 col-sm-12" style="display: flex; align-items: center;">
							<button type="button" class="deleteMat">
								<i class="lni lni-circle-minus"></i>
							</button>
						</div>
					</div>
				</div>
				<button type="button" class="addMat mt-3">
					<i class="lni lni-circle-plus"></i>
				</button>


				<hr />
				<br />
				<!-- 관련 클래스 -->
				<div class="row">
					<h3>Related Class📖</h3>
					<div>
						<div class="plus">
							<br />

							<div class="col-lg-12" align="center">
								<table align="center">
									<tr>
										<td class="col-md-2" align="center" valign="middle"><select
											id="vegType">
												<option value="" selected disabled>비건 레벨</option>
												<option value="">전체</option>
												<option value="비건">비건</option>
												<option value="락토">락토</option>
												<option value="오보">오보</option>
												<option value="락토오보">락토오보</option>
										</select></td>

										<td class="col-md-7"><input type="text"
											placeholder="Search Class" size="1000" id="keyword"
											name="keyword"></td>
										<td class="col-md-1"></td>
										<td class="col-md-1"><button class="btn btn-primary"
												id="searchC" name="searchC" type="button">search</button></td>
									</tr>
								</table>
							</div>
							<div id="search-result" align="center">class search result</div>
							<br /> <br />
						</div>

					</div>
				</div>
				<br />
				<p style="text-align: right;">
					*레시피 작성을 통한 적립은 하루 5회로 제한됩니다.
				</p>
				<div class="mb-5" align="center">
					<button type="button" id="submitBtn" class="btn main-btn btn-hover">저장</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		//ck에디터 세팅
		var ckeditor_config = {
			resize_enable : false,
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode : CKEDITOR.ENTER_P,
			filebrowserUploadUrl : "/ckEditorUpload.do",
			uploadUrl : "/ckEditorUpload.do"
		};

		CKEDITOR.replace('ckeditor', ckeditor_config);

		$(function() {
			$("#searchC")
					.click(
							function() {
								/* //alert("검색 버튼 클릭!");
								var keyword = $("#searchCd").serialize(); */
								$
										.ajax({
											url : '/recipeLessonSearch.do',
											type : 'POST',
											dataType : "json",
											data : {
												keyword : $("#keyword").val(),
												vegType : $("#vegType").val()
											},
											success : function(data) {
												console.log(data);
												if (data.length > 0) {
													var output = "<table class='table table-borderless table-hover' style='width: 64%'>";
													for ( var i in data) {
														output += "<tr>";
														output += "<td width='100'>"
																+ data[i].lname;
														output += "<td width='300'>"
																+ data[i].ctitle;
														
														output += "<td width='50'>"
																+ "<input type='checkbox' name='cIdArr' value='"+data[i].cid+"' class='class-checked' style='margin:0px; zoom:1.3;'>";
														output += "</tr>"
													}
													output += "</table>";
												} else {
													var output = "<p>일치하는 결과가 없습니다</p>";
												}
												$("#search-result")
														.html(output);
												// success
											},
											error : function() {
												alert("ajax통신 실패!!!");
											}
										});
							});

			$('#submitBtn').on('click', function() {
				$('#frm').submit();
			});
			
			//메뉴추가 버튼
			var length = 1;
			$('.addMat').on('click', function(){
				var output=`<div class="row mb-3">
								<div class="col-lg-5 col-md-5 col-sm-12">
									<input type="text" class="matInput" name="recipeMatVoList[\${length}].matName" placeholder="재료명 (예: 두부)">
								</div>
								<div class="col-lg-5 col-md-5 col-sm-12">
									<input type="text" class="matInput" name="recipeMatVoList[\${length}].matVol" placeholder="분량 (예: 한 모)">
								</div>
								<div class="col-lg-2 col-md-2 col-sm-12" style="display: flex; align-items: center;">
									<button type="button" class="deleteMat">
										<i class="lni lni-circle-minus"></i>
									</button>
								</div>
							</div>`;
				$('.material').append(output);
				length++;
			});
			
			
			//메뉴삭제 버튼
			$('.material').on('click', '.deleteMat', function(){
				$(this).closest('.row').remove();
			});
		});

		function checkForm() {
			var vegType = $('#rType').val();
			var content = CKEDITOR.instances.ckeditor.getData();
			var imgTag = findImgTag(content);
			console.log(imgTag);
			if (vegType == null || vegType == '') {
				alert('레시피의 채식유형을 선택하세요');
				return false;
			} else if (content.length < 1) {
				alert('내용을 입력해주세요');
				return false;
			} else if (imgTag == undefined) {
				alert('사진을 한 개 이상 등록해주세요. 대표사진이 필요합니다.');
				return false;
			} else {
				$('#rContent').val(content);
				$('#rImage').val(imgTag);
				return true;
			}

		}

		//이미지태그 찾기
		function findImgTag(content) {
			var srcIndex = content.indexOf('img src'); //첫 이미지 태그의 index
			var subStr = content.substr(srcIndex);
			var splitStr = subStr.split('"');
			var imgTag = splitStr[1];
			return imgTag;
		}
	</script>

</body>
</html>