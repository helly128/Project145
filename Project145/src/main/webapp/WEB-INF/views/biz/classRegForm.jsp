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
//자기 이력 member에 등록/수정 
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
    
  
    // 메세지 프리뷰 
   $(".preview").click(()=>{
	
	 console.log($("#cTitle").val());
	 console.log($("#cStart").val());
	 console.log($("#cEnd").val());
	 console.log($("#cTime").val());
	 console.log($("#cLoc").val());
	 console.log($("#cParti").val());
	 console.log($("#cPrice").val());
	 console.log($("#proposal2").val());
	 
	 var title = "안녕하세요"+ $("#lecId").val() +"강사님,  [" +$("#cTitle").val() + "]라는클래스를 ";
	 var start = $("#cStart").val() + " ~  " ;
	 var end = $("#cEnd").val() + "까지 ";
	 var time = $("#cTime").val() +"에 ";
	 var loc = $("#cLoc").val() +"에서 ";
	 var parti = "정원 "+$("#cParti").val() + "명 으로 ";
	 var price = "원비 "+$("#cPrice").val() + "의 금액으로 진행하려 합니다.";
	 var msg =  $("#proposal2").val() ;
	 var proposal = title + start + end+ time+ loc+parti+price+msg ;
	 
	if(proposal!="") {
		 $("#lecProposal").val(proposal);
	}
	 console.log( $("#lecProposal").val());
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
    });
 //
 
 
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
     


    
 
 
 
//
    }) 
//종료일 설정
function setendmin(e){
   console.log(e);
   document.getElementById("cEnd").setAttribute("min", e);
   }
//외부강사 아이디 입력시 lecId값 바꾸기 
function changelecId(e) {
 	console.log(e +"lec 클래스서 받아온lecId");
 	document.getElementById("lecId").value=e;
 }
</script>

	<div class="container" align="center">
		<form id="cfrm" class="cfrm" action="/classBizInsert.do">
			<input type="hidden" name="mId" id="mId" value='${sessionScope.mId}'>
			<input type="hidden" name="cId" id="cId" value='${cvo.getCId()}'>
			<input type="hidden" id="mName" value="${mvo.getMName() }">
			<input type="hidden" id="mImage" value="${mvo.profileImage }">
			<input type="hidden" id="mInsta" value="${mvo.insta }">

			<br>
			<div class="pagetitle" align="center">
				<h3>새로운 클래스 등록</h3>
				
				<h1>${cvo.getCId()}</h1>
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
						<tr><th></th><th></th><th></th></tr>
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
						name="vegType"
						style="text-align: center; height: 3rem; padding: 10px;">
				</div>
			</div>


			<div class="row">
				<div class="col-half">
					<h5>시작일</h5>
					<div class="input-group">
						<input type="date" name="cStart" id="cStart"
						onChange="setendmin(this.value)">
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
							<button type="button"
								onclick="this.parentNode.querySelector('input[type=number]').stepDown()"></button>
							<input class="quantity" min="0" id="cParti" name="cParti"
								value="1" type="number">
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
								value="5000" type="number">
							<button type="button"
								onclick="this.parentNode.querySelector('input[type=number]').stepUp(5000)"
								class="plus"></button>
						</div>
					</div>
				</div>
			</div>
			<!-- 강사 선택 옵션 탭  -->
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
								<div id="showlecCareer">
								
								</div>
							</div>

						</div>
						<br>
						<div class="msg" id="lecprop" align="left" style="display:none;">


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
			<button class="btn btn-primary" type="submit" id="insertclass"
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
