<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내지갑</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div align="center">
		<div class="col-lg-6">
			<div class="p-5">
				<div class="text-center">
					<h1 class="h4 text-gray-900 mb-4">지갑을 채워주세요!! 🤑</h1>
				</div>
				<div class="form-group">
					&nbsp; <input readonly="readonly" type="text"
						class="form-control form-control-user"
						aria-describedby="emailHelp" placeholder="적림금잔액 가져오기"
						value="보유 적립금 : ${member.getWalletPoint()}">
				</div>
				<div class="form-group">
					&nbsp; <input readonly="readonly" type="text"
						class="form-control form-control-user" placeholder="충전금 잔액 가져오기"
						value="보유 충전금 : ${member.getWalletCash() }"><br>
				</div><hr><hr><br>
				<form action="WithDraw.do" method="post" id="form1">
					<input id="wPay" name="wPay" type="text"
						class="form-control form-control-user"
						placeholder="충전하실 금액을 입력하세요."> 
						<button type="button" id="button1" class="btn btn-google btn-user btn-block">충전</button>
				</form><hr>
				<form action="Deposit.do" method="post" id="form2">
					<input id="dPay" name="dPay" type="text"
						class="form-control form-control-user"
						placeholder="인출하실 금액을 입력하세요."> 
						<button type="button" id="button2" class="btn btn-facebook btn-user btn-block">인출</button>
				</form>
				<hr>				
				<div class="text-center">
					<a class="small" href="AuthAccount.do">사용자토큰</a><br>
					<a class="small" href="OobToken.do">이용자토큰</a>
				</div>
			</div>
		</div>
	</div>
	<script>
	
	$("#button1").on("click", function() {
		
		var wPay = $("#wPay").val()
		
		if ( wPay != "" ) {
			$("#form1").submit()
		
		} else {
			alert("충전금을 입력해주세요.")		
		}
	})
	
	$("#Pay2").on("click", function() {
				
		$("#form2").submit()		
	})
	
	</script>
</body>
</html>