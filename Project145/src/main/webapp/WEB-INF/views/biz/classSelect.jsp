	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/classform.css">
<style>
h4 {
	font-size: 1.5rem;
	font-weight: 600;
}

h6 {
	font-size: 1.3rem;
}

</style>
<title>클래스 상세페이지</title>
</head>
<body style="padding: 0; align:center;">


	<div class="container" align="center">
		<form id="cfrm" class="cfrm" action="/classBizEdit.do">
			<input type="hidden" name="mId" id="mId" value='${sessionScope.mId}'>

			<br>
			<div class="pagetitle" align="center">
				<h4>클래스 상세 페이지</h4>
			</div>
			<br>
			<div class="row" id="uploadpic">
				<!--사진 Card Body -->
				<div class="image-container p-3" style="width: 100%" align="center">
					<img id="class-image" src="/images/${classVo.getCImg() }" height="300px"
						width="auto">
				</div>
			</div>
			<br>
			<div class="row">
				<h5>클래스명</h5>
				<div class="input-group" id="cTitle">
					<h6>${classVo.getCTitle()}</h6>
				</div>
			</div>
			<br>
			<div class="row">
				<h5>베지테리언타입</h5>
				<br>
				<div class="input-group" id="vegtype">
					<h6>${classVo.getVegType()}</h6>
				</div>
			</div>

			<br>
			<div class="row">
				<div class="col-half">
					<h5>모집정원(명)</h5>
					<div class="cParti" id="cParti">
						<h6>${classVo.getCParti()}명</h6>
					</div>
				</div>
				<div class="col-half">
					<h5>가격</h5>
					<div class="cPrice" id="cprice">
						<h6>${classVo.getCPrice()}원</h6>
					</div>
				</div>
			</div>
			<br>

			<div class="row">
				<div class="col-half">
					<h5>시작일</h5>
					<div class="cStart" id="cStart">
						<h6>${classVo.getCStart()}</h6>
					</div>
				</div>
				<div class="col-half">
					<h5>종료일</h5>
					<div class="cEnd" id="cEnd">
						<h6>${classVo.getCEnd()}</h6>
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<h5>요일 / 시간</h5>
				<div class="input-group" id="cTime">
					<h6>${classVo.getCTime()}</h6>
				</div>
			</div>

			<div class="row">
				<h5>장소</h5>
				<div class="input-group" id="cLoc">
					<h6>${classVo.getCLoc()}</h6>
				</div>
			</div>

			<div class="row">
				<h5>강사 정보</h5>
			</div>

			<!-- 기존 강사 목록에서 선택하는 폼으로   -->
			<div class="card shadow mb-4" id="leclistdiv">
				<br>
				<div class="row">
					<div class="col-half" style="padding-left: 10%;">
						<div class="row" style="text-align: center;" align="center">
							<div class="input-group">
								<div class="profile-cover">
									<div class="profile-avatar">
										<img style="border-radius: 50px"
											src="/images/${lvo.getProfileImage()}"
											alt="profile" />
									</div>

									<div class="profile-details" style="font-size: 1.5rem">
										<a href="https://www.instagram.com/maxencefvl/?hl=ko"
											target="blank"><i class="fa fa-id-card-o"></i></a> &nbsp<a
											href="https://www.instagram.com/maxencefvl/?hl=ko"
											target="blank"><i class="fa fa-instagram"></i></a> &nbsp<a
											href="https://www.instagram.com/maxencefvl/?hl=ko"
											target="blank"><i class="fa fa-envelope-o"></i></a>
									</div>
								</div>
							</div>
						</div>


					</div>
					<div class="col-half" align="center">
						<div class="row">
							<h5>강사아이디</h5>
							<div class="input-group">
								<h6>${lvo.getMId()}</h6>
							</div>
						</div>

						<div class="row">
							<h5>강사이름</h5>
							<div class="input-group">
								<div style="text-align: center;" align="center">

									<h6>${lvo.getMName()}</h6>
								</div>
							</div>
						</div>
						<div class="row">

							<div class="lecCareer" align="center">
								<h5>강사이력</h5>
								<div class="input-group">
									<h6>${lvo.getCareer()}</h6>
								</div>

							</div>
						</div>
					</div>
				</div>


				<br> <br> <br>
			</div>


			<!-- 강사부분 끝 -->


			<div class="row" style="text-align: left" align="center">

				<h5>클래스 커리큘럼</h5>
				<div class="input-group">
					<h6>${classVo.getCurriCulum()}</h6>
				</div>
			</div>

			<div class="row" style="text-align: left" align="center">

				<h5>클래스 설명</h5>
				<div class="input-group">
					<h6>${classVo.getCDesc()}</h6>
				</div>
			</div>

			<input type="hidden" name="cId" value="${classVo.getCId()}">

			<button class="btn btn-primary" type="submit"
				style="margin: 10px; padding: 10px;"
				onClick="location.href='/classBizEdit.do'">클래스 정보 수정</button>
			<button class="btn btn-primary" type="button"
				onClick="location.href='/classBizList.do'"
				style="margin: 10px; padding: 10px;">클래스 목록으로</button>

		</form>
	</div>

	<br>


</body>
</html>