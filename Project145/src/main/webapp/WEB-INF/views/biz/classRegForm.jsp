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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/vegtype.css">


<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/classform.css">
<style>
</style>
<title>클래스 등록 폼</title>
</head>
<body style="padding: 0;">
<script>
$(function(){   
    
    $("#savecareer").click(()=>{
       $.ajax(
          {
             type:"POST",
             url:"myCareerUpdare.do",
             data:{career: $("#career").val()}, //사용하는 함수 
             dataType:"json",
             success: function(n){
                if(n==1){
                   $("#saveResult").text("이력이 등록되었습니다.");
                   $("#savecareer").val() ="이력 재수정";
                }
                else{
                   $("#saveResult").text("등록 실패");
                   
                }
             
             }},
             error:(log)=>{alert("실패+log")
             }
                
          });
    });
    }   

</script>

	<div class="container" align="center">
		<form id="cfrm" class="cfrm" action="/classBizInsert.do">
			<input type="hidden" name="mId" id="mId" value='${sessionScope.mId}'>

			<br>
			<div class="pagetitle" align="center">
				<h3>새로운 클래스 등록</h3>
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
					<input type="text" placeholder="클래스 이름" id="cTitle" name="cTitle"
						required autocomplete="off">
					<div class="input-icon">
						<i class="fa fa-pencil"></i>
					</div>
				</div>
			</div>

			<br>



			<p>
			<h5>베지테리언타입</h5>
			<br>

			<div class="labelf" align="center">

				<div class="demo">

					<table class="tbl">
						<tr>
							<th>채소</th>
							<th>유제품</th>
							<th>달걀</th>
						</tr>

						<tr>
							<th></th>
							<th></th>
							<th></th>
						</tr>
						<tr>


							<td>
								<div class="tbl-data" data-item="🥦" style="">
									<input type="checkbox" id="vegan" class="type" value="비건"
										checked disabled> <label for="vegan">&nbsp&nbsp&nbsp&nbsp</label>
								</div>
							</td>
							<td>
								<div class="tbl-data" data-item="🧀">
									<input type="checkbox" class="vtype" id="locto" value="락토">
									<label for="locto">&nbsp&nbsp&nbsp&nbsp</label>
								</div>
							</td>

							<td>
								<div class="tbl-data" data-item="🥚 ">
									<input type="checkbox" id="ovo" class="vtype" value="오보">
									<label for="ovo">&nbsp&nbsp&nbsp&nbsp</label>
								</div>
							</td>
						</tr>

					</table>
					<input type="text" id="vegi" readonly value="비건" required
						name="vegtype"
						style="text-align: center; display: none; height: 3rem; padding: 10px;">


				</div>



			</div>

			<!-- <div class="row">
				<div class="col-half">
					<input type="checkbox" class="input-text mb-4" id="vegan"
						name="vegType" value="비건" required> <label for="vegan">🥦&nbsp비건</label>

					&nbsp&nbsp <input type="checkbox" class="input-text mb-4"
						id="locto" name="vegType" value="락토" required><label
						for="locto">🧀&nbsp락토</label>

				</div>
				<div class="col-half">

					<input type="checkbox" class="input-text mb-4" id="ovo"
						name="vegType" value="오보" required><label for="ovo">
						🥚&nbsp오보</label> &nbsp&nbsp <input type="checkbox"
						class="input-text mb-4" id="allveg" name="vegType" value="모두"
						required><label for="allveg"> 🥗&nbsp모두</label>
				</div>



			</div>
 -->
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
					<input type="text" name="cTime" id="cTime"
						placeholder="매주 ** 요일 오전/오후 ** 시" required autocomplete="off">
					<div class="input-icon">
						<i class="fa fa-pencil"></i>
					</div>
				</div>
			</div>

			<div class="row">
				<h5>장소</h5>
				<div class="input-group input-group-icon">
					<input type="text" name="cLoc" onclick="RestAddr()" class="input"
						id="cLoc" placeholder="장소찾기api" required autocomplete="off">
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
					<input type="radio" name="lectureropt" value="leclist" id="leclist"
						checked=checked class="lectureropt"> <label for="leclist"><span><i
							class="fa fa-users"></i>기존 강사 목록</span></label> <input type="radio"
						name="lectureropt" value="lecadd" id="lecadd" class="lectureropt" />
					<label for="lecadd"> <span><i
							class="fa fa-user-plus"></i>강사 추가/수정</span></label>

				</div>

			</div>
			<!-- 기존 강사 목록에서 선택  -->
			<div class="card shadow mb-4" id="leclistdiv">
				<br>
				<div class="row">
					<div class="col-half">
						<h5 style="padding-top: 20px;">강사이름</h5><div id="showlecName">mName</div>
					</div>
					<div class="col-half">
						<div class="input-group">
							<select name="lecturerId1" onchange=""
								style="width: 90%; padding: 0px; margin: 0px;">
								<option value="">강사 선택 옵션</option>
								<option value="${sessionScope.mId}">내가 강사임 ID :
									${sessionScope.mId}</option>
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

					<br>
					<div class="col-half">
						<div class="msg" align="left">
							<div>
								<h5>강사이력</h5>
								<div id="lecCareer">
									<br> 강사의 이력은 이렇슴 애플<br> 삼성<br> 테슬라<br> 예담<br>
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
			<div class="card shadow mb-4" id="lecadddiv" style="display: none">
				<br>

				<div class="row">
					<div class="col-half">
						<h5 style="padding-top: 20px;">강사이름 mName</h5>
					</div>
					<div class="col-half">
						<div class="input-group">
							<select name="lecturerId2" onchange="showSection(this)"
								style="width: 90%; padding: 0px; margin: 0px;">
								<option value="">강사 추가 옵션</option>
								<option value="${sessionScope.mId}">내 이력 수정 :
									${sessionScope.mId}</option>
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
							<div class="msg" id="melec" align="left">

								<h5>내 강사 이력 수정</h5>
								<br> 강사 ID <input type="text" style="width: 90%"
									name="lecId" id="myId" value="${sessionScope.mId}" readonly>
								<textarea rows="8" name="career"  style="width: 90%"></textarea>


							</div>

							<div class="msg" id="otherlec" align="left" style="display: none">
								<h5>강사 제안서 본문</h5>
								강사 ID <input type="text" style="width: 90%" name="lecId"
									value="">

								<textarea rows="3" style="width: 90%" id="proposal"></textarea>

								<div id="proposal2" style="width: 90%">클래스 내용 입력시 자동으로
									완성되는 부분입니다.</div>

								<br>

								<h5>강사에게 메세지</h5>
								<textarea rows="8" name="proposal2" style="width: 90%"></textarea>
								<br>
								<textarea rows="8" name="lec_proposal" id="proposal"
									style="width: 90%"></textarea>
							</div>
						</div>


						<br>


					</div>
					<div class="col-12">
						<button class="btn btn-warning"
							style="margin: 20px; width: 90%; padding: 10px;"
							id="sendmsg">강사에게 콜라보 신청</button>

						<button class="btn btn-warning"
							type="button" style="margin: 10px; width: 90%; padding: 10px;"
							id="savecareer">내 이력 저장</button>




					</div>
				</div>
			</div>

			<!-- 강사부분 끝 -->


			<div class="row" style="text-align: left">
				<h5>클래스 커리큘럼</h5>

				<textarea rows="5" placeholder="클래스 커리큘럼" name="curriCulum" required
					autocomplete="off"></textarea>
			</div>

			<div class="row" style="text-align: left">
				<h5>클래스 설명</h5>
				<textarea rows="5" placeholder="클래스 설명" name="cDesc" required
					autocomplete="off"></textarea>
			</div>
			
