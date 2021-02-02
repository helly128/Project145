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

</style>
<title>클래스 수정</title>
</head>
<body style="padding:0;">
${cvo.getCTitle()} <br>
${lvo.lec_id}

	<div class="container" align="center">
		<form id="cfrm" class="cfrm" action="/classBizInsert.do">
		<input type="hidden" name="mId" id="mId" value='${sessionScope.mId}'>
		
			<br>
			<div class="pagetitle" align="center">
				<h3>클래스 상세 페이지 </h3>
			</div>
			<br>
			<div class="row" id="uploadpic">
				<h5>대표사진</h5>

				<div class="div-image" style="float: right;">
					<input type="file" name="cImg" class="classPic" accept="image/*"
						onchange="setImage(event);"
						style="background-color: white; border: none; margin-left: 10px; padding: 0; border-radius: 2px;">
				</div>

				<!-- Card Body -->
				<div class="image-container p-3" style="width: 100%" align="center">
					<img id="class-image" src="/images/images-empty.png" height="300px"
						width="auto">

				</div>
			</div>
			<br>
			<div class="row">
				<h5>클래스명</h5>
				<div class="input-group input-group-icon">
					<input type="text" placeholder="클래스 이름" id="cTitle" name="cTitle" required
						autocomplete="off">
					<div class="input-icon">
					<i class="fa fa-pencil"></i>
					</div>
				</div>
			</div>

			<br>



			<p>
			<h5>베지테리언타입</h5>
			<br>


			<div class="row">
				<div class="col-half">
					<input type="checkbox" class="input-text mb-4" id="vegan"
						name="vegType" value="비건" required> <label for="vegan">🥦&nbsp비건</label>

					&nbsp&nbsp <input type="checkbox" class="input-text mb-4"
						id="locto" name="vegType" value="락토" required><label
						for="locto"> 🧀&nbsp락토</label>

				</div>
				<div class="col-half">

					<input type="checkbox" class="input-text mb-4" id="ovo"
						name="vegType" value="오보" required><label for="ovo">
						🥚&nbsp오보</label> &nbsp&nbsp <input type="checkbox"
						class="input-text mb-4" id="allveg" name="vegType" value="모두"
						required><label for="allveg"> 🥗&nbsp모두</label>
				</div>



			</div>

			<div class="row"></div>



			<div class="row">
				<div class="col-half">
					<h5>시작일</h5>
					<div class="input-group">
						<input type="date" name="cStart" id="cStart">
					</div>
				</div>
				<div class="col-half">
					<h5>종료일</h5>
					<div class="input-group">
						<input type="date" name="cEnd" id="cEnd">
					</div>
				</div>
			</div>

			<div class="row">
				<h5>요일 / 시간</h5>
				<div class="input-group input-group-icon">
					<input type="text" name="cTime" id="cTime" placeholder="매주 ** 요일 오전/오후 ** 시"
						required autocomplete="off">
					<div class="input-icon">
						<i class="fa fa-pencil"></i>
					</div>
				</div>
			</div>

			<div class="row">
				<h5>장소</h5>
				<div class="input-group input-group-icon">
					<input type="text" name="cLoc" id="cLoc" placeholder="장소찾기api" required
						autocomplete="off">
					<div class="input-icon">
						<i class="fa fa-pencil"></i>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-half">
					<h5>모집정원(명)</h5>
					<div class="input-group">
						<div class="number-input" style="margin: 10px">
							<button
								onclick="this.parentNode.querySelector('input[type=number]').stepDown()"></button>
							<input class="quantity" min="0" id="cParti" name="cParti"
								value="1" type="number">
							<button
								onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
								class="plus"></button>
						</div>
					</div>
				</div>
				<div class="col-half">
					<h5>가격(5000원 단위)</h5>
					<div class="input-group">
						<div class="number-input" style="margin: 10px">
							<button
								onclick="this.parentNode.querySelector('input[type=number]').stepDown(1000)"></button>
							<input class="quantity" min="1000" id="cPrice" name="cPrice"
								value="5000" type="number">
							<button
								onclick="this.parentNode.querySelector('input[type=number]').stepUp(5000)"
								class="plus"></button>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<h5>강사 정보</h5>
				<div class="input-group">
					<input type="radio" name="lectureropt" value="leclist"
						id="leclist" checked=checked class="lectureropt"> <label
						for="leclist"><span><i
							class="fa fa-users"></i>기존 강사 목록</span></label> 
							<input type="radio"
						name="lectureropt" value="lecadd" id="lecadd"   class="lectureropt"/>
					<label for="lecadd"> <span><i
							class="fa fa-user-plus"></i>강사 추가</span></label>

				</div>

			</div>
			<!-- 기존 강사 목록에서 선택  -->
			<div class="card shadow mb-4" id="leclistdiv">
				<br>
				<div class="row">
					<div class="col-half">
						<h5 style="padding-top: 20px;">강사이름 mName</h5>
					</div>
					<div class="col-half">
						<div class="input-group">
							<select name="lecturerId1"
							onchange="" 
							style="width: 90%; padding: 0px; margin: 0px;">
								<option value="">강사 선택 옵션 </option>
								<option value="${sessionScope.mId}" >내가 강사임 ID : ${sessionScope.mId}</option>
								<option value="rachelistic">강사1 강사Id</option>
								<option>강사2 강사Id</option>
							</select>

						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-half">
						<div class="profile-cover">
							<div class="profile-avatar">
								<img
									src="https://dl.dropboxusercontent.com/s/7pcnqq18skh1myk/avatar.jpg"
									alt="Anis M" />
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

					<br>
					<div class="col-half">
						<div class="msg" align="left">
							<div  >
							<h5>강사이력</h5>
							<div id="lecCareer"><br> 강사의 이력은 이렇슴 애플<br> 
							삼성<br> 테슬라<br> 예담<br>
							</div>
							</div>
							
						</div>
					</div>
					<br>

					<button class="btn btn-warning"
						style="margin: 20px; width: 100%; padding: 10px;">강사에게
						콜라보 신청</button>

				</div>
			</div>
			
			<!-- 새로운 강사 생성  -->
			<div class="card shadow mb-4" id="lecadddiv" style="display:none">
				<br>

				<div class="row">
					<div class="col-half">
						<h5 style="padding-top: 20px;">강사이름 mName</h5>
					</div>
					<div class="col-half">
						<div class="input-group">
							<select name="lecturerId2"
							onchange="showSection(this)" 
							style="width: 90%; padding: 0px; margin: 0px;">
								<option value="">강사 추가 옵션</option>
								<option value="${sessionScope.mId}">나를 강사로 추가 ID : ${sessionScope.mId}</option>
								<option>외부 강사 추가</option>
							</select>

						</div>
				</div>


				<div class="col-lg-12">
					<div class="col-half">
						<div class="profile-cover">
							<div class="profile-avatar">
								<img style="border-radius: 50%;"
									src="https://dl.dropboxusercontent.com/s/7pcnqq18skh1myk/avatar.jpg"
									alt="Anis M" />
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

					
					<div class="col-half">
					<div   class="msg"  id="melec" align="left">
							
							<h5>내 강사 이력 작성</h5>
							<br>
							<textarea rows="8" style="width: 100%" id="lecCareer" name="lecCareer"></textarea>
						

					</div>
					
					<div class="msg" id= "otherlec" align="left" style="display:none">
							<h5>강사 제안서 본문</h5>
							<div id="proposal" style="width: 90%">
							클래스 내용 입력시 자동으로 완성되는 부분입니다. 
							</div>
							
						<br>
					
							<h5>강사에게 메세지</h5>
							<textarea rows="8" name="proposal"  style="width: 90%" id="lecCareer" name="lecCareer"></textarea>
					</div>
					</div>


					<br>
					
					<div class="col-12">
					<button class="btn btn-warning"
						style="margin: 10px; display:none; width: 100%; padding: 10px;" id="sendmsg">강사에게
						콜라보 신청</button>
					</div>
				</div>

			</div>
			</div>

			<!-- 강사부분 끝 -->


			<div class="row" style="text-align: left">
				<h5>클래스 커리큘럼</h5>
				
					<textarea rows="10" placeholder="클래스 커리큘럼" name="curriCulum" required autocomplete="off">
					</textarea>
			</div>

			<div class="row" style="text-align: left">
				<h5>클래스 설명</h5>
				
					<textarea rows="10" placeholder="클래스 설명" name="cDesc" required autocomplete="off">
					</textarea>
				
			</div>




			<div class="row">
				<h5>확인 내용</h5>
				<div class="input-group">
					<input type="checkbox" id="terms" /> <label for="terms"> 위 내용에 동의합니다.</label>
				</div>
			</div>
			<button class="btn btn-primary" type="button" id="insertclass"
				style="margin: 10px; padding: 10px;">클래스 개설 신청</button>
			<button class="btn btn-primary" type="button" onClick="location.href='/classBizList.do'"
				style="margin: 10px; padding: 10px;">클래스 목록으로</button>

		</form>
	</div>
	<br>

	<script>
		//사진 미리보기 설정
		function setImage(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.getElementById("class-image");
				img.setAttribute("src", event.target.result);

			}

			reader.readAsDataURL(event.target.files[0]);
		}
		
		
		
		$(document).ready(function () { //기존 강사 목록에서 선택 || 새로운 강사 추가 
			
			$("input:radio[name=lectureropt]").click(function(){
			var lecval = $('input:radio[name=lectureropt]:checked').val();

			if(lecval == "leclist") {
				
		    	$("#lecadddiv").hide();
		    	$("#leclistdiv").show();
		    	
		    	
		    }
		    else {
		    	$("#leclistdiv").hide();
		    	$("#lecadddiv").show();
		    	
		    }
		 });
		
		$("#insertclass").click(function(){
			alert("등록");
			$("#cfrm").submit();
		})

			
		});
		
		
		
		
		
		
		function showSection(lec) { //강사 추가 나를 강사로 추가 || 다른 강사 추가
		
			if(lec.value == "${sessionScope.mId}") {
		    	$("#otherlec").hide();
		    	$("#sendmsg").hide();
		    	$("#melec").show();
		    	
		    }
		    else {
		    	$("#otherlec").show();
		    	$("#melec").hide();
		    	$("#sendmsg").show();
		    	
		    }

		}
	
		

		
	</script>

</body>
</html>