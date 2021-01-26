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
			<span class="bname"></span>거래고유번호 : ${withDrawContent.api_tran_id }<br>
			<span>거래일시 : ${withDrawContent.bank_tran_date }</span><br>
			<span>거래금액 : ${withDrawContent.tran_amt }</span><br>
			
			<%-- 
			<span>거래일시 : ${withDrawContent.api_tran_dtm }</span><br>
			<span>입금기관명 : ${withDrawContent.dps_bank_name }</span><br>
			<span>입금계좌번호 : ${withDrawContent.dps_account_num_masked }</span><br>
			<span>입금계좌인자내역 : ${withDrawContent.dps_print_content }</span><br>
			<span>수취인성명${withDrawContent.dps_account_holder_name }</span><br>
			<span>출금계좌핀테크이용번호 : ${withDrawContent.fintech_use_num }</span><br>
			<span>출금기관명 : ${withDrawContent.bank_name }</span><br>
			<span>출금계좌번호 : ${withDrawContent.account_num_masked }</span><br>
			<span>출금계좌인자내역 : ${withDrawContent.print_content }</span><br>
			<span>송금인성명 : ${withDrawContent.account_holder_name }</span><br>
			<span>출금한도잔여금액 : ${withDrawContent.wd_limit_remain_amt }</span><br>
			--%>
			
		</div>
</body>
</html>