<!-- 			<div class="row">
				<h5>확인 내용</h5>
				<div class="input-group">
					<input type="checkbox" id="terms" /> <label for="terms"> 위
						내용에 동의합니다.</label>
				</div>
			</div> -->
			<button class="btn btn-primary" type="button" id="insertclass"
				style="margin: 10px; padding: 10px;">클래스 개설 신청</button>
			<button class="btn btn-primary" type="button"
				onClick="location.href='/classBizList.do'"
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

		$(document).ready(function() { //기존 강사 목록에서 선택 || 새로운 강사 추가 

			$("input:radio[name=lectureropt]").click(function() {
				var lecval = $('input:radio[name=lectureropt]:checked').val();

				if (lecval == "leclist") {

					$("#lecadddiv").hide();
					$("#leclistdiv").show();

				} else {
					$("#leclistdiv").hide();
					$("#lecadddiv").show();

				}
			});

			$("#insertclass").click(function() {
				alert("등록");
				$("#cfrm").submit();
			})

		});

		function showSection(lec) { //강사 추가 나를 강사로 추가 || 다른 강사 추가

			if (lec.value == "${sessionScope.mId}") {
				$("#otherlec").hide();
				$("#sendmsg").hide();
				$("#savecareer").show();
				$("#melec").show();
				str="${sessionScope.mId}";
				$("#myId").val(str);

			} else {
				$("#otherlec").show();
				$("#melec").hide();
				$("#savecareer").hide();
				$("#sendmsg").show();

			}

		}

		//채식타입 선택 폼 

		$(".vtype").click(function() {
			if ($("#vegi").val() != null) {
				var str = "";
				$(".vtype").each(function() {

					if ($(this).is(":checked"))
						str += $(this).val() + '';
				});
				$("#vegi").val(str);
			} else {
				var str = "비건";
				$("#vegi").val(str);
			}
		});

		//주소 검색 api
		function RestAddr() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var roadAddr = ''; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById("cLoc").value = roadAddr;

				}
			}).open();
		}
		
		
		
		
	</script>

</body>
</html>