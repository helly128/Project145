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
		alert("이미 시작되거나 종료된 강의의 강사정보는 수정이 불가합니다.");
	}
	});
//내 이력 수정
	$("#savecareer").click(()=>{
    	console.log($("#career").val());
       $.ajax(
          { 
             type:"POST",
             url:"myCareerUpdate.do",
             data:{career: $("#career").val()}, //사용하는 함수 
             dataType:"json",
             success: function(n){
                if(n!=0){
                   $("#saveResult").text("이력이 등록되었습니다.");
                   var btnmsg="이력 재수정";
                   $("#savecareer").text(btnmsg);
                   alert("등록되었습니다.");
                   $("#aftercareer").text($("#career").val());
               	 $('#smallModal').modal("hide");
                }
                else{
                   $("#saveResult").text("등록 실패");
                   
                }
             	
             },
             error:(log)=>{alert("실패+log")
             }
                
          });
    });
	
	
});



</script>


<script>
$(function(){  

    // 메세지 프리뷰 
   $("#preview").click(()=>{
	 console.log($("#cTitle").val());
	 console.log($("#cStart").val());
	 console.log($("#cEnd").val());
	 console.log($("#cTime").val());
	 console.log($("#cLoc").val());
	 console.log($("#cParti").val());
	 console.log($("#cPrice").val());
	 console.log($("#proposal2").val());
	 
	 var start = $("#cStart").val() + " ~  " ;
	 var end = $("#cEnd").val() + "까지 ";
	 var time = $("#cTime").val() +"에 ";
	 var loc = $("#cLoc").val() +"에서 ";
	 var parti = "정원 "+$("#cParti").val() + "명 으로 ";
	 var price = "원비 "+$("#cPrice").val() + "의 금액으로 진행하려 합니다.";
	 var msg =  $("#proposal2").val() ;
	 var proposal = title + start + end+ time+ loc+parti+price+msg ;
	 
	 $("#lecProposal").val(proposal);
 });
    
 // 두번째 아작스, 강사에게 콜라보 신청 보내기 (proposal 메세지만 보내면 됨)
   $("#applyCollabo").click(()=>{
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
                   
                }
                else{
                   $("#saveResult").text("등록 실패");
                   
                }
             	alert("등록되었습니다.");
             },
             error:(log)=>{alert("실패+log")
             }
                
          });
    });
 
// 날짜 미니멈
   //get today in date yyyy-mm-dd
   var today = new Date();
   var dd = today.getDate();
   var mm = today.getMonth()+1; 
//January is 0 so need to add 1 to make it 1!
   var yyyy = today.getFullYear();
   if(dd<10){
     dd='0'+dd
   } 
   if(mm<10){
     mm='0'+mm
   } 
   today = yyyy+'-'+mm+'-'+dd;
//set today as min of start date
   document.getElementById("cStart").setAttribute("min", today);
    })
    //종료일 미니멈 설정
  function setendmin(e){
   console.log(e);
   document.getElementById("cEnd").setAttribute("min", e);
   }  
    

