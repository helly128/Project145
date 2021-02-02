<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type='text'], input[type='date'] {
	padding: 10px;
	margin-bottom: 0px;
}

.label {
	position: relative;
	z-index: 0;
	display: inline-block;
	width: 100%;
	background: #6C9852;
	color: #fff;
	padding: 10px 0;
	text-transform: uppercase;
	font-size: 12px;
}

.uploadPic {
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

.div-image {
	position: relative;
	text-align: center;
	width: 120px;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}


textarea {
	margin-bottom: 0px;
	padding: 10px;
}

td {
	padding: 5px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div class="container my-5">
		<div align="center">
			<table class="tbl" style="width: 70%;">
				<tr>
					<th width="100px;">챌린지 제목</th>
					<td><input type="text" name="meetTitle" placeholder="제목을 입력하세요" required></td>
				</tr>
				<tr>
					<th>기간</th>
					<td><input type="date" name="meetStart" style="width: 40%" required>
						~ <input type="date" name="meetEnd" style="width: 40%" required></td>
				<tr>
					<th>챌린지 내용</th>
					<td><textarea placeholder="챌린지 내용을 입력하세요" required></textarea></td>
				</tr>
				<tr>
					<th>대표 사진</th>
					<td><div class="row" id="imageRadio">
							<div class="col-xl-4 col-lg-4 col-md-6 mb-4">
								<input type="radio" name="meetPic" class="radio" value="sample1.jpg" checked>
								<img src="/images/sample1.jpg">
							</div>
							<div class="col-xl-4 col-lg-4 col-md-6">
								<input type="radio" name="meetPic" class="radio" value="sample2.jpg">
								<img src="">
							</div>
							<div class="col-xl-4 col-lg-4 col-md-6">
								<input type="radio" name="meetPic" class="radio" value="sample2.jpg">
								<img src="">
							</div>
							<div class="image-container col-xl-4 col-lg-4 col-md-6">
								<input type="radio" name="meetPic" class="radio imageSelect">
								<div class="myImage">
									<img id="upload-image" width="100%">
									<div class="div-image">
										<span class="label">사진 업로드</span> <input type="file"
											name="uploadfile" class="uploadPic" accept="image/*"
											onchange="setImage(event);">
									</div>
								</div>
							</div>
						</div></td>
				</tr>

			</table>
		</div>
	</div>

	<script>
		//사진 미리보기 설정
		function setImage(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.getElementById("upload-image");
				img.setAttribute("src", event.target.result);

			}
			reader.readAsDataURL(event.target.files[0]);
			$('.div-image').addClass('mb-4');
		}

	</script>
</body>
</html>