<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth() + 1;
	var day = today.getDate();
	var date = year + "년" + month + "월" + day + "일"

	$(document).ready(function() {
		repleList();//댓글 목록 불러오기

		$("#repleBtn").click(function() {
			repleWrite();//댓글 쓰기 버튼 클릭시 json으로 입력
		});

		$("#deleteBtn").click(function() {
			var delAlert = confirm("정말 삭제 하시겠어요?");
			if (delAlert == ture) {
				repleDelete();
			}
		});

		$(".descBtn").click(function() {//댓글 상세 보기 모달 창
			console.log("정보");
			var reId = $(this).parents().find("td").eq(0).text();
			var reContent = $(this).parents().find("td").eq(1).text();
			var reDate = $(this).parents().find("td").eq(2).text();
			var MId = $(this).parents().find("td").eq(3).text();

		})
	});

	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth() + 1;
	var day = today.getDate();
	var date = year + "년" + month + "월" + day + "일"
	$('#wDate').text(date);

	//댓글 입력
	function repleWrite() {
		var reContent = $("#reContent").val();
		var rId = "${RepleVo.RId}"
		var mId = "${mId}"
		$.ajax({
			type : "post",
			url : "/reple/reple.do",
			headers : {
				"Content-Type" : "application/json"
			},
			dataType : "text",
			data : JSON.stringify({
				rId : rId,
				reContent : reContent,
				reDate : date,
				mId : mId
			}),
			success : function() {
				alert("댓글이 등록되었습니다.");
				$("#repleList").empty();
				//$("#repleList").append('#repleList');
				repleList();
				$("#reContent").val("");
			}
		})
	}
	//댓글 수정
	function repleEdit() {
		$.ajax({
			type : "put",
			url : "/reple/{reId}",
			success : function(result) {
				alert("댓글이 수정되었습니다.");
				$("#repleList").empty();
				//$("#repleList").append('#repleList');
				repleList();
				$("#reContent").val("");
			}
		})
	}
	//댓글 삭제
	function repleDelete() {
		$.ajax({
			type : "delete",
			url : "/reple/reple.do/{reId}",
			success : function(result) {
				alert("댓글이 삭제되었습니다.");
				$("#repleList").empty();
				$("#repleList").load(location.href + '#repleList');

			}
		})
	}
	//댓글 상세 보기
	function repleDesc() {

	}
	//댓글 목록 출력
	function repleList() {
		$
				.ajax({
					type : "get",
					url : "/reple/reple.do?RId=${recipeVo.RId}",
					success : function(result) {
						var output = "<table>";
						console.log(result);
						for ( var i in result) {
							output += "<tr>";
							output += "<td width='60'>" + result[i].reId;
							output += "<td width='200'>" + result[i].reContent;
							output += "<td width='100'>" + result[i].reDate;
							output += "<td width='60'>" + result[i].mid;
							output += "<td width='60'>"
									+ "<button class='descBtn' data-toggle='modal' data-target='#repleDesc'>상세보기"
							output += "<tr>"
						}
						output += "</table>";
						$("#repleList").html(output);
					}
				});
	}
	</script>
</head>

