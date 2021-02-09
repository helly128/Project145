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
			<form action="/recipeInsertResult.do">
				<h3>recipe title🍏</h3>
				<br /> <input type="text" name="rTitle" placeholder="제목을 입력하세요">
				<br />

				<div>
					<textarea row="10" id="rContent" name="rContent"></textarea>
				</div>
				<hr>
				<br />
				<!-- 관련 재료 -->
				<divclass">
				<h3>Ingredient🍋</h3>
				<br />
				<div class="row">
					Used Ingredient<br /> <br />
					<div class="material">
						<input type="text" id="" name="matName" placeholder="재료명 (예: 두부)">
						<input type="text" id="" name="matVol" placeholder="분량 (예: 한 모)">
					</div>
				</div>
				<button type="button" class="addMat">
					<i class="lni lni-circle-plus"></i>
				</button>


				<hr />
				<br />
				<!-- 관련 클래스 -->
				<div>
					<div class="row">
						<h3>Related Class📖</h3>
						<div>
							<div class="plus">
								<div class="col-lg-3 col-sm-4 col-5">
									<div class="search-input">
										<label for="category"><i
											class="lni lni-grid-alt theme-color"></i></label> <select
											name="category" id="category">
											<option value="none" selected disabled>비건 레벨</option>
											<option value="none">비건</option>
											<option value="none">락토</option>
											<option value="none">오보</option>
											<option value="none">락토오보</option>
										</select>

									</div>
								</div>

								<div class="col-lg-4 col-sm-5 col-10">
									<div class="search-input">
										<label for="keyword"><i
											class="lni lni-search-alt theme-color"></i></label> <input
											type="text" name="keyword" id="keyword"
											placeholder="Product keyword">
									</div>
								</div>

								<%-- 	<c:forEach> --%>
								<input type="text" id="" name="" placeholder="관련 클래스 등록">
								<%-- 	</c:forEach> --%>
							</div>
						</div>
						<button type="button">
							<i class="lni lni-circle-plus"></i>
						</button>
					</div>
					<br />
			</form>
		</div>
	</div>

	<script>
		var ckeditor_config = {
			resize_enaleb : false,
			enterMode : CKEDITOR.ENTER_BR,
			shiftEnterMode : CKEDITOR.ENTER_P,
			filebrowserUploadUrl : "/images"
		};

		CKEDITOR.replace('rContent', ckeditor_config);
	</script>
</body>
</html>