</script>

	<div class="container" align="center">
		<form id="cfrm" class="cfrm" action="/classBizUpdate.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="mId" id="mId" value='${sessionScope.mId}'>
			<input type="hidden" name="cId" id="cId" value='${classVo.getCId()}'>
			<br>
			<div class="pagetitle" align="center">
			<input type="hidden" id="status" value="${classVo.status}">
				<h3>클래스 수정</h3>
			</div>
			<br>
			<div class="row" id="uploadpic">
				<h5>대표사진</h5>

				<div class="div-image" style="float: right;">
					<input type="file" name="uploadfile" class="classPic"
						accept="image/* " onchange="setImage(event);"
						style="background-color: white; border: none; margin-left: 10px; padding: 0; border-radius: 2px;">
				</div>
				<input type="hidden" name="cImg" value="${classVo.getCImg()}"> 
				<!-- Card Body -->
				<div class="image-container p-3" style="width: 100%" align="center">
					<img id="class-image" src="/images/${classVo.getCImg()}"
						height="300px" width="auto">

				</div>
			</div>
			<br>
			<div class="row">
				<h5>클래스명</h5>
				<div class="input-group input-group-icon">
					<input type="text" placeholder="클래스 이름" id="cTitle" name="cTitle"
						value="${classVo.getCTitle()}" required autocomplete="off">
					<div class="input-icon">
						<i class="fa fa-pencil"></i>
					</div>
				</div>
			</div>

			<br>



			
				<h5>베지테리언타입</h5>
				
				<br>
				
				<!-- Example single danger button -->
				<div class="btn-group">
					<select class="selectpicker" name="vegType"
						data-style="btn-success" style="width: 200px; height:4rem;">
						<option value="${classVo.vegType }" selected>${classVo.vegType }</option>
						<option value="비건">🥦비건</option>
						<option value="락토">🧀락토</option>
						<option value="오보">🥚오보</option>
						<option value="락토오보">🧀🥚락토오보</option>
					</select>
				</div>
				
			<div class="row">
				<div class="col-half">
					<h5>시작일</h5>
					<div class="input-group">
						<input type="date" name="cStart" id="cStart"
						onChange="setendmin(this.value)" value="${classVo.getCStart()}">
					</div>
				</div>
				<div class="col-half">
					<h5>종료일</h5>
					<div class="input-group">
						<input type="date" name="cEnd" id="cEnd" value="${classVo.getCStart()}">
					</div>
				</div>
			</div>

		

			<div class="row">
				<h5>요일 / 시간</h5>
				<div class="input-group input-group-icon">
					<input type="text" name="cTime" id="cTime"
						placeholder="매주 ** 요일 오전/오후 ** 시" required autocomplete="off"
						value="${classVo.getCTime()}">
					<div class="input-icon">
						<i class="fa fa-pencil"></i>
					</div>
				</div>
			</div>

			<div class="row">
				<h5>장소</h5>
				<div class="input-group input-group-icon">
					<input type="text" name="cLoc" onclick="RestAddr()" class="input"
						value="${classVo.getCLoc()}" id="cLoc" required autocomplete="off">
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
							<button type="button"
								onclick="this.parentNode.querySelector('input[type=number]').stepDown()"></button>
							<input class="quantity" min="0" id="cParti" name="cParti"
								value="${classVo.getCParti()}" type="number">
							<button type="button"
								onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
								class="plus"></button>
						</div>
					</div>
				</div>
				<div class="col-half">
					<h5>가격(5000원 단위)</h5>
					<div class="input-group">
						<div class="number-input" style="margin: 10px">
							<button type="button"
								onclick="this.parentNode.querySelector('input[type=number]').stepDown(1000)"></button>
							<input class="quantity" min="1000" id="cPrice" name="cPrice"
								value="${classVo.getCPrice()}" type="number">
							<button type="button"
								onclick="this.parentNode.querySelector('input[type=number]').stepUp(5000)"
								class="plus"></button>
						</div>
					</div>
				</div>
			</div>
			<br> <br>
			<h5>강사 정보</h5>
			<br>

			<div class="card shadow mb-4" id="leclistdiv">
				<br>
				<div class="row">
					<div class="col-half">
						<h5 style="padding-top: 20px;">강사이름</h5>
						<input type="hidden" id="lecImg" value="${mvo.profileImage}" >
						<input type="hidden" id="lecName" value="${mvo.getMName()}">
						<h5>${mvo.getMName()}</h5>
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
								<div class="profile-avatar" style="padding: 10px 100px">

									<c:if test="${mvo.profileImage ne null }">
										<img style="border-radius: 50%;" width="200px" height="200px;"
											src="/images/${mvo.profileImage}" />
									</c:if>
									<c:if test="${mvo.profileImage eq null }">
										<img style="border-radius: 50%;" width="200px" height="200px;"
											src="/images/default.png/">
									</c:if>

								</div>


							</div>
						</div>

						<br>
						<div class="col-half">
							<div class="msg" align="left">
								<div>
									<h5>강사이력</h5>
									<div id="aftercareer">
										<h6>${mvo.career}</h6>
									</div>
								</div>

							</div>
							<br>

							<div align="left" style="padding-right: 40px">
								<h5>보낸 제안서</h5>
								<h6>${classVo.lecProposal}</h6>
							</div>

							<div align="left" style="padding-right: 40px">
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


			<div class="row" style="text-align: left">
				<h5>클래스 커리큘럼</h5>

				<textarea rows="5" placeholder="클래스 커리큘럼" name="curriCulum" required
					autocomplete="off">${classVo.getCurriCulum()}</textarea>
			</div>

			<div class="row" style="text-align: left">
				<h5>클래스 설명</h5>
				<textarea rows="5" placeholder="클래스 설명" name="cDesc" required
					autocomplete="off">${classVo.getCDesc()}</textarea>
			</div>

			<!-- 			<div class="row">
				<h5>확인 내용</h5>
				<div class="input-group">
					<input type="checkbox" id="terms" /> <label for="terms"> 위
						내용에 동의합니다.</label>
				</div>
			</div> -->
			<button class="btn btn-primary" type="button" id="updateclass"
				style="margin: 10px; padding: 10px;">클래스 수정</button>
			<button class="btn btn-primary" type="button"
				onClick="location.href='/classBizList.do'"
				style="margin: 10px; padding: 10px;">클래스 목록으로</button>

		</form>
	</div>
	
	
	<!--=========================== 모달 ==========================   -->