<body>
	<div class="container">
		<div>
			<a href="/restaurant.do" style="margin-top: 5%"><h2>⬅</h2></a>
		</div>
		<br>
		<div class="category-list-item">
		
			<div class="row" align="center">
				<div class="col-lg-2"></div>
				<div class="col-lg-6">
					<div style="float: left; margin-right: 1rem;">
						<h3>🥗${rVo.getRestName() }</h3>
					</div>
					<div style="float: left;">
						<h3>⭐( ${rVo.getRestStarAvg() } )</h3>
					</div>
				</div>
				<div class="col-lg-2">
					<a class="main-btn btn-hover d-none d-md-block" id="restResvButton"
						onclick=""> 예약하기</a>
				</div>
				
			</div>

			<br>
			<hr />
			<br />

			<div class="col-lg-12" align="center">
				<img src="" height="350px" width="600px">
			</div>

			<br>
			<hr />
			<br />

			<div class="row">
				
					<div class="col-lg-2"> </div>
					<div class="col-lg-4" style="float: left;">
						<h4>식당정보</h4>
						<br />
						<h5>
							<i class="lni lni-map-marker"></i> ${rVo.getRestAddress() }
						</h5>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<h5>
							<i class="lni lni-checkmark-circle"></i> ${rVo.getRestTime() }
						</h5>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<h5>
							<i class="lni lni-phone"></i> ${rVo.getRestTel() }
						</h5>

					</div>
					<div class="col-lg-4" style="float: left;">
						<div id="map" style="width: 420px; height: 300px;">map</div>
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee67cd2c5b5202065ed64e63402e985a&libraries=services"></script>
						<script>
							var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
							var mapOption = { //지도를 생성할 때 필요한 기본 옵션
								center : new kakao.maps.LatLng(33.450701,
										126.570667), //지도의 중심좌표.
								level : 3
							//지도의 레벨(확대, 축소 정도)
							};

							//지도를 생성합니다    
							var map = new kakao.maps.Map(mapContainer,
									mapOption);

							//주소-좌표 변환 객체를 생성합니다
							var geocoder = new kakao.maps.services.Geocoder();

							// 주소로 좌표를 검색합니다
							geocoder
									.addressSearch(
											'${rVo.getRestAddress() }',
											function(result, status) {

												// 정상적으로 검색이 완료됐으면 
												if (status === kakao.maps.services.Status.OK) {

													var coords = new kakao.maps.LatLng(
															result[0].y,
															result[0].x);

													// 결과값으로 받은 위치를 마커로 표시합니다
													var marker = new kakao.maps.Marker(
															{
																map : map,
																position : coords
															});

													// 인포윈도우로 장소에 대한 설명을 표시합니다
													var infowindow = new kakao.maps.InfoWindow(
															{
																content : '<div style="width:150px;text-align:center;padding:6px 0;">${rVo.getRestName() }</div>'
															});
													infowindow
															.open(map, marker);

													// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
													map.setCenter(coords);
												}
											});
						</script>
					</div>

				
			</div>

			<br>
			<hr />
			<br />

			<div class="row">
				<div class="col-lg-2"></div>
				<div class="col-lg-8" style="padding: 0px 0px;">
				<h4>메뉴</h4>
				</div>
				<br/>
				<br/>
				<div align="center">
					<c:forEach var="menuList" items="${menuList }">
						<div class="col-lg-8">
							<div style="float: left;">
								<h5>${menuList.getMenuName()}</h5>
							</div>
							<div style="float: left; margin: 0px 10px 0px 10px">
								<a> ${menuList.getMenuVegeType() }</a>
							</div>
							<div align="right">
								<a style="font-weight: bold; font-size: 20px">${menuList.getMenuPrice() } 원
								</a>
							</div>
							<hr>
							<br>
						</div>
					</c:forEach>
				</div>
			</div>
			<hr>
			<br>
		</div>

		<div>
			<div>

				<h5>댓글 목록</h5>
				<br />
				<div id="reloadReple">
					<div class="row" align="center"> 
						<div class="col-lg-2"></div>
						<div class="col-lg-1">번호</div>
						<div class="col-lg-3">댓글 내용</div>
						<div class="col-lg-2">작성일자</div>
						<div class="col-lg-1">작성자</div>
						<div class="col-lg-1">비고</div>
					</div>
					<div class="row" align="center"> 
						<div class="col-lg-2"></div>
						<div class="col-lg-8">
						<hr />
						</div>
					</div>
					
					<input type="hidden" value="${reple}">
					<!-- 댓글 목록 출력되는 부분 -->
					<div class="row" id="repleList"></div>

				</div>

			</div>
			<br /> <br />
			<h5>댓글 작성</h5>
			<br /> <br />
			<div class="container">
				<div class="search-wrapper">
					<!--로그인 한 회원에게만 댓글만 수정 삭제 가능하도록 처리-->
					<c:if test="${sessionScope.mId != null }">
						<div class="row justify-content-center">
							<div class="row" align="left">
								<div class="col-lg-2">
									<p>
										작성자 &nbsp;: &nbsp;${sessionScope.mId }<input type="hidden"
											name="mId" id="mId">
									</p>
								</div>
								<div class="col-lg-10">
									작성일자&nbsp;:&nbsp; <span id="wDate"> </span>
								</div>
							</div>
							<div class="col-lg-19 col-sm-8 col-10">
								<div class="search-input">
									<input type="text" name="reContent" id="reContent"
										placeholder="🤷‍♂️댓글을 입력 해 주세요">
								</div>
							</div>

							<div class="col-lg-2 col-sm-5 col-10">
								<!-- Submit button -->
								<button class="middle-btn" id="repleBtn">댓글</button>
							</div>
						</div>

					</c:if>
				</div>
			</div>
		</div>


	</div>
	<br>
</body>
</html>