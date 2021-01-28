<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당상세</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<div class="row">

		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<div class="row px-3 mb-4">
				<button class="btn btn-outline-primary"
					onclick="location.href='restBizList.do'">
					<strong>&#60;</strong> 돌아가기
				</button>
			</div>
			<div class="row">
				<div class="col-lg-5 mb-4">
					<div class="card shadow h-100">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">대표 사진</h6>
						</div>
						<!-- Card Body -->
						<div class="card-body">
							<div class="p-2">
								<c:if test="${restVo.restPic eq null}">
									<img id="rest-image" src="/images/images-empty.png"
										width="100%">
								</c:if>
								<c:if test="${restVo.restPic ne null}">
									<img src="/images/${restVo.restPic }" width="100%">
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-7 mb-4">
					<div class="card shadow h-100">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">식당 정보</h6>
						</div>
						<div class="card-body">
							<h3 class="fw-bold">
								<strong>${restVo.restName }</strong>
							</h3>
							<p class="mb-0 mt-4">
								<strong>운영시간</strong>
							</p>
							<p>${restVo.restTime }</p>
							<p class="mb-0 mt-2">
								<strong>주소</strong>
							</p>
							<p>${restVo.restAddress }</p>
							<p class="mb-0 mt-2">
								<strong>연락처</strong>
							</p>
							<p>${restVo.restTel }</p>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">메뉴</h6>
						</div>
						<div class="card-body">
							<table class="table dataTable" id="dataTable" width="100%"
								cellspacing="0" role="grid" aria-describedby="dataTable_info"
								style="width: 100%; text-align: center;">
								<thead>
									<tr role="row">
										<th style="width: 44px;">메뉴</th>
										<th style="width: 54px;">채식타입</th>
										<th style="width: 34px;">가격</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="menuVo" items="${menuList }">
										<tr role="row" class="tr-hover">
											<td>${menuVo.menuName }</td>
											<td>${menuVo.menuVegeType }</td>
											<td><fmt:formatNumber value="${menuVo.menuPrice }"
													pattern="#,###" />원</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div align="center" class="mb-5 restBtn">
				<button class="btn btn-primary"
					onclick="location.href='restBizDetail.do?restId=${restVo.restId}'">가게
					정보 수정</button>
				&nbsp;&nbsp;
				<button class="btn btn-primary" onclick="deleteConfirm();">가게
					삭제</button>
			</div>
			<div class="mb-5">
				<hr>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">예약대기</h6>
						</div>
						<!-- Card Body -->
						<div class="card-body">
							<table class="table dataTable" id="dataTable" width="100%"
								cellspacing="0" role="grid" aria-describedby="dataTable_info"
								style="width: 100%; text-align: center;">
								<thead>
									<tr role="row">
										<th style="width: 10px;"><input type="checkbox"
											id="checkAll" class="table-checkbox" style="zoom: 1.5"></th>
										<th style="width: 40px;">예약자ID</th>
										<th style="width: 52px;">예약자명</th>
										<th style="width: 50px;">예약일</th>
										<th style="width: 20px;">인원</th>
										<th style="width: 40px;">예약상태</th>
									</tr>
								</thead>
								<tbody>
									<form id="frm" action="restBizReservUpdate.do" method="post">
										<input type="hidden" name="hiddenFlag" class="hiddenFlag">
										<c:forEach var="vo" items="${reservVo.reservVoList }"
											varStatus="status">
											<input type="hidden"
												name="reservVoList[${status.index }].restId"
												value="${vo.restId }">
											<input type="hidden"
												name="reservVoList[${status.index }].restReservNum"
												value="${vo.restReservNum }">
											<tr role="row" class="tr-hover">
												<td><input type="checkbox" class="td-checkbox"
													name="reservVoList[${status.index }].checkFlag"
													style="zoom: 1.5"></td>
												<td>${vo.getMId() }</td>
												<td>${vo.restReservName }</td>
												<td><fmt:formatDate value="${vo.restReservDate }"
														pattern="yyyy-MM-dd HH:mm" /></td>
												<td>${vo.restReservPeople }</td>
												<td>${vo.restReservStatus }</td>
											</tr>
										</c:forEach>
									</form>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div align="center" class="mb-5 reservBtn">
				<button class="btn btn-primary submitBtn" disabled="true"
					onclick="acceptBtn()">예약 수락</button>
				&nbsp;&nbsp;
				<button class="btn btn-primary submitBtn" disabled="true"
					onclick="refuseBtn()">예약 거절</button>
			</div>


			<div class="mb-5">
				<hr>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">처리완료된 예약</h6>
							<div class="dropdown no-arrow">
								<a class="dropdown-toggle" href="#" role="button"
									id="dropdownMenuLink" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> <i
									class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
								</a>
								<div
									class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
									aria-labelledby="dropdownMenuLink" style="">
									<div class="dropdown-header">예약상태</div>
									<a class="dropdown-item" href="javascript:void(0);"
										onclick="reservDone('accept')">예약완료</a> <a class="dropdown-item"
										href="javascript:void(0);" onclick="reservDone('refuse')">예약거절</a>
								</div>
							</div>
						</div>
						<!-- Card Body -->
						<div class="card-body">
							<table class="table dataTable" id="completeReserv" width="100%"
								cellspacing="0" role="grid" aria-describedby="dataTable_info"
								style="width: 100%; text-align: center;">
								<thead>
									<tr role="row">
										<th style="width: 40px;">예약자ID</th>
										<th style="width: 52px;">예약자명</th>
										<th style="width: 50px;">예약일</th>
										<th style="width: 20px;">인원</th>
										<th style="width: 40px;">예약상태</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="mb-5"></div>
		</div>
		<div class="col-lg-1"></div>
	</div>

	<script>
	

		$(function() {
			//체크박스 전체선택/해제
			$('#checkAll').click(function() {
				if ($('#checkAll').prop('checked')) {
					$('.td-checkbox').prop('checked', true);
				} else {
					$('.td-checkbox').prop('checked', false);
				}
			});

			$('.td-checkbox, #checkAll').click(function() {
				var tmp = $(this).prop('checked');
				var length = $('.td-checkbox:checked').length;
				if (tmp == true || length > 0) {
					$('.submitBtn').prop('disabled', false);
				} else {
					$('.submitBtn').prop('disabled', true);
				}
			})
			
			reservDone('accept');
		});

		function deleteConfirm() {
			var result = confirm("식당을 삭제하시겠습니까? 삭제 후에는 취소가 불가능합니다.");
			if (result) {
				alert("삭제되었습니다.");
				location.href = "restBizDelete.do?restId=${restVo.restId}";
			} else {
				alert("취소되었습니다.")
			}
		}

		function acceptBtn() {
			$('.hiddenFlag').val('accept');
			$('#frm').submit();
		}

		function refuseBtn() {
			$('.hiddenFlag').val('refuse');
			$('#frm').submit();
		}
		
		function reservDone(msg){
			$('#completeReserv tbody').empty();
			var restId = "${restVo.restId}";
			if(msg == 'accept'){
				var url = 'restBizReservAccept.do/';
			} else{
				var url = 'restBizReservRefuse.do/';
			}
			$.ajax({
				url: url+restId,
				type: 'post',
				contentType: "application/json",
				success: function(result){
					$.each(result, function(idx, item){
						var date = dateFormat(item.restReservDate);
						var tbody = $('#completeReserv tbody');
						tbody.append($('<tr>').append($('<td>').html(item.mid))
								.append($('<td>').html(item.restReservName))
								.append($('<td>').html(date))
								.append($('<td>').html(item.restReservPeople))
								.append($('<td>').html(item.restReservStatus)));
					});
				}
			});
		}
		
		function dateFormat(dat){
			var date = new Date(dat);
			var year = date.getFullYear();
		    var month = date.getMonth() + 1;
		    var day = date.getDate();
		    var hour = date.getHours();
		    var min = date.getMinutes();
		    if(min < 10){
		    	min = '0'+min;
		    }
		    var newDate = year + "-" + month + "-" + day + " " + hour + ":" + min;
		    return newDate;
		}
		
		
	</script>
</body>
</html>