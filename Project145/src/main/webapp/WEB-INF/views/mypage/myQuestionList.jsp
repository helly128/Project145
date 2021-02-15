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
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">받은 문의 목록</h6>
			</div>
			<div class="card-body">
				<c:if test="${fn:length(cEnqList) != 0 }">
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
												<th style="width: 150px;">보낸이</th>
												<th style="width: 150px;">받은날짜</th>
												<th style="width: 300px;">내용</th>

												<th>답변</th>

												<th style="width: 200px;">옵션</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="cEnqList" items="${cEnqList }">
												<tr role="row" class="tr-hover">
													<td>${cEnqList.getMId() }</td>
													<td>${cEnqList.enqDate}</td>
													<td>${cEnqList.enqContent }</td>

													<td><div id="resulttext"><c:if test="${cEnqList.enqResult ne null}">
													${cEnqList.enqResult }
													</c:if> <c:if test="${cEnqList.enqResult eq null}">
															<textarea class="enqResult" id="enqreply" rows="5"></textarea>
														</c:if></div></td>
													<td>
													
													<c:if test="${cEnqList.enqType eq 'accepted'}">
													
														<button id="sad" class="btn btn-outline-danger"
															value="${cEnqList.enqNo}" onclick='enqRefused(this)'
															style="font-size: 15px; z-index: 99;">
															<i class="fa fa-frown-o" aria-hidden="true">승낙취소</i>
														</button>
													</c:if>
													<c:if test="${cEnqList.enqType eq 'refused'}">
														거절
													</c:if>
													<c:if test="${cEnqList.enqResult eq null}">
														<button id="smile" class="btn btn-outline-primary"
															value="${cEnqList.enqNo}" onclick='enqAccepted(this)'
															style="font-size: 15px; z-index: 99;">
															<i class="fa fa-smile-o" aria-hidden="true">승낙</i>
														</button>

														<button id="sad" class="btn btn-outline-danger"
															value="${cEnqList.enqNo}" onclick='enqRefused(this)'
															style="font-size: 15px; z-index: 99;">
															<i class="fa fa-frown-o" aria-hidden="true">거절</i>
														</button>
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
				<c:if test="${fn:length(cEnqList) == 0 }">
					<h3>받은 문의가 없습니다.</h3>
				</c:if>
			</div>
		</div>
	</div>



	<div class="container">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">보낸 문의 목록</h6>
			</div>
			<div class="card-body">
				<c:if test="${fn:length(myEnqList) != 0 }">
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
												<th style="width: 150px;">문의대상</th>
												<th style="width: 150px;">보낸날짜</th>
												<th style="width: 300px;">보낸내용</th>
												<th>받은답변</th>

											</tr>
										</thead>
										<tbody>
											<c:forEach var="myEnqList" items="${myEnqList }">
												<tr role="row" class="tr-hover">
													<td>${myEnqList.originId}</td>
													<td>${myEnqList.enqDate}</td>
													<td>${myEnqList.enqContent }</td>

													<td>${myEnqList.enqResult }</td>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${fn:length(myEnqList) == 0 }">
					<h3>보낸 문의가 없습니다.</h3>
				</c:if>
			</div>
		</div>
	</div>


	<script>
		function enqDel(v) {
			console.log(v.value);
			if (confirm('해당 클래스를 삭제합니다.')) {
				location.href = 'enqDelete.do?enqNo=' + v.value;
			} else {
				alert('삭제 취소');
			}
		}

function enqAccepted(e) {
			if (confirm('콜라보요청을 승낙하겠습니까?')) {
			
			console.log(e.value);
			var enqNo=e.value;
			var tr = $(e).closest("tr");
			var enqResult = tr.find('textarea').val();
			var originId = tr.children().eq(0).text();
			console.log(originId+"넘겨줌");
				/* 아작스 */
       $.ajax(
          { 
             type:"POST",
             url:"enqAccepted.do",
             data:{enqResult: enqResult, enqNo : enqNo, originId : originId}, //사용하는 함수 
             dataType:"json",
             success: function(n){
                if(n!=0){
                   $("#collaboresult").text("콜라보 승낙");
                   alert("콜라보요청을 승낙하였습니다.");
                   console.log(enqResult);
                   $("#resulttext").text(enqResult);
                   tr.find('textarea').hide();
                   $("#smile").text('승낙됨');
                   $("#smile").show();
                   $("#sad").text("승낙취소");
  
                }
                else{
                   $("#saveResult").text("승낙 실패");
                   alert("승낙 실패");
                }
             	
             },
             error:(log)=>{alert("아작스 실패")
             }
                
          });
				/* 아작스 */
		
			} else {
				alert('승낙 취소');
			}
		}
</script>
<script>		
function enqRefused(e) {
			if (confirm('콜라보요청을 거절합니다. 한번 거절한 요청은 다시 수락할수 없습니다.')) {
				
					
					console.log(e.value);
					var enqNo=e.value;
					var tr = $(e).closest("tr");
					var enqResult = tr.find('textarea').val();
						/* 아작스 */
		       $.ajax(
		          { 
		             type:"POST",
		             url:"enqRefused.do",
		             data:{enqResult: enqResult, enqNo : enqNo}, //사용하는 함수 
		             dataType:"json",
		             success: function(n){
		                if(n!=0){
		                   $("#collaboresult").text("콜라보 거절");
		                   alert("콜라보요청을 거절하였습니다.");
		                   console.log(enqResult);
		                   $("#resulttext").text("");
		                   tr.find('textarea').hide();
		                   $("#smile").text('거절함');
		                   $("#smile").show();
		                   $("#sad").text("거절함");
		  
		                }
		                else{
		                   $("#saveResult").text("거절 실패");
		                   alert("거절 실패");
		                }
		             	
		             },
		             error:(log)=>{alert("아작스 실패")       }
		                
		          });
				/* 아작스 */
				
					} else {
						alert('거절 취소');
					}
				}
	</script>
</body>
</html>