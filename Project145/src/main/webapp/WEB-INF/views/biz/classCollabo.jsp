<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.tr-hover:hover {
	background: #f8f9fc;
}
</style>
</head>
<body>
	<div class="container">
		<div align="right" class="mb-2">

			<button class="btn btn-outline-primary">클래스목록</button>
			<button class="btn btn-outline-primary" style="margin-right: 20px;"
				onclick="location.href=location.href='classRegForm.do'">클래스
				추가</button>
		</div>
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<a class="m-0 font-weight-bold text-primary">내 클래스 목록</a>
				<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>
					
					
<!-- 필터 기능 
				<div style="float:right">

					<button class="btn btn-outline-primary">강사미정</button>
					<button class="btn btn-outline-primary">강사승인대기</button>
					<button class="btn btn-outline-primary">개설완료</button>
					<button class="btn btn-outline-primary">진행중</button>
					<button class="btn btn-outline-primary">종료</button>
				</div> -->
				
			</div>
			<div class="card-body">
				<c:if test="${fn:length(classList) != 0 }">
					<div class="table-responsive">


						<div id="dataTable_wrapper"
							class="dataTables_wrapper dt-bootstrap4" style="width: 98%">
							<div class="row">
								<div class="col-sm-12">

									<table class="table table-bordered dataTable" id="dataTable"
										role="grid" aria-describedby="dataTable_info"
										style="width: 100%; text-align: center;">
										<thead>
											<tr role="row">
												<th style="width: 30px;">시작날짜</th>
												<th style="width: 60px;">클래스명</th>
												<th style="width: 30px;">시간</th>
												<th style="width: 40px;">장소</th>


												<th style="width: 20px;">상태</th>
												<th style="width: 20px;">인원</th>
												<th style="width: 20px;">옵션</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="vo" items="${classList }">
												<tr role="row" class="tr-hover">
													<td
														onclick="location.href='classBizSelect.do?cId=${vo.getCId()}'">${vo.getCStart() }</td>
													<td
														onclick="location.href='classBizSelect.do?cId=${vo.getCId()}'"><a
														href="#">${vo.getCTitle()}</a></td>
													<td
														onclick="location.href='classBizSelect.do?cId=${vo.getCId()}'">
														${vo.getCTime() }</td>
													<td
														onclick="location.href='classBizSelect.do?cId=${vo.getCId()}'">${vo.getCLoc() }</td>


													<td
														onclick="location.href='classBizSelect.do?cId=${vo.getCId()}'">${vo.status }</td>
													<td
														onclick="location.href='classBizSelect.do?cId=${vo.getCId()}'">${vo.getCJoin() }/
														${vo.getCParti() }</td>
													<td><button class="btn btn-outline-primary"
															onclick="location.href='classBizEdit.do?cId=${vo.getCId()}'"
															style="font-size: 20px; z-index: 99;">
															<i class="fa fa-pencil"></i>
														</button>
														<button class="btn btn-outline-primary"
															value="${vo.getCId()}" onclick="classdel(this)"
															style="font-size: 20px; z-index: 99;">
															<i class="fa fa-trash-o"></i>
														</button>
														<button class="btn btn-outline-primary"
															onclick="location.href='externalLink.do?c_Id=${vo.getCId()}'"
															style="font-size: 20px; z-index: 99; padding: 9px 7px 3px 11px">
															<i class="	fa fa-external-link"></i>
														</button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${fn:length(classList) == 0 }">
					<h3>운영중인 클래스가 없습니다.</h3>
				</c:if>
			</div>
		</div>
	</div>

	<script>
		function classdel(v) {
			console.log(v.value);
			if (confirm('해당 클래스를 삭제합니다.')) {
				location.href = 'classBizDelete.do?cId=' + v.value;
			} else {
				alert('삭제 취소');
			}
		}
	</script>

</body>
</html>