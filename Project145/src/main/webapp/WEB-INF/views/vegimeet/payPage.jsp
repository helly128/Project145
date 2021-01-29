<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
.tbl {
	text-align: center;
	border-collapse: collapse;
}

th, td {
	vertical-align: middle;
	height: 50px;
	padding-left: 5px;
	padding-right: 5px;
}

.usePoint {
	margin: 0px;
	height: 30px;
	text-align: right;
}

.myPoint {
	text-align: right;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row mb-5">
			<div class="col-xl-2 col-lg-2"></div>
			<div class="col-xl-8 col-lg-8 col-md-12 mb-5">
				<form id="frm" action="">
					<div class="product_info p-2 mb-3">
						<table class="table mb-4">
							<tr>
								<th>챌린지명</th>
								<th>기간</th>
								<th>최소도전금액</th>
							</tr>
							<tr>
								<td><input type="hidden" value="${meetVo.meetTitle }">
									${meetVo.meetTitle }</td>
								<td>${meetVo.meetStart }&nbsp;~&nbsp;${meetVo.meetEnd }</td>
								<td>${meetVo.minMoney }원</td>
							</tr>
						</table>
					</div>
					<div class="discount_info">
						<h3>포인트 사용</h3>
						<table class="tbl">
							<tr>
								<th>도전금액</th>
								<td><input type="text" class="usePoint fundMoney"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
									name="myFund"></td>
							</tr>
							<tr>
								<th>보유 적립금</th>
								<td>${memberVo.walletPoint }</td>
								<th>사용</th>
								<td>&nbsp;<input type="text" class="usePoint point1"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
							</tr>
							<tr>
								<th>보유 충전금&nbsp;</th>
								<td><div class="border-bottom myPoint">
										<fmt:formatNumber value="${memberVo.walletCash }"
											pattern="#,###" />
										원
									</div></td>
								<th>사용&nbsp;</th>
								<td><div class="border-bottom">
										<input type="text" class="usePoint point2"
											onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
									</div></td>
							</tr>
						</table>

						결제금: <input type="text" id="totalPay" value="0">
					</div>
				</form>

			</div>
			<div class="col-xl-2 col-lg-2"></div>
		</div>
	</div>


	<script>
		$(function() {
			//결제 api
			$("#rental_pay").click(function() {
				//body를 전부 form으로 감싸서 필요한 값 변수 선언
				var rentalPay = document.getElementById("rentalPay").value;
				var rentalName = document.getElementById('rentalName').value;
				var rentalEmail = document.getElementById('email').value;
				var renTalAddress = document.getElementById('address').value;
				var renTalPostcode = document.getElementById('postcode').value;
				var ProductName = document.getElementById('productName').value;
				IMP.init('imp34358761');
				IMP.request_pay({
					pg : 'inicis',
					pay_method : 'card',
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : ProductName, //결제창에 보이는 상품명
					amount : rentalPay, //가격
					buyer_email : rentalEmail, //결제완료에서 뜨는 이메일값
					buyer_name : rentalName,
					buyer_tel : "010-1234-1234", //구매자의 연락처: 나도 없음
					buyer_addr : renTalAddress, //얘도.. 없이 안 해봐서 모름
					buyer_postcode : renTalPostcode,
					m_redirect_url : 'ProductList.do' //이렇게 해놔도 form태그의 action을 따라감
				}, function(rsp) {
					console.log(rsp);
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.';
						//결제 성공시 상품리스트로 이동
						$("#frm").submit();
					} else {
						var msg = '결제에 실패하였습니다.';
					}
					alert(msg);

				});
			});

			$('.usePoint').on('keyup', function() {
				var cnt = 2;
				var fund = parseInt($(".fundMoney").val() || 0);

				for (var i = 1; i < cnt; i++) {
					var sum = parseInt($(this).val() || 0);
					sum++
					console.log(sum);
				}
				var sum1 = parseInt($(".point1").val() || 0); // input 값을 가져오며 계산하지만 값이 없을경우 0이 대입된다  뒷부분에 ( || 0 ) 없을경우 합계에 오류가 생겨 NaN 값이 떨어진다
				
				if (sum1 > fund) {
					alert('보유 금액 이상 사용은 불가능합니다.');
					$(".point1").val(parseInt("${memberVo.walletPoint}"));
				}
				console.log('sum1 = ' + sum1);
				var sum2 = parseInt($(".point2").val() || 0);
				console.log('sum2 = ' + sum2);

				console.log('fund = ' + fund);
				var sum = fund - sum1 - sum2;
				console.log('sum = ' + sum);
				$("#totalPay").val(sum);
			});

		})
	</script>
</body>
</html>