<div class="modal fade" id="smallModal" tabindex="-1" role="dialog"
		style="padding-top: 200px;" aria-labelledby="basicModal"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="padding:20px;">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">강사정보 수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
			<!-- 내 이력 수정 / 새로운 강사 검색   -->
			<div class="card shadow mb-4" id="lecadddiv" style="padding:20px;">
				<br>

				<div class="row">
					<div class="col-half">
						<h5 style="padding-top: 20px;">강사이름 : </h5><div id ='lecNamesel' style="font-size: 2rem; padding-left:20px;">${mvo.getMName()}</div>
					</div>
					<div class="col-half">
						<div class="input-group">
							<select name="lecturerId" id="lecInfo" onchange="showSection(this.value)"
								style="width: 90%; padding: 0px; margin: 0px;">
								<option value="" selected>추가 옵션을 선택하세요</option>
								<option value="${sessionScope.mId}">내 이력 수정 :
									${sessionScope.mId}</option>
								<option value="other">외부 강사 추가</option>
							</select>

						</div>
					</div>

					<div class="col-lg-12">
						<div class="col-half">
							<div class="profile-cover">
								<div class="profile-avatar">
									<img id="showlecImage2" style="border-radius: 50%;"
										src="/images/default.png/" alt="더미그림" />
								</div>
							</div>
						</div>

						<div class="col-half">
							<div class="msg" id="melec" align="left">

								<h5>내 강사 이력 수정</h5>
								<textarea rows="8" name="career" id="career" style="width: 90%"></textarea>
								<button style="float:right;" id="savecareer">이력수정</button>&ensp; &ensp; 
							</div>

							<div class="msg" id="otherlec" align="left" style="display: none">
							
								강사 ID 입력<input type="text" id="lecinput" class="lec" style="width: 90%" onChange="changelecId(this.value)">
								<button style="float:right;" id="searchlecId">검색</button>&ensp; &ensp; 
			

							<h5>강사에게 메세지</h5>

							<textarea rows="3" id="proposal2"  class="proposal2"  name="proposal2" name="pro" style="width: 90%"></textarea>

							<div>
								미리 보기를 눌러서 메세지를 확인하세요.<button type="button" id="preview" class="preview">미리보기</button>
							</div>
							<div id="result"></div>
							<br>
<input id="lecId" name="lecId" value="${mvo.getMId()}"> 
				<h5>제안서 본문(자동으로 입력됩니다.)</h5>
							<textarea rows="8" name="lecProposal" id="lecProposal"
								style="width: 100%" readonly placeholder="본인이 강사인 경우는 제안서를 작성하지 않습니다."></textarea>
			<button id="applyCollabo">제안서 보내기</button>
							</div>
						</div>
					</div>
				
				</div>
			</div>
			
		
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

	
		function showSection(lec) { //나를 강사로 추가 || 다른 강사 추가
			alert('lec');
			var lecName = $("#lecName").val(); //img
			var lecImage =  $("#lecImg").val(); //name

			if (lec == "${sessionScope.mId}") {
				$("#showlecImage2").attr('src','/images/'+lecImage);
				$("#lecNamesel").text(lecName); //이름넣기
				$("#otherlec").hide();
				$("#sendmsg").hide();
				$("#savecareer").show();
				$("#melec").show();
				str="${sessionScope.mId}";
				$("#myId").val(str);
				
				

			} else {
				$("#showlecImage2").attr('src','images/default.png');
				$("#lecNamesel").text('아이디를 검색하세요.'); //이름넣기
				$("#otherlec").show();
				$("#melec").hide();
				$("#savecareer").hide();
				$("#sendmsg").show();
			}
		}
		//강사 아이디 찾아서 사진 보여주기 
		 $("#searchlecId").click(()=>{
	          console.log($("#lecinput").val());
	          $.ajax(
	             { 
	                type:"POST",
	                url:"classlecList.do",
	                data:{mId: $("#lecinput").val()}, //사용하는 함수 
	                dataType:"json",
	                success: function(mvo){
	                   if(mvo != ''){
	                   console.log(mvo);
	                   console.log(mvo.mid);
	                   console.log(mvo.profileImage);
	                   $("#lecNamesel").text(mvo.mid);
	                   $("#showlecImage2").attr('src','images/'+mvo.profileImage);
	                   $("#lecId").val(mvo.mid);
	                   }else {
	                	   alert('없는 회원ID 입니다.')
	                   }     
	                },
	                error:(log)=>{alert('없는 회원ID 입니다. 다시 검색해주세요')
	                }
	                   
	             });
	       });

		
		
</script>
<script>	
		var lecList = ${lecList2};
		function changeprofile(pro) {
			var lecturer = $("#lecturerId1").val();//pro.value; 받아올때 제이슨 값으로 object에 돌려서 받아옴.
			console.log("정보 검색 시작" + lecturer);
			
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
					$('#showlecInsta').prop('href',lecList[i].insta)
					
				
					
				}else{ console.log("그런 정보 없음")}
				
			}
			console.log("정보 검색 끝 ");
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