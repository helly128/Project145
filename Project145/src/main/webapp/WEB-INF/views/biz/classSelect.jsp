
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
<body style="padding: 0;">
<script type="text/javascript">

$(function(){ //아작스
	
	//강사 수정 클릭시, 클래스 상태가 진행중이거나 종료 이면 안넘어감
	$("#changelec").click(()=>{
	console.log($("#status").val());
	var status = $("#status").val();
	if(status == "강사미정" || status=="강사승인대기"){
		alert ('모달을 띄움니다.');
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
			<input type="hidden" id="status" value='${cvo.status}'>

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
						style="margin: 20px; width: 100%; padding: 10px;">강사 변경</button>
 
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


</body>
</html>