<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myWalletCheck.jsp</title>
</head>
<body>
	<div align="center">
		<div class="col-lg-7">
			<div class="p-5">
				<div class="text-center">
					<h1 class="h4 text-gray-900 mb-2">내지갑을 사용하기 위해 비밀번호를 확인해주세요.</h1>
					<br>
				</div>
				<form class="user" action="myWallet.do" id="frm"
					onsubmit="return editFunc();" method="post">
					<div class="form-group">
						<input id="password" name="password" type="password"
							class="form-control form-control-user"
							placeholder="Enter Your Password...">
						<p id="p"></p>
					</div>
					<button type="submit" class="btn btn-primary btn-user btn-block"
						id="edit" style="color: white;">내 정보 수정</button>
				</form>
				<hr>
			</div>
		</div>
	</div>
	<script>
		function editFunc() {
			var password = $("#password").val();
			var mId = "${mId}";
			var isSubmit = false;
			
			$.ajax({
				type : "post",
				url : "EditCheck.do",
				data : {
					password : password,
					mId : mId
				},
				dataType : "json",
				async: false,
				success : function(result) {
					if (result == true) {
						isSubmit = true;
					} else {
						$("#p").css("color", "red");
						$("#p").text("비밀번호가 일치하지 않습니다.");
						isSubmit = false;
					}

				},
				error : function() {
					console.log("error받아오기 실패");
					isSubmit = false;
				}

			}); // ajax end
			return isSubmit;
		}
	</script>
</body>
</html>