<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
	
	<script>
		$(function() {
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
					buyer_tel : "010-1234-1234",	//구매자의 연락처: 나도 없음
					buyer_addr : renTalAddress,		//얘도.. 없이 안 해봐서 모름
					buyer_postcode : renTalPostcode,
					m_redirect_url : 'ProductList.do'	//이렇게 해놔도 form태그의 action을 따라감
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
		})
	</script>
</body>
</html>