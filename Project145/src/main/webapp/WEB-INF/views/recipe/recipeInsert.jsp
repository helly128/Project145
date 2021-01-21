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

.row2 {
	grid-row: span 2;
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
				<h3>recipe title🍏</h3>
				<input type="text" id="" name="" style="border: '1'" placeholder="제목을 입력하세요"> <br />
				<div class="row">
					<div class="col-lg-3">
						<i class="lni lni-users">작성자</i><input type="text" id="" name="" placeholder="작성자를 입력하세요">
					</div>
					<div class="col-lg-3">
						<i class="lni lni-calendar">작성일자</i><input type="text" id=""
							name="" placeholder="작성일자를 입력하세요">
					</div>
				</div>
				<div class="row">
					<div class="col-lg-9">
						<textarea rows="5" cols="60"> </textarea>
					</div>
					<div rowspan="2" class="row2">
						<p>이미지 수정</p>
						<img src="#" height="200px" width="200px">
					</div>
					<button>사진 등록</button>
				</div>
		</div>

		<hr>
		<br />
		<!-- 관련 재료 -->
		<div>
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
		</div>

		<hr />
		<br />
		<!-- 관련 클래스 -->
		<div>
			<div class="row">
				<h3>Related Class📖</h3>
				<div class="plus">
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
	</div>
	</div>
</body>
</html>