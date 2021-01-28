<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 리스트</title>
<style>
.tr-hover:hover {
	background: #f8f9fc;
}
</style>
</head>
<body>
	<div class="container">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary" style="float:left;width:200px;">클래스 목록</h6>
				<button type="button" class="btn btn-outline-primary" 
					id="createClass" style="float:right" onclick="location.href='classRegForm.do'">클래스만들기</button>
			</div>
			<div class="card-body">
				<c:if test="${fn:length(classList) != 0 }">
				<h1>클래스 있음</h1>
				</c:if>
				<c:if test="${fn:length(classList) == 0 }">
					<h4>개설한 클래스가 없습니다.</h4> 
				</c:if>
			
			
			
			
				<%-- <c:if test="${fn:length(classList) != 0 }">
					<div class="table-responsive">
						<div id="dataTable_wrapper"
							class="dataTables_wrapper dt-bootstrap4" style="width: 98%">
							<div class="row">
								<div class="col-sm-12">
									<div align="right" class="mb-2">
										<button class="btn btn-outline-primary"
											onclick="location.href='restBizInsertForm'">클래스 추가</button>
											<!-- 추가 부분 낸주 수정 -->
									</div>
									<table class="table table-bordered dataTable" id="dataTable"
										style="width: 100%; text-align: center;">
										<thead>
											<tr role="row">
												<th style="width: 45px;">클래스명</th>
												<th style="width: 45px;">cPrice</th>
												<th style="width: 60px;">상태</th>
												<th style="width: 34px;">종료날짜</th>
												<th style="width: 34px;">신청자현황</th>
												
											</tr>
										</thead>
										<tbody>
											<c:forEach var="class" items="${classList }">
												<tr role="row" class="tr-hover"
													onclick="location.href='classBizSelect.do?cId=${class.cId }'">
													<td>${class.cTitle }</td>
													<td>${class.cPrice }</td>
													<td>${class.status }</td>
													<td>${class.cParti }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${classList == null }">
					<h3>등록된 클래스가 없습니다.</h3>
				</c:if> --%>
			</div>
		</div>
	</div>


</body>
</html>