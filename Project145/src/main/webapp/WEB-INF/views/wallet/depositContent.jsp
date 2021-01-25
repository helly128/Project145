<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>depositContent.jsp</title>
</head>
<body>
	<c:forEach items="${depositContent }" var="deposit">
		<div>
			<span class="bname"></span>거래일자 : ${deposit.bank_tran_date }<br>
			<span>핀테크 이용 번호 : ${deposit.fintech_use_num }</span><br>
			<span>입금계좌번호 : ${deposit.account_num_masked }</span><br>
			<span>수취인 성명 : ${deposit.account_holder_name }</span><br>
			<span>거래금액 : ${deposit.tran_amt }</span><br>
		</div>
	</c:forEach>
</body>
</html>