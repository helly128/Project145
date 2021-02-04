<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VEGIMEET - Untact</title>
<style>
.product-bottom {
	padding-bottom: 20px;
}

.name {
	display: block;
	width: 100%;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.name:hover {
	color: #6C9852;
	cursor: pointer;
}

.class {
	background: #6C9852;
}

.likeAction {
	border: none;
	background: transparent;
}

.insertBtn {
	width: 130px;
	background: #6C9852;
	border-radius: 10px;
	color: white;
	height: 40px;
}

.insertBtn:hover {
	color: white;
}

.myCard {
	border: 1px solid rgba(124, 134, 154, 0.25);
	border-radius: 10px;
	transition: all 0.3s ease-out 0s;
	box-shadow: 0px 3px 35px rgb(218 222 228/ 30%);
}

.myCard:hover {
	box-shadow: 0px 12px 35px rgba(218, 222, 228, 0.65);
}

/* .addBtn:hover {
	background: #6C9852;
	border-color: #6C9852;
} */
.div-image {
	position: relative;
	text-align: center;
	width: 120px;
	text-align: center;
	margin-top: 20px;
	margin-left: auto;
	margin-right: auto;
}

.label {
	position: relative;
	z-index: 0;
	display: inline-block;
	width: 100%;
	background: #6C9852;
	color: #fff;
	padding: 10px 0;
	text-transform: uppercase;
	font-size: 12px;
}

.uploadPic {
	display: inline-block;
	position: absolute;
	z-index: 1;
	width: 100%;
	height: 50px;
	top: 0;
	left: 0;
	opacity: 0;
	cursor: pointer;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<section class="latest-product-area pt-130 pb-110">
		<div class="container">
			<div class="row">
				<div class="mx-auto col-xl-8 col-lg-9 col-md-10">
					<div class="text-center section-title mb-60">
						<h1>당신의 챌린지에 참여하세요 📢</h1>
						<p>초보자들도 도전 가능한 다양한 언택트 만남, 챌린지를 개설하고 참여하세요</p>
					</div>
				</div>
			</div>

			<div class="row justify-content-center">
				<div class="col-lg-1 col-sm-1"></div>
				<div class="col-lg-7 col-sm-5 col-10">
					<div class="search-input">
						<label for="keyword"><i
							class="lni lni-search-alt theme-color"></i></label> <input type="text"
							name="keyword" id="keyword" placeholder="Product keyword"
							style="width: 95%;">
					</div>
				</div>
				<div class="col-lg-3 col-sm-5 col-10">
					<div class="search-btn">
						<button class="main-btn btn-hover searchBtn" style="width: 80%">
							Search <i class="lni lni-search-alt"></i>
						</button>
					</div>
				</div>
				<div class="col-lg-1 col-sm-1"></div>
			</div>

			<c:if test="${fn:length(myList) != 0}">
				<div class="addPic mb-5 p-2">
					<h5>📷 챌린지 인증샷 등록</h5>
					<div class="row">
						<c:forEach var="myMeet" items="${myList }">
							<div class="col-xl-4 col-lg-6 col-md-6 myCard mx-2 p-3 my-2">
								<div class="row mb-2">
									<h5>${myMeet.meetTitle }</h5>
								</div>
								<div class="row">
									<div class="col-xl-6 col-lg-6 col-md-6 ps-1">
										<img src="images/${myMeet.meetPic }" style="width: 300px;">
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6"
										style="align: right; vertical-align: bottom;">
										<c:if test="${myMeet.todayFlag eq 'false' }">
											<form id="frm"
												action="/vegimeetPicInsert.do/${myMeet.meetId}"
												method="post" enctype="multipart/form-data">
												<div class="image-container pe-1">
													<img id="upload-image" src="/images/images-empty.png"
														width="95%">
													<div class="div-image mb-4">
														<span class="label">사진 업로드</span> <input type="file"
															name="uploadfile" class="uploadPic" accept="image/*"
															onchange="setImage(event);">
													</div>
													<button type="button"
														class="btn btn-outline-dark submitBtn"
														data-id="${myMeet.meetId }" disabled>등록</button>
												</div>
											</form>
										</c:if>
										<c:if test="${myMeet.todayFlag eq 'true' }">
											<div style="text-align: center;">
												<br>
												<h6>오늘의 인증샷</h6>
												<h6>등록 완료!</h6>
											</div>
										</c:if>
									</div>
								</div>
								<div class="mt-2 achiv" id="${myMeet.meetId }" align="right"
									style="vertical-align: bottom;">달성률 ${myMeet.achiv }%
									(${myMeet.success }/${myMeet.totalDay })</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:if>


			<div class="row border-top pt-5" id="cards">
				<h4 class="mb-3">챌린지 목록 모집중/마감/종료 나눠서 조회되게</h4>
				<div>
					<select name="options" id="options" style="width: 100px;">
						<option value="전체" selected>전체</option>
						<option value="모집중">모집중</option>
						<option value="마감">마감</option>
						<option value="종료">종료</option>
					</select>
				</div>
				<c:forEach var="vo" items="${list }">
					<div class="col-xl-3 col-lg-6 col-md-6 mb-3">
						<div class="single-product">
							<div class="product-img">
								<a href="/vegimeetSelect.do?meetId=${vo.meetId }"> <img
									src="/images/${vo.meetPic }" style="height: 180px;">
								</a>
							</div>
							<div class="product-content">
								<div class="namediv">
									<h4 class="name"
										onclick="location.href='/vegimeetSelect.do?meetId=${vo.meetId }'">${vo.meetTitle }</h4>
								</div>
								<ul class="address">
									<li><i class="lni lni-user"></i> ${vo.getMId() }</li>
									<li><i class="lni lni-package"></i> ${vo.meetParticipant }</li>
									<li><i class="lni lni-calendar"></i> ${vo.meetStart }</li>
									<li>~ <i class="lni lni-calendar"></i> ${vo.meetEnd }
									</li>
								</ul>
								<div class="product-bottom border-bottom">
									<h4 class="price">${vo.meetFund }원</h4>
									<div>
										<button type="button" class="likeAction"
											data-id="${vo.meetId }">
											<c:if test="${vo.likeFlag > 0 }">
												<img class="likeImg" src="/images/filled_like.png"
													style="width: 30px;">
											</c:if>
											<c:if test="${vo.likeFlag == 0 }">
												<img class="likeImg" src="/images/empty_like.png"
													style="width: 30px;">
											</c:if>
										</button>
									</div>
								</div>
								<br>
								<div align="right">
									<c:if test="${vo.dday > 0 }">
										<h4 style="color: #6C9852;">마감 ${vo.dday }일 전!</h4>
									</c:if>
									<c:if test="${vo.dday <= 0}">
										<h4>마감</h4>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 페이징 -->
			<my:paging paging="${paging }" jsFunc="goList" />
		</div>
		</div>
		<div align="right" class="newChallenge">
			<button class="btn insertBtn"
				onclick="location.href='vegimeetInsertForm.do'">챌린지 개설</button>
		</div>
		</div>
	</section>

	<script>
		//사진 미리보기 설정
		function setImage(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.getElementById("upload-image");
				img.setAttribute("src", event.target.result);

			}

			reader.readAsDataURL(event.target.files[0]);

			$('.submitBtn').prop('disabled', false);
		}

		$(function() {
			$('#cards')
					.on(
							'click',
							'.likeAction',
							function() {
								if ('${mId}' == null || '${mId}' == '') {
									alert('로그인 후 이용가능합니다.');
								} else {
									var meetId = $(this).data('id');
									if ($(this).children('img').attr('src') == '/images/empty_like.png') {
										$.ajax({
											url : 'vegimeetLike.do/' + meetId,
											type : 'post',
											contentType : "application/json",
											success : function(result) {
											}
										});
										$(this).children('img').attr('src',
												'/images/filled_like.png');
									} else {
										$(this).children('img').attr('src',
												'/images/empty_like.png');
										$
												.ajax({
													url : 'vegimeetUnlike.do/'
															+ meetId,
													type : 'post',
													contentType : "application/json",
													success : function(result) {
													}
												});
										$(this).children('img').attr('src',
												'/images/empty_like.png');
									}
								}
							});

			$('.submitBtn').on(
					'click',
					function() {
						var formData = new FormData($("#frm")[0]);
						var meetId = $(this).data('id');
						var photoArea = $(this).parent().parent().parent();
						photoArea.empty();
						var achivDiv = $('#' + meetId);
						achivDiv.empty();

						$.ajax({
							type : 'post',
							url : 'vegimeetPicInsert.do/' + meetId,
							processData : false,
							contentType : false,
							data : formData,
							success : function(result) {
								//해당하는 베지밋의 카드만 새로고침
								photoArea.append($('<div>').attr('style',
										'text-align: center;')
										.append($('<br>')).append(
												$('<h6>').text('오늘의 인증샷'))
										.append($('<h6>').text('등록 완료!')));

								achivDiv.text('달성률' + result.achiv + '% ('
										+ result.success + '/'
										+ result.totalDay + ')');
								console.log(result);
							}
						});
					});

			var mId = '${mId}';
			if (mId == null || mId == '') {
				$('.insertBtn').prop('disabled', true);
				$('.newChallenge').append(
						$('<p>').attr('style', 'font-size: 12px;').text(
								'로그인 후 이용가능합니다.'));
			}

			$('.searchBtn').on('click', function() {
				if ($('#keyword').val() == null || $('#keyword').val() == '') {
					alert('검색어를 입력하세요');
				} else {

				}
			});

			$('#options').on('change', function() {
				$('#cards').empty();
				/* $.ajax({
					type: post,
					url: 
				}); */
			})
		});
	</script>
</body>
</html>