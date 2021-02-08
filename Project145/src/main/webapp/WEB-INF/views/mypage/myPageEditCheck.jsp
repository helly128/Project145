<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageEditCheck.jsp</title>
</head>
<body>
	<div align="center">
		<div class="col-lg-7">
			<div class="p-5">
				<div class="text-center">
					<h1 class="h4 text-gray-900 mb-2">내정보 수정을 위해 비밀번호를 확인해주세요.</h1>
					<br>
				</div>
				<form class="user" action="myPageEdit.do" id="frm">
					<div class="form-group">
						<input id="password" name="password" type="password"
							class="form-control form-control-user"
							placeholder="Enter Your Password...">
						<p id="p"></p>
					</div>
				</form>
				<a class="btn btn-primary btn-user btn-block" id="edit" style="color: white;"> 내 정보 수정
				</a>
				<hr>
			</div>
		</div>
	</div>
	<script>
		$(function() {

			$("#edit").on('click', function() {
				var password = $("#password").val()
				var mId = "${mId}"

				$.ajax({
					type : "post",
					url : "EditCheck.do",
					data : {
						password : password,
						mId : mId
					},
					dataType : "json",
					success : function(result) {
						//console.log(result)
						//console.log(typeof (result))
						if (result == true) {
							$("#frm").submit();
						} else {
							$("#p").css("color", "red");
							$("#p").text("비밀번호가 일치하지 않습니다.");
						}

					},
					error : function() {
						console.log("error받아오기 실패")
					}

				}) // ajax end
			})

		}) // ready end
	</script>
</body>
</html>