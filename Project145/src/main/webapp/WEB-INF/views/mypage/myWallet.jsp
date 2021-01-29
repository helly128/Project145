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
					&nbsp; 보유 적립금<input readonly="readonly" type="text"
						class="form-control form-control-user"
						aria-describedby="emailHelp" placeholder="적림금잔액 가져오기"
						value="${member.getWalletPoint()}">
				</div>
				<div class="form-group">
					&nbsp; 보유 충전금<input id="cash" readonly="readonly" type="text"
						class="form-control form-control-user" placeholder="충전금 잔액 가져오기"
						value="${member.getWalletCash() }"><br>
				</div>
				<hr>
				<hr>
				<br>
				<form action="WithDraw.do" method="post" id="form1">
					<input id="wPay" name="wPay" type="text"
						class="form-control form-control-user" value="">
					<button type="button" id="button1"
						class="btn btn-google btn-user btn-block">충전</button>
				</form>
				<span class="small">최대 200만원까지 충전이 가능합니다.</span><hr>
				
				<form action="Deposit.do" method="post" id="form2">
					<input id="dPay" name="dPay" type="text"
						class="form-control form-control-user">
					<button type="button" id="button2"
						class="btn btn-facebook btn-user btn-block">인출</button>
				</form>
				<span class="small">보유 충전금만큼 인출이 가능합니다.</span>
				<hr>
				<a class="small" href="#">계좌등록하기</a><br>
				<a class="small" href="MyWalletHistory.do">지갑 내역 보기</a>
				<!-- 	
				<div class="text-center">
					<a class="small" href="AuthAccount.do">사용자토큰</a><br>
				</div>
				 -->
			</div>
		</div>
	</div>
	<script>
		
	<%--충전--%>
		$("#button1").on("click", function() {

			var wPay = $("#wPay").val()

			if (wPay != "") {
				if (wPay > 0 && wPay < 2000000) {
					alert("${mId}" + "님의 계좌에서 " + wPay + "원을 충전을 하시겠습니까?")
					alert("${mId}" + "님의 지갑에 " + wPay + " 원이 충전되었습니다.")
					$("#form1").submit()
				} else {
					alert("최대 200만원까지 충전이 가능합니다.")
					$('#wPay').val('');
					$('#wPay').focus();
				}
			} else {
				alert("충전금을 입력해주세요.")
			}
		})
	<%--인출--%>
		$("#button2").on("click", function() {

			var cash = "${member.getWalletCash() }";
			var dPay = $("#dPay").val()
			console.log(cash)

			if (dPay != "") {
				if ( dPay > 0 && dPay < cash ) {
					alert("${mId}" + "님의 계좌로 " + dPay + "원을 인출 하시겠습니까?")
					alert("${mId}" + "님의 지갑에서 " + dPay + " 원이 인출되었습니다.")
					$("#form2").submit()					
				} else {
					alert("금액을 정확히 입력해주세요.")
				}
			} else {
				alert("인출금을 입력해주세요.")
			}

		})
	</script>
</body>
</html>