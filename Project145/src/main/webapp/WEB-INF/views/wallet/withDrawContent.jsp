<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>withDrawContent.jsp</title>
</head>
<body>
		<div>
			<span class="bname"></span>거래일자 : ${withDrawContent.api_tran_dtm }<br>
			<span>거래일자 : ${withDrawContent.bank_tran_date }</span><br>
			<span>거래금액 : ${withDrawContent.tran_amt }</span><br>
			<span>송금인성명(회원이름) : ${withDrawContent.account_holder_name }</span><br>
			<span>출금계좌번호 : ${withDrawContent.account_num_masked }</span><br>
			<span>출금계좌인자내역 : ${withDrawContent.print_content }</span><br>
			<span>수취인성명 : ${withDrawContent.dps_account_holder_name }</span><br>
			
			<%-- 
			<span>수취인성명(채식당) : ${withDrawContent.dps_account_holder_name }</span><br>
			<span>입금계좌인자내역("충전금") : ${withDrawContent.dps_print_content }</span><br>
			--%>
		</div>
</body>
</html>