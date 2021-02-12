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


	<div class="container">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">내 클래스 목록</h6>
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
													<%--익스터널 링크 가기  <button class="btn btn-outline-primary"
															onclick="location.href='externalLink.do?c_Id=${vo.getCId()}'"
															style="font-size: 20px; z-index: 99; padding: 9px 7px 3px 11px">
															<i class="	fa fa-external-link"></i>
														</button> --%>
														<button class="btn btn-outline-primary"
															value="${vo.getCId()}" onclick="collabo(this)"
															style="font-size: 20px; z-index: 99;">
															<i class="fa fa-krw"></i>
														</button>
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
		
		<!-- /모달창 만들기 결제 기능 넣기 / -->
		<div>
		
		
		
		
		</div>
		
		
	</div>

<div class="modal fade" id="smallModal" tabindex="-1" role="dialog"
		style="padding-top: 200px;" aria-labelledby="basicModal"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">타이틀 </h5>
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




	<script>
	
	
	
	
		function classdel(v) {
			console.log(v.value);
			if (confirm('해당 클래스를 삭제합니다.')) {
				location.href = 'classBizDelete.do?cId=' + v.value;
			} else {
				alert('삭제 취소');
			}
		}
		
		
		function collabo(c){
				alert('수입창을 엽니다.'+c.value);
				
			 //======아작스 ======== 
				 var classId = c.value;
			  $.ajax({
			   
			   type:"post",
			   url:"collabo.do",
			   data: {classId: } ,
			   dataType:"json",
			   success:function(vo){
			    console.log(vo);
			    console.log(vo.mid);
			    if(vo.mid != null){
			     
			     $("#idResult").text("회원님의 ID는 "+vo.mid+" 입니다.");
			     
			     
			    }else {
			     $("#idResult").text("없는 사용자 정보입니다.");
			     $("#toLogin").hide;
			    
			    }
			   //모달창 =============================
			   
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
			   //모달창 =============================
			   },//아작스 서섹
			   error:(log)=>{
			   $("#idResult").text("등록되지 않은 정보입니다.");
			   
			   }
			   
			  }); 
			  //======아작스 ========
			
			
			
		}
		

		
		
		
	</script>

</body>
</html>