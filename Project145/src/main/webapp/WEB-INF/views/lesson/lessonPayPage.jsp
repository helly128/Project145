<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lessonPayPage.jsp</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
.tbl {
	border-collapse: collapse;
}

th, td {
	vertical-align: middle;
	height: 50px;
	padding-left: 10px;
	padding-right: 10px;
}

th {
	text-align: right;
}

.inputStyle {
	margin: 0px;
	height: 30px;
	text-align: right;
	width: 90%;
	padding-right: 10px;
}

.pointDesc {
	font-size: 12px;
}

#totalPay {
	margin: 0px;
	height: 30px;
}

#payBtn {
	width: 100px;
	background: #6C9852;
	border-radius: 10px;
	color: white;
	height: 40px;
}

#payBtn:hover {
	color: white;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row mb-5">
			<div class="col-xl-2 col-lg-2"></div>
			<div class="col-xl-8 col-lg-8 col-md-12 mb-5">
				<form id="frm" action="/payAfter.do" method="post">
					<input type="hidden" name="cId" value="${lesson.cId }">
					<div class="product_info p-2 my-5 border-bottom">
						<h3>클래스</h3>
						<table class="tbl my-4">
							<tr>
								<th>클래스명</th>
								<td><div class="border-bottom">
										<input type="hidden" value="${lesson.cTitle }" name="meetId">
										${lesson.cTitle }
									</div></td>
							</tr>
							<tr>
								<th>기간</th>
								<td><div class="border-bottom">
										<fmt:formatDate value="${lesson.cStart }"
											pattern="yyyy-MM-dd HH:MM:SS" />
										&nbsp;~&nbsp;
										<fmt:formatDate value="${lesson.cEnd }"
											pattern="yyyy-MM-dd HH:MM:SS" />
									</div></td>
							</tr>

							<tr>
								<th>클래스 수강료</th>
								<td><div class="border-bottom">
										<fmt:formatNumber value="${lesson.cPrice }" pattern="#,###" />
										원
									</div></td>
							</tr>
						</table>
					</div>
					<div class="discount_info my-5">
						<h3>포인트</h3>
						<table class="tbl my-4">
							<tr>
								<th style="color: black;">*수강료</th>
								<td><div class="border-bottom">
										<input readonly="readonly" type="text"
											class="inputStyle fundMoney"
											onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
											name="myFund" required> 원
									</div></td>
							</tr>
							<tr>
								<th>보유</th>
								<td style="width: 220px;"><div class="border-bottom">
										<input type="text" class="inputStyle myPoint"
											value="${member.walletPoint + member.walletCash }" disabled>
										원
									</div></td>
								<td><div class="pointDesc">
										(적립금:
										<fmt:formatNumber value="${member.walletPoint }"
											pattern="#,###" />
										| 충전금:
										<fmt:formatNumber value="${member.walletCash }"
											pattern="#,###" />
										)
									</div></td>
							</tr>
							<tr>
								<th>사용</th>
								<td><div class="border-bottom">
										<input type="text" class="usePoint inputStyle"
											onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
											value="0" name="totalPoint"> 원
									</div></td>
								<td class="pointDesc">(적립금이 우선 사용됩니다)</td>
							</tr>
							<tr>
								<th>결제금</th>
								<td><div class="border-bottom">
										<input type="text" id="totalPay" class="inputStyle" value="0"
											style="text-align: right;" readonly> 원
									</div></td>
							</tr>
						</table>

					</div>
					<div align="right">
						<button type="button" class="btn btn-hover" id="payBtn">결제하기</button>
					</div>
				</form>

			</div>
			<div class="col-xl-2 col-lg-2"></div>
		</div>
	</div>


	<script>
		$(function() {
			//화면 로드완료되면 참가비에 focus
			$('.fundMoney').focus();

			//결제 api
			$("#payBtn").click(function() {
				//body를 전부 form으로 감싸서 필요한 값 변수 선언
				var totalPay = $('#totalPay').val();
				var buyerName = '${member.getMName()}';
				var productName = '${lesson.cTitle}';
				if (totalPay > 0) {
					IMP.init('imp34358761');
					IMP.request_pay({
						pg : 'inicis',
						pay_method : 'card',
						merchant_uid : 'merchant_' + new Date().getTime(),
						name : productName, //결제창에 보이는 상품명
						amount : totalPay, //가격
						buyer_email : '${member.email}', //결제완료에서 뜨는 이메일값
						buyer_name : buyerName,
					//m_redirect_url : '/payProcess.do' //이렇게 해놔도 form태그의 action을 따라감
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
				} else {
					$("#frm").submit();
					alert('결제가 완료되었습니다.');
				}
			});

			//결제금 자동계산
			$('.usePoint, .fundMoney')
					.on(
							'keyup',
							function() {
								var cnt = 2;
								$('.fundMoney').val(
										$('.fundMoney').val().replace(/(^0+)/,
												""));
								$('.usePoint').val(
										$('.usePoint').val().replace(/(^0+)/,
												""));
								var fund = parseInt($(".fundMoney").val() || 0);
								var usePoint = parseInt($('.usePoint').val() || 0);

								if (usePoint == null || usePoint == '') {
									$('.usePoint').val('0');
								}
								if (fund == null || fund == '') {
									alert('참가비를 먼저 입력하세요');
									$('.usePoint').val('');
									$('.fundMoney').focus();
								} else {
									var myPoint = parseInt("${member.walletPoint + member.walletCash }");

									console.log('usePoint: ' + usePoint);
									if (usePoint > myPoint) {
										alert('보유 금액 이상 사용은 불가능합니다.');
										$(".usePoint").val(myPoint);
									}
									usePoint = parseInt($('.usePoint').val() || 0);
									fund = parseInt($(".fundMoney").val() || 0);
									if (usePoint > fund) {
										$('.usePoint').val(fund);
									}

									var sum = fund - $('.usePoint').val();
									$("#totalPay").val(sum);
								}
							});

			//참가비 입력 안하면 최소참가비 입력
			$('.fundMoney').on('focusout', function() {
				var fund = parseInt($(".fundMoney").val() || 0);
				var minMoney = parseInt("${lesson.cPrice}");
				if (fund < minMoney) {
					$('.fundMoney').val(minMoney);
				}
				fund = parseInt($(".fundMoney").val() || 0);
				var sum = fund - $('.usePoint').val();
				$("#totalPay").val(sum);
			});
		})

		function inputNumberFormat(obj) {
			obj.value = comma(uncomma(obj.value));
		}

		function comma(str) {
			str = String(str);
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		}

		function uncomma(str) {
			str = String(str);
			return str.replace(/[^\d]+/g, '');
		}

		function dateFormat(dat) {
			var date = new Date(dat);
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var day = date.getDate();
			var hour = date.getHours();
			var min = date.getMinutes();
			if (min < 10) {
				min = '0' + min;
			}
			var newDate = year + "-" + month + "-" + day + " " + hour + ":"
					+ min;
			return newDate;
		}
	</script>
</body>
</html>