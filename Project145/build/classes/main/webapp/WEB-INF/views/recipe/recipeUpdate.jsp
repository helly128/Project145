<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recipe Insert</title>
<style>
.container {
	margin-left: 20%;
	margin-right: 20%;
}

input, textarea {
	border: 1px solid #6C9852;
}

row.plus {
	margin-left: 20%;
	margin-right: 20%;
}
</style>
</head>
<body>
	<div class="container">
	
		<div>
			<a href="/recipeMain.do" style="margin-top: 5%"><h2>⬅</h2></a>
		</div>
		<div class="category-list-item">
			<form action="/recipeInsertResult.do">
				<div class="row">
					
					<div class="col-lg-10">
						<h3>recipe title🍏</h3>
						<br /> <input type="text" id="" name="" style="border: '1'"
							placeholder="제목을 입력하세요"> <br />
					</div>
					<div class="col-lg-2 col-sm-4 col-5">
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
				</div>
		</div>
		<div class="row">
			<div class="col-lg-10">
				<textarea rows="5" cols="120"> </textarea>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-3">
				<i class="lni lni-users">작성자</i>
				<input type="text" id="mId" name="mId" readonly >
			</div>
			<div class="col-lg-3">
				<i class="lni lni-calendar">작성일자</i>
				<input type="text" id="reDate" name="reDate" readonly >
			</div>
			<div class="col-lg-3">
				<p>이미지 수정</p>
				<img src="#" height="200px" width="200px">
				<button>사진 등록</button>
			</div>
		</div>

		<hr>
		<br />
		<!-- 관련 재료 -->
		<divclass">
		<h3>Ingredient🍋</h3>
		<br />
		<div class="row">
			Used Ingredient<br /> <br />
			<div class="plus">
				<%-- 	<c:forEach> --%>
				<input type="text" id="" name="" placeholder="재료를 입력하세요"> <input
					type="text" id="" name="" placeholder="재료를 입력하세요"> <input
					type="text" id="" name="" placeholder="재료를 입력하세요"> <input
					type="text" id="" name="" placeholder="재료를 입력하세요">
				<%-- 	</c:forEach> --%>
			</div>
		</div>
		<button type="button">➕</button>


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
									class="lni lni-search-alt theme-color"></i></label> <input type="text"
									name="keyword" id="keyword" placeholder="Product keyword">
							</div>
						</div>

						<%-- 	<c:forEach> --%>
						<input type="text" id="" name="" placeholder="관련 클래스 등록">
						<%-- 	</c:forEach> --%>
					</div>
				</div>
				<button type="button">➕</button>
			</div>
			<br />
			</form>
		</div>
	</div>
</body>