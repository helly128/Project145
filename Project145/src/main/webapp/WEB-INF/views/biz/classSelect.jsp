
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
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
<body style="padding: 0;">
<script type="text/javascript">

$(function(){ //아작스
	
	//강사 수정 클릭시, 클래스 상태가 진행중이거나 종료 이면 안넘어감
	$("#changelec").click(()=>{
	console.log($("#status").val());
	var status = $("#status").val();
	if(status == "강사미정" || status=="강사승인대기"){
		alert ('모달을 띄움니다.');
		//모달창 =============================
		   
			  
			    $('#smallModal').modal("show");
			   
			   // 2. 모달창 닫기 버튼
			   $('.close').on('click', function() {
			    $('#background_modal').modal("hide");
			   });
			   // 3. 모달창 위도우 클릭 시 닫기
			   $(window).on('click', function() {
			    if (event.target == $('#background_modal').get(0)) {
			              $('#background_modal').hide();
			           }
			   }); 
			   //모달창 =============================
	}else {
		alert("이미 시작된 강의의 강사정보는 수정이 불가합니다.");
	}
	});
	
	
//모달에서 ! 수정 아작스 
/* 	$("#applyCollabo").click(()=>{
    	console.log($("#lecProposal").val());
       $.ajax(
          { 
             type:"POST",
             url:"applyCollabo.do",
             data:{lecProposal: $("#lecProposal").val(), cId : $("#cId").val()}, //사용하는 함수 
             dataType:"json",
             success: function(n){
                if(n!=0){
                   $("#applyResult").text("메세지를 보냈습니다.");
                   var btnmsg="메세지 다시 보내기";
                   $("#savecareer").text(btnmsg);
                   alert("등록되었습니다.");
                }
                else{
                   $("#saveResult").text("등록 실패");
                   alert("등록실패");
                }
             	
             },
             error:(log)=>{alert("실패+log")
             }
                
          });
    }); */
 //모달에서 수정 아작스끝 
	
	
});



