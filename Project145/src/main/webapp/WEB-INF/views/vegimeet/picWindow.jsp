<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* .submitBtn {
	width: 130px;
	background: #6C9852;
	border-radius: 10px;
	color: white;
	height: 60px;
}

.submitBtn:hover {
	color: white;
} */
.div-image {
	position: relative;
	text-align: center;
	width: 120px;
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
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div class="container" align="center">
		<!-- Card Body -->
		<form id="frm" action="/vegimeetPicInsert.do/${vo.meetId}" method="post"
			enctype="multipart/form-data">
			<div class="image-container p-3">
				<img id="upload-image" src="/images/images-empty.png" width="70%">
				<div class="div-image mb-4">
					<span class="label">사진 업로드</span> <input type="file"
						name="uploadfile" class="uploadPic" accept="image/*"
						onchange="setImage(event);">
				</div>
				<button class="btn btn-primary submitBtn" disabled>등록</button>
			</div>
		</form>
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

			$('.submitBtn').prop('disabled', false);
		}
		
		$(function(){
			$('.submitBtn').on('click', function(){
				
				$.ajax({
					type: 'post',
					url: 'vegimeetPicInsert.do/${vo.meetId}',
					processData: false,
			        contentType: false,
					success: function(result){
						window.close();
						window.open('','_self').close();
					}
				});
			})
		});
	</script>
</body>
</html>