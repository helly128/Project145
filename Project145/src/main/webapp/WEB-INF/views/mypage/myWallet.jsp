<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내지갑</title>
</head>
<body>
	<div align="center">
		<div class="col-lg-6">
			<div class="p-5">
				<div class="text-center">
					<h1 class="h4 text-gray-900 mb-4">지갑을 채워주세요!! 🤑</h1>
				</div>
				<form class="user">
					<div class="form-group">
						&nbsp; <input readonly="readonly" type="text"
							class="form-control form-control-user"
							aria-describedby="emailHelp" placeholder="적림금잔액 가져오기"
							value="적립금 : ${member.getWalletPoint()}">
					</div>
					<div class="form-group">
						&nbsp; <input readonly="readonly" type="text"
							class="form-control form-control-user" placeholder="충전금 잔액 가져오기"
							value="충전금 : ${member.getWalletCash() }">
					</div>
					<hr>
					<a href="index.html" class="btn btn-google btn-user btn-block">
						충전 </a> <a href="index.html"
						class="btn btn-facebook btn-user btn-block"> 출금 </a>
				</form>
				<hr>
				<div class="text-center">
					<a class="small" href="forgot-password.html">내 실제 계좌 등록하기??</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>