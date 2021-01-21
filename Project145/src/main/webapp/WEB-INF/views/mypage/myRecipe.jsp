<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myLikeRecipe.jsp</title>
</head>
<body>
	<div class="container">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">나만의 RECIPE 🧡</h1>
		</div>
		<!-- Page Features -->
		<div class="row text-center">
			<c:forEach var="recipe" items="${recipes }">
				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card h-100">
						<img class="card-img-top" src="http://placehold.it/500x325" alt="">
						<div class="card-body">
							<h4 class="card-title">${recipe.getRTitle() }</h4>
							<p class="card-text">${recipe.getRContent() }</p>
						</div>
						<div class="card-footer">
							<a href="#" class="btn btn-primary">조회수 ${recipe.getRHit() }</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- /.row -->

	</div>
</body>
</html>