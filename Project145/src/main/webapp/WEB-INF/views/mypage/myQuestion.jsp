<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<div class="container-fluid">
		<h1 class="h3 mb-2 text-gray-800">나의 문의 ❔❕</h1><br><br>
		<textarea id="content" name="content" rows="6" cols="80"
			placeholder="내용을 입력하세요"></textarea>
	</div>
	<script>
		CKEDITOR.replace("content");
	</script>
</body>
</html>