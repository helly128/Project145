<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<head>
<title>myBegiContact</title>
</head>

<body id="page-top">
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">나의 지갑 내역을 확인하세요! 🤍</h1>
		<br>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<!-- 
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">DataTables
					Example</h6>
			</div>
		 -->
			<div class="card-body">
				<div class="col-sm-12 col-md-6">
					<div class="dataTables_length" id="dataTable_length">
						<form method="post" id="form">
							<label><select name="walletType" id="walletType"
								aria-controls="dataTable"
								class="custom-select custom-select-sm form-control form-control-sm"
								onchange="javascript:form.submit()">
									<option value="all" selected>Type</option>
									<option value="충전"
										<c:if test="${vo.getWalletType() == '충전' }">selected="selected"</c:if>>충전</option>
									<option value="인출"
										<c:if test="${vo.getWalletType() == '인출' }">selected="selected"</c:if>>인출</option>
									<option value="적립"
										<c:if test="${vo.getWalletType() == '적립' }">selected="selected"</c:if>>적립</option>
									<option value="베지밋"
										<c:if test="${fun:contains(vo.getWalletType(), '베지밋')}">selected="selected"</c:if>>베지밋</option>
							</select> </label>
						</form>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>거래타입</th>
								<th>거래금액</th>
								<th>거래일자</th>
							</tr>
						</thead>
						<c:forEach var="list" items="${list }">
							<tbody>
								<tr>
									<td>${list.getWalletType() }</td>
									<td><fmt:formatNumber value="${list.getWalletMoney() }"
											pattern="#,###" /> 원</td>
									<td><fmt:formatDate value="${list.getWalletDate() }"
											pattern="yyyy-MM-dd HH:mm" /></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
				<my:paging paging="${paging }" jsFunc="goList" />
			</div>
		</div>
	</div>
	<script>
		

			function goList(p) {
				var walletType = document.getElementById("walletType").value;

				if (walletType == "none") {
					location.href = "MyWalletHistory.do?page=" + p
				} else {
					location.href = "MyWalletHistory.do?page=" + p
							+ "&walletType=" + walletType;
				}
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