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

.addMat {
	background: transparent;
	border: none;
	font-size: 35px;
	color: #6C9852;
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
			<form action="/recipeInsertResult.do" onsubmit="return checkForm();">
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
				<input type="text" name="rTitle" placeholder="제목을 입력하세요" required> <br />
				<p style="color: red"><strong>*업로드한 사진 중 첫번째 사진이 대표사진으로 등록됩니다.</strong></p>
				<div>
					<textarea id="ckeditor" required></textarea>
				</div>
				<input type="hidden" name="rContent" id="rContent">
				<hr>
				<br />
				<!-- 관련 재료 -->
				<h3>Ingredient🍋</h3>
				<br />
				<div class="material">
					Used Ingredient<br /> <br />
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-12">
							<input type="text" id="" name="matName" placeholder="재료명 (예: 두부)">
						</div>
						<div class="col-lg-6 col-md-6 col-sm-12">
							<input type="text" id="" name="matVol" placeholder="분량 (예: 한 모)">
						</div>
					</div>
				</div>
				<button type="button" class="addMat">
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
												<option value="비건"
													<c:if test="${lessonVO.getVegType() == '비건' }">selected="selected"</c:if>>비건</option>
												<option value="락토"
													<c:if test="${lessonVO.getVegType() == '락토' }">selected="selected"</c:if>>락토</option>
												<option value="오보"
													<c:if test="${lessonVO.getVegType() == '오보' }">selected="selected"</c:if>>오보</option>
												<option value="락토오보"
													<c:if test="${lessonVO.getVegType() == '락토오보' }">selected="selected"</c:if>>락토오보</option>
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
				<div class="mb-5" align="center">
					<button type="submit" id="submitBtn" class="btn main-btn btn-hover">저장</button>
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
			uploadUrl: "/ckEditorUpload.do"
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
												vegType : $("#vegType")
														.val()
											},
											success : function(data) {
												console.log(data);
												var output = "<table>";
												for ( var i in data) {
													output += "<tr>";
													output += "<td width='100'>"
															+ data[i].lname;
													output += "<td width='200'>"
															+ data[i].ctitle;
													output += "<td width='250'>"
															+ data[i].cdesc;
													output += "<td width='60'>"
															+ "<input type='checkbox' name='cIdArr' value='"+data[i].cId+"' class='class-checked'>";
													output += "</tr>"
												}
												output += "</table>";
												length++;
												$("#search-result")
														.html(output);
												// success
											},
											error : function() {
												alert("ajax통신 실패!!!");
											}
										});
							});
			
			$('#')

		});

		function checkForm() {
			var vegType = $('#rType').val();
			var content = CKEDITOR.instances.ckeditor.getData();
			var hasImage = content.indexof(content);
			if (vegType == null || vegType == '') {
				alert('레시피의 채식유형을 선택하세요');
				return false;
			} else if(CKEDITOR.instances.ckeditor.getData().length < 1) {
				alert('내용을 입력해주세요');
				return false;
			} else if(hasImage == -1) {
				alert('사진을 한 개 이상 등록해주세요. 대표사진이 필요합니다.');
			} else {
				$('#rContent').val(content);
				return true;
			}

		}
	</script>

</body>
</html>