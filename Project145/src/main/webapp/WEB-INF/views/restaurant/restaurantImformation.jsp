<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link href="<%=request.getContextPath()%>/resources/assets/css/starRating.css" rel="stylesheet">

<style>
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

#my_modal {
	display: none;
	width: 400px;
	padding: 10px 10px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

button {
	display: inline-block;
	padding: 12px 24px;
	background: rgb(220, 220, 220);
	font-weight: bold;
	color: rgb(120, 120, 120);
	border: none;
	outline: none;
	border-radius: 3px;
	cursor: pointer;
	transition: ease .3s;
}

button:hover {
	background: #8BC34A;
	color: #ffffff;
}

input {
	margin: 2px 5px;
	width: 300px;
}
.replebox {
	margin-left: 10%;
	margin-right: 10%;
}

.rereplebox {
	margin-left: 15%;
	margin-right: 15%;
}

<
style type ="text /css ">.likeAction {
	border: none;
	background: transparent;
}

.noresize {
	resize: none; /* 사용자 임의 변경 불가 */
}

textarea {
	resize: none;
	border: 1px solid #98bf80;
	border-radius: 10px;
	margin-bottom: 0px;
}

.delBtn {
	border: none;
	background: transparent;
	font-size: 14px;
}

.editBtn {
	border: none;
	background: transparent;
	font-size: 14px;
}

.reContent {
	font-size: 15px;
	color: black;
}
</style>

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
					<a class="main-btn btn-hover d-none d-md-block" id="restResvButton">
						예약하기</a>
				</div>


				<script>
					function modal(id) {
						var zIndex = 9999;
						var modal = document.getElementById(id);

						// 모달 div 뒤에 희끄무레한 레이어
						var bg = document.createElement('div');
						bg.setStyle({
							position : 'fixed',
							zIndex : zIndex,
							left : '0px',
							top : '0px',
							width : '100%',
							height : '100%',
							overflow : 'auto',
							// 레이어 색갈은 여기서 바꾸면 됨
							backgroundColor : 'rgba(0,0,0,0.4)'
						});
						document.body.append(bg);

						// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
						modal.querySelector('.modal_close_btn')
								.addEventListener('click', function() {
									bg.remove();
									modal.style.display = 'none';
								});

						modal
								.setStyle({
									position : 'fixed',
									display : 'block',
									boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

									// 시꺼먼 레이어 보다 한칸 위에 보이기
									zIndex : zIndex + 1,

									// div center 정렬
									top : '50%',
									left : '50%',
									transform : 'translate(-50%, -50%)',
									msTransform : 'translate(-50%, -50%)',
									webkitTransform : 'translate(-50%, -50%)'
								});
					}

					// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
					Element.prototype.setStyle = function(styles) {
						for ( var k in styles)
							this.style[k] = styles[k];
						return this;
					};

					document.getElementById('restResvButton').addEventListener(
							'click', function() {
								// 모달창 띄우기
								modal('my_modal');
							});
				</script>


				<div>
					<c:if test="${sessionScope.mId != null }">
						<form id="frm" action="reservInsert.do">
							<div id="my_modal">
								<!-- 	모달 창의 내용이 여기에 들어온다아아아아아ㅏ -->
								<a style="font-size: 1rem">식당명</a>
								<h6>${rVo.getRestName() }</h6>
								<br> <a>예약날짜/시간</a> <input type="datetime-local"
									class="input" id="resvDate" name="restReservDate"
									onChange="setendmin(this.value)" width="50" required> <br>
								<a>예약자명</a> <input type="text" class="input"
									name="restReservName" required> <br> <a>예약인원</a> <input
									type="number" class="input" name="restReservPeople" min="1"
									max="100" required> <br> <br> <input
									type="hidden" name="mId" value="${sessionScope.mId }">
								<input type="hidden" name="restId" value="${rVo.getRestId()}">
								<button style="font-size: 1rem;" class="modal_close_btn">취소</button>
								<button style="font-size: 1rem;" type="submit" id="push">예약</button>
							</div>
						</form>
						<!-- 달력 기본 설정 -->
						<script>
							document.getElementById('resvDate').value = new Date()
									.toISOString().substring(0, 10);
						</script>
					</c:if>
					<c:if test="${sessionScope.mId == null }">
						<div id="my_modal">
							<h6>로그인 후 이용가능합니다</h6>
							<br>
							<button style="font-size: 1rem;" type="submit"
								class="modal_close_btn" id="push"
								onclick="location.href='loginForm.do'">로그인하기</button>
						</div>

					</c:if>
				</div>

			</div>

			<br>
			<hr />
			<br />

			<!-- 식당 사진 -->
			<div class="col-lg-12" align="center">
				<img src="" height="350px" width="600px">
			</div>

			<br>
			<hr />
			<br />

			<div class="row">

				<div class="col-lg-2"></div>
				<div class="col-lg-4" style="float: left; padding: 0px 0px;">
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
						var map = new kakao.maps.Map(mapContainer, mapOption);

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
												infowindow.open(map, marker);

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
				<br /> <br />
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
								<a style="font-weight: bold; font-size: 20px">${menuList.getMenuPrice() } 원 </a>
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
<!-- 리뷰 작성 -->
		<div>
			<div class="row" align="left">
				<div class="col-lg-2"></div>
				<div class="col-lg-8" style="padding: 0px 0px;">
					<h4>리뷰 작성</h4>
				</div>
				<br /> <br />
				
			<form id="frm" name="frm" action="restReviewInsert.do">
				<div class="row" align="center">
					<div class="col-lg-4"></div>
					<div class="col-lg-7 search-input" align="left">
					<fieldset class="rating">
    						<input type="radio" id="star5" name="rating" value="5" />
    							<label class = "full" for="star5" title="Awesome - 5 stars"></label>
    						<input type="radio" id="star4half" name="rating" value="4 and a half" />
    							<label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
    						<input type="radio" id="star4" name="rating" value="4" />
    							<label class = "full" for="star4" title="Pretty good - 4 stars"></label>
    						<input type="radio" id="star3half" name="rating" value="3 and a half" />
    							<label class="half" for="star3half" title="Meh - 3.5 stars"></label>
    						<input type="radio" id="star3" name="rating" value="3" />
    							<label class = "full" for="star3" title="Meh - 3 stars"></label>
    						<input type="radio" id="star2half" name="rating" value="2 and a half" />
    							<label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
    						<input type="radio" id="star2" name="rating" value="2" />
    							<label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
    						<input type="radio" id="star1half" name="rating" value="1 and a half" />
    							<label class="half" for="star1half" title="Meh - 1.5 stars"></label>
    						<input type="radio" id="star1" name="rating" value="1" />
    							<label class = "full" for="star1" title="Sucks big time - 1 star"></label>
    						<input type="radio" id="starhalf" name="rating" value="half" />
    							<label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
						</fieldset>
					</div>
				</div>
				
								
				<div class="search-wrapper">
					<!--로그인 한 회원에게만 댓글만 수정 삭제 가능하도록 처리-->
					<c:if test="${sessionScope.mId == null }"> 
						<div class="row justify-content-center">
							<div class="row" align="center">
								<div class="col-lg-2"></div>
								<div class="col-lg-7 search-input" align="left">
									<div class="search-input">
										<textarea name="reContent" id="reContent" rows="4" placeholder="로그인 후 이용가능합니다" readonly></textarea>
									</div>
								</div>
								<div class="col-lg-1 col-sm-5 col-10" style="display: flex; align-items: center;">
									<!-- Submit button -->
									<button class="middle-btn">등록</button>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${sessionScope.mId != null }">
						<div class="row justify-content-center">
							<div class="row" align="center">
								<div class="col-lg-2"></div>
								<div class="col-lg-7 search-input" align="left">
									<div class="search-input">
										<textarea name="reContent" id="reContent" rows="4" placeholder="🤷‍♂️댓글을 입력 해 주세요"></textarea>
									</div>
								</div>
								<div class="col-lg-1 col-sm-5 col-10" style="display: flex; align-items: center;">
									<!-- Submit button -->
									<button class="middle-btn" id="repleBtn">등록</button>
								</div>
							</div>
						</div>
					</c:if>
				</div>
			</form>
			</div>
		</div>

		<br /> <br />