</script>



	<div class="container" align="center">
		<form id="cfrm" class="cfrm" action="/classBizEdit.do">
			<input type="hidden" name="mId" id="mId" value='${sessionScope.mId}'>
			<input type="hidden" id="status" value='${classVo.status}'>

			<br>
			<div class="pagetitle" align="center">
				<h4>클래스 상세 페이지</h4>
			</div>
			<br>
			<div class="row" id="uploadpic">
				<!--사진 Card Body -->
				<div class="image-container p-3" style="width: 100%" align="center">
					<img id="class-image" src="/images/${classVo.getCImg()}" height="300px"
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

			

			<h5>강사 정보</h5>
			<br>
					
			<div class="card shadow mb-4" id="leclistdiv">
				<br>
				<div class="row">
					<div class="col-half">
						<h5 style="padding-top: 20px;">강사이름</h5>
						<h6>${mvo.getMName()}</h6>
					</div>
					<div class="col-half" align="left">
						<h5 style="padding-top: 20px;">강사아이디</h5>
						<div>
							<h6>${mvo.getMId()}</h6>
					</div>
				</div>


				<div class="row">
					<div class="col-half">
						<div class="profile-cover">
							<div class="profile-avatar" style="margin:10px 70px;">
								<img style="border-radius: 50%;" width="200px" height="200px;"
									src="/images/${mvo.profileImage}" />
							</div>

							<div class="profile-details" style="font-size: 1.5rem">
								<a href="https://www.instagram.com/maxencefvl/?hl=ko"
									target="blank"><i class="fa fa-id-card-o"></i></a> &nbsp <a
									id="showlecInsta" href="naver.com" target="blank"> <i
									class="fa fa-instagram"></i></a> &nbsp<a
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
								<div>
									<h6>${mvo.career}"</h6>
								</div>
							</div>

						</div>
						<br>
						
						<div align="left" style="padding-right:40px">
						<h5>보낸 제안서</h5>
							<h6>${classVo.lecProposal}</h6>
						</div>
						
						<div align="left" style="padding-right:40px">
						<h5>받은 답변</h5>
							<h6>${classVo.lecResponse}</h6>
							<br>
						</div>
						
					</div>
					<br>

					<button class="btn btn-warning" type="button" id ="changelec"
						style="margin: 20px; width: 100%; padding: 10px;"
						>강사 변경</button>
 				
				</div>
			</div>
			
			</div>
			<!-- 강사부분 끝 -->


			<div class="row" style="text-align: left" align="left">

				<h5>클래스 커리큘럼</h5>
				<div class="input-group">
					<h6>${classVo.getCurriCulum()}</h6>
				</div>
			</div>

			<div class="row" style="text-align: left" align="left">

				<h5>클래스 설명</h5>
				<div class="input-group">
					<h6>${classVo.getCDesc()}</h6>
				</div>
			</div>

			<input type="hidden" id= "cId" name="cId" value="${classVo.getCId()}">

			<button class="btn btn-primary" type="submit"
				style="margin: 10px; padding: 10px;"
				onClick="location.href='/classBizEdit.do'">클래스 정보 수정</button>
			<button class="btn btn-primary" type="button"
				onClick="location.href='/classBizList.do'"
				style="margin: 10px; padding: 10px;">클래스 목록으로</button>

		</form>
	</div>

	<br>
	
	<div class="modal fade" id="smallModal" tabindex="-1" role="dialog"
		style="padding-top: 200px;" aria-labelledby="basicModal"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">강사정보 수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div id="lecResult" class="modal-body" align="center">
					<!-- 강사 선택 옵션 탭  -->
			<div class="row">
				
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
						<h5 style="padding-top: 20px;">강사이름</h5>
						<div id="showlecName"></div>
					</div>
					<div class="col-half" align="left">
						<h5 style="padding-top: 20px;">강사아이디</h5>
						<div class="input-group">
							<!-- 같은 비즈 넘버 아래의 강사 아이디 보여주는 부분 -->
							<select id="lecturerId1" required
								style="width: 80%; padding: 0px; margin-right: 50px;"
								class="form-control" onChange="changeprofile()">
								<option selected value="-">계정을 선택해주세요.</option>
								<c:forEach items="${lecList}" var="lec">
									<option><c:out value="${lec.getMId()}" /></option>
								</c:forEach>
							</select>

						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-half">
						<div class="profile-cover">
							<div class="profile-avatar">
								<img id="showlecImage" style="border-radius: 50%;" width="200px" height="200px;"
									src="" alt="" id="더미그림" />
							</div>

							<div class="profile-details" style="font-size: 1.5rem">
								<a href="https://www.instagram.com/maxencefvl/?hl=ko"
									target="blank"><i class="fa fa-id-card-o"></i></a> <a
									id="showlecInsta" href="naver.com" target="blank"> <i
									class="fa fa-instagram"></i></a><a
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
								<div id="showlecCareer">
								
								</div>
							</div>

						</div>
						<br>
						<div class="msg" id="lecprop" align="left" >


							<h5>강사에게 메세지</h5>

							<textarea rows="3" id="proposal2" class="proposal2" name="proposal2" name="pro" style="width: 90%"></textarea>

							<div>
								<button type="button" class="preview">Preview</button>
							</div>
							<div id="result"></div>
							<br>
	
							
						</div>

					</div>
					<br>

					<!-- <button class="btn btn-warning" type="button"
						id ="applyCollabo"
						style="margin: 20px; width: 100%; padding: 10px;">강사에게
						콜라보 신청</button>
 -->
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
								<option value="" selected>추가 옵션을 선택하세요</option>
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
									<img id="showlecImage2" style="border-radius: 50%;"
										src="" alt="더미그림" />
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
								
								<textarea rows="8" name="career" id="career" style="width: 90%"></textarea>


							</div>

							<div class="msg" id="otherlec" align="left" style="display: none">
							
								강사 ID 입력<input type="text" class="lec" style="width: 90%" onChange="changelecId(this.value)">



							<h5>강사에게 메세지</h5>

							<textarea rows="3" id="proposal2"  class="proposal2"  name="proposal2" name="pro" style="width: 90%"></textarea>

							<div>
								미리 보기를 눌러서 메세지를 확인하세요.<button type="button" class="preview">미리보기</button>
							</div>
							<div id="result"></div>
							<br>


						
						
								
							</div>
						</div>


						<br>


					</div>
					<div class="col-12">
						<div class="applyResult"></div>
						<!-- <button class="btn btn-warning"
							style="margin: 20px; width: 90%; padding: 10px; display: none;"
							id="sendmsg">강사에게 콜라보 신청</button>

						<button class="btn btn-warning" type="button"
							style="margin: 10px; width: 90%; padding: 10px;" id="savecareer">내
							이력 저장</button> -->




					</div>
				</div>
			</div>
			<input id="lecId" name="lecId" value="${mvo.getMId()}"> 
				<h5>제안서 본문(자동으로 입력됩니다.)</h5>
							<textarea rows="8" name="lecProposal" id="lecProposal"
								style="width: 90%" readonly placeholder="본인이 강사인 경우는 제안서를 작성하지 않습니다."></textarea>
			<!-- 강사부분 끝 -->
					
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
	
<script>










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

	

});



function showSection(lec) { //강사 추가 나를 강사로 추가 || 다른 강사 추가

	if (lec.value == "${sessionScope.mId}") { //나랑 아이디 같으면? 
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

//강사 목록 선택시, 프로필 정보 바꾸기 
var mId = $("#mId").val();
var	mName= $("#mName").val();
var mImage = $("#mImage").val();
var mInsta =  $("#mInsta").val();
var lecList = ${lecList2};
function changeprofile() {
	var lecturer = $("#lecturerId1").val();//pro.value; 받아올때 제이슨 값으로 object에 돌려서 받아옴.
	console.log("정보 검색 시작" + lecturer);
	//if(lecturer != $("#lecturerId1").val()){
	for(i = 0; i < lecList.length ; i ++){
		if ( lecList[i].mid == lecturer ) {
			console.log(lecList[i].mid + "가 아이디임");
			console.log(lecList[i].mname + "가 이름임");
			console.log(lecList[i].career + "가 커리어임");
			console.log('/images/'+lecList[i].profileImage);
			console.log(lecList[i].insta +'인스타임');
			
			
			$("#showlecName").text(lecList[i].mname);
			$("#showlecCareer").text(lecList[i].career);
			$("#showlecImage").attr('src','/images/'+lecList[i].profileImage);
			$('#showlecInsta').prop('href',lecList[i].insta);
			//lecId에 값 넣어주기 
			
		}
		
	}
	//}else{console.log('내아이디, 제안서 보낼필요 없음');}
	$("#lecId").val(lecturer);
	console.log(lecturer+"로 변경")
	console.log("정보 검색 끝 ");
}

</script>

</body>
</html>