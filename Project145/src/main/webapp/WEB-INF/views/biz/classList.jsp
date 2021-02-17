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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.tr-hover:hover {
	background: #f8f9fc;
}
</style>
</head>
<body>

<div class="modal fade" id="smallModal" tabindex="-1" role="dialog"
		style="padding-top: 200px;" aria-labelledby="basicModal"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">아이디 검색 결과</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div id="searchResult" class="modal-body" align="center">

					<h5>
						<a id="idResult"></a>
					</h5>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" id="toLogin" style="display: none"
						class="btn btn-primary" style="background:#1ab188; border:none;">로그인
						화면</button>
				</div>
			</div>
		</div>
	</div>


	<div class="container" style="max-width: 1400px;">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">내 클래스 목록</h6>
			</div>
			<div class="card-body">
				<c:if test="${fn:length(classList) != 0 }">
					<div class="table-responsive">
						<div align="right" class="mb-2">
							<button class="btn btn-outline-primary" style="margin-right:20px;"
								onclick="location.href=location.href='classRegForm.do'">클래스 추가</button>
						</div>
						
						<div id="dataTable_wrapper"
							class="dataTables_wrapper dt-bootstrap4" style="width: 98%">
							<div class="row">
								<div class="col-sm-12">

									<table class="table table-bordered dataTable" id="dataTable"
										role="grid" aria-describedby="dataTable_info"
										style="width: 100%; text-align: center;">
										<thead>
											<tr role="row">
												<th style="width: 50px;">시작날짜</th>
												<th style="width: 70px;">클래스명</th>
												<th style="width: 50px;">시간</th>
												<th style="width: 50px;">장소</th>
												
												
												<th style="width: 50px;">상태</th>
												<th style="width: 20px;">인원</th>
												<th style="width: 20px;">옵션</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="vo" items="${classList }">
												<tr role="row" class="tr-hover"	>
													<td onclick="location.href='classBizSelect.do?cId=${vo.getCId()}'">${vo.getCStart() }</td>
													<td onclick="location.href='classBizSelect.do?cId=${vo.getCId()}'"><a href="#">${vo.getCTitle()}</a></td>
													<td onclick="location.href='classBizSelect.do?cId=${vo.getCId()}'"> ${vo.getCTime() }</td>
													<td onclick="location.href='classBizSelect.do?cId=${vo.getCId()}'">${vo.getCLoc() }</td>
													
													
													<td onclick="location.href='classBizSelect.do?cId=${vo.getCId()}'">${vo.status }</td>
													<td onclick="location.href='classBizSelect.do?cId=${vo.getCId()}'">${vo.getCJoin() }/ ${vo.getCParti() }</td>
													<td>
													<!-- 강사승인대기/강사미정(거절된상태)-강사없음, 수정 삭제 버튼만 -->
													<c:if test ="${vo.status eq '강사승인대기' || vo.status eq '강사미정'}" >
													<button class="btn btn-outline-primary" 
													onclick="location.href='classBizEdit.do?cId=${vo.getCId()}'"
													style="font-size:20px; z-index:99;"><i class="fa fa-pencil"></i></button>
													<button class="btn btn-outline-primary" value="${vo.getCId()}"
													onclick="classdel(this)"
													style="font-size:20px;z-index:99;"><i class="fa fa-trash-o"></i>
													</button>
													</c:if>
													<!-- 개설완료 -수정 삭제 결제 버튼 -->
													<c:if test ="${vo.status eq '개설완료'}" >
													<button class="btn btn-outline-primary" 
													onclick="location.href='classBizEdit.do?cId=${vo.getCId()}'"
													style="font-size:20px; z-index:99;"><i class="fa fa-pencil"></i></button>
													<button class="btn btn-outline-primary" value="${vo.getCId()}"
													onclick="classdel(this)"
													style="font-size:20px;z-index:99;"><i class="fa fa-trash-o"></i>
													</button>
													<!--  <button class="btn btn-outline-primary" 
													onclick="classcollabo(this)"
													style="font-size:20px; z-index:99; padding:9px 7px 3px 11px "><i class="fa fa-krw"></i>
													</button>-->
													</c:if>
													
													<!-- 진행중인데 조인멤버=0이면 -수정 삭제 결제 버튼 -->
													<c:if test ="${vo.status eq '진행중' && vo.getCJoin() eq 0}" >
													<button class="btn btn-outline-primary" 
													onclick="location.href='classBizEdit.do?cId=${vo.getCId()}'"
													style="font-size:20px; z-index:99;"><i class="fa fa-pencil"></i></button>
													<button class="btn btn-outline-primary" value="${vo.getCId()}"
													onclick="classdel(this)"
													style="font-size:20px;z-index:99;"><i class="fa fa-trash-o"></i>
													</button>
													<button class="btn btn-outline-primary" 
													onclick="classcollabo(this)"
													style="font-size:20px; z-index:99; padding:9px 7px 3px 11px "><i class="fa fa-krw"></i>
													</button>
													</c:if>
													<!-- 진행중인데 조인멤버 > 0 이면 수정과 결제 버튼만 -->
													<c:if test ="${vo.status eq '진행중' && vo.getCJoin() > 0}" >
													<button class="btn btn-outline-primary" 
													onclick="location.href='classBizEdit.do?cId=${vo.getCId()}'"
													style="font-size:20px; z-index:99;"><i class="fa fa-pencil"></i></button>
													<!-- <button class="btn btn-outline-primary" 
													onclick="classcollabo(this)"
													style="font-size:20px; z-index:99; padding:9px 7px 3px 11px "><i class="fa fa-krw"></i>
													</button>-->
													</c:if>
													
													<!-- 종료된 이벤트, 삭제와 결제 버튼만 -->
													<c:if test ="${vo.status eq '종료'}" >
													<button class="btn btn-outline-primary" value="${vo.getCId()}"
													onclick="classdel(this)"
													style="font-size:20px;z-index:99;"><i class="fa fa-trash-o"></i>
													</button>
													<!-- <button class="btn btn-outline-primary" 
													onclick="classcollabo(this)"
													style="font-size:20px; z-index:99; padding:9px 7px 3px 11px "><i class="fa fa-krw"></i>
													</button> -->
													</c:if>
													
													</td>
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
function classdel(v){
	console.log(v.value);
	if(confirm('해당 클래스를 삭제합니다.')){
		location.href='classBizDelete.do?cId='+v.value;
		}else{
		alert('삭제 취소');
		}	
}
$(function(){ 
function classcollabo(c){
		   $('#idsearch').click(function() {
		    $('#background_modal').show();
		   });
		   // 2. 모달창 닫기 버튼
		   $('.close').on('click', function() {
		    $('#background_modal').hide();
		   });
		   // 3. 모달창 위도우 클릭 시 닫기
		   $(window).on('click', function() {
		    if (event.target == $('#background_modal').get(0)) {
		              $('#background_modal').hide();
		           }
		   }); 
}
})
</script>

</body>
</html>