<!-- 리뷰 목록 -->
		<div>
			<div class="row" align="left">
				<div class="col-lg-2"></div>
				<div class="col-lg-8" style="padding: 0px 0px;">
					<h4>리뷰 목록</h4>
				</div>
				<br /> <br />
				<div class="row" id="restReview">
					<div class="col-lg-2"></div>
					<div class="col-lg-8" style="margin: 0px 0px;">
					<c:forEach var="vo" items="${restReview }">
						<ul style="list-style:none;">
							<li data-mid="${vo.getMId() }">
								<div class="reple-total mb-3" style="position:relative;">
									<span style="position:absolute;">
										<c:if test="${vo.profileImage != null}">
											<img src="/images/${vo.profileImage }" style="border-radius: 30%; width:45px;">
										</c:if>
										<c:if test="${vo.profileImage == null}">
											<i class="lni lni-sprout" style="border-radius: 30%; width:45px; font-size: 31px;" ></i>
										</c:if>
									</span>
									<div style="padding-left:60px; position:relative;" class="reple-content">
										<div class="mb-1" style="color:black;">
											<strong>${vo.getMId() }</strong> 
										</div>
										<div class="restStar">${vo.restStar }</div>
										<div class="restReview" align="left"> ${vo.restReview } </div>
										
										<div>
											<span style="font-size:12px;">${vo.reviewDate }</span>
											<c:if test="${vo.getMId() == sessionScope.mId }">
												<button type="button" data-id="${vo.restReviewId }" class="delBtn" id="delBtn" style="padding: 0px 0px;">
													<i class="lni lni-trash"></i>
												</button>
											</c:if>
											<c:if test="${vo.getMId() != sessionScope.mId }"> </c:if>
										</div>
										
									</div>
								</div>
							</li>
						</ul>
						<hr>
						</c:forEach>
						<my:paging paging="${paging }" jsFunc="goList" />
					</div>
				</div>

			</div>
			<br /> <br />
		</div>


	</div>
	<br>
</body>

<script type="text/javascript">
//댓글 삭제
function repleDelete() {
	id = $(event.target).data("id")
	$.ajax({
		type : "delete",
		url : "/reple/restReview.do/" + id,
		success : function(result) {
			repleList();

		}
	});
}

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
	
</script>
</html>