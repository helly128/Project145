<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!--====== Register CSS ======-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/memberRegister.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
$(function(){
	
//ajax 1
$("#search").click(()=>{
	$.ajax(
		{
			type:"POST",
			url:"bizNumCheck.do",
			data:{data: $("#bizNum").val()}, //사용하는 함수 
			dataType:"json",
			success: function(map){
				if(map.bizname == null){
					$("#result").text("사업자번호 오류: 다시 검색해주세요.");
					
				}
				else if (map.bizname != $("#restName").val()){
					$("#result").text("사업체명 오류: 다시 검색해주세요");
					
				}
				else if(map.bizname == $("#restName").val()){
				bizadd =map.bizaddress;
					$("#result").text("사업자 확인 완료. 다음으로");
					
				$("#restsearch").css("background-color","lightgreen");
				$("#restsearch").show();
				$("#search").val("완료");
				$("#search").css("background-color","#efefef");
				$("#search").css("border","none");
				$("#search").css("color","green");
				$("#search").css("font-size","1.2rem");
				
				$("#restAddress").val(map.bizaddress);
				$("#restAddress").css("font-size","1.2rem");
				$("#restAddress").css("color","green");
				
				} else{ 
				$("#result").text("잘못된 사용자 번호이거나 서버 오류입니다. 다시 검색해주세요.");
			}},
			error:(log)=>{alert("실패+log")
			}
				
		});
});

//ajax2 
$("#restsearch").click(()=>{
	$.ajax(
		{
			type:"POST",
			url:"bizCheck.do",
			data:{data: $("#restName").val()}, //사용하는 함수 
			dataType:"json",
			success: function(map){
				if(result != null){
					$("#result").text("채식당에 등록된 식당입니다. 회원가입 페이지로 넘어갑니다.");
					
					$("#restsearch").hide();
					$("#submit").css("background-color","lightgreen");
					$("#submit").show();
					//$("#list").add(map.list??)
					/* 채식당에 등록된 같은 이름의 식당이 있습니다. 리스트 보여주기 게시판 ajax로? 
					목록 중에서 내식당임 -> update 로 넘어감 > 바로 업데이트 ? 혹은 등록 신청(관리자가 확인해주면 등록 완성?)
					목록 중에 없음. 내 식당 등록 -> insert
					입력하신 정보가 입력되었습니다. 가입페이지로 넘어감. */				
				} else{ 
				$("#result").text("새로운 식당의 발견! 식당으로 등록하시겠습니까?");
				$("#restsearch").hide();
				//submit action위치 바꾸기. 
				$("#submit").css("background-color","lightgreen");
				$("#submit").show();
			}},
			error:(log)=>{alert("실패+log")
			}
				
		});
});


})

</script>

<title>사업자 회원가입</title>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<div align="center">
		<h2>사업자 확인</h2>

		<div class="search-wrapper">

			<form action="bizInfoRegister.do">

				<div id="result" style="font-size: 1.5rem; color: green;">등록된
					사업체명과 사업자등록 번호를 입력한 후 검색해주세요.</div>
				<div class="labelf">
					<p class="label-txt">사업체 이름</p>
					<input type="text" class="input" name="restName"
						placeholder="등록된 사업체명" id="restName" required>

					<div class="line-box">
						<div class="line"></div>
					</div>
				</div>

				<div class="labelf">
					<h3 class="label-txt">사업자 등록번호</h3>
					<input type="text" class="input" name="bizNum"
						placeholder="10자리번호" id="bizNum" required>

					<div class="line-box">
						<div class="line"></div>
						<br>
						<input name="search" class="search" id="search" type="button"
							value="검색"
							style="float: right; background-color:lightGreen; height: 30px; width: 50px; font-size: 1.5rem; border-radius: 0; padding:0;">
					</div>
					<br>

				</div>

			<div class="labelf">
				<p class="label-txt">사업체 전화번호</p>
				<input type="text" class="input" name="restTel" id="restTel"
					placeholder="전화번호 입력" required>
				<div class="line-box">
					<div class="line"></div>

				</div>
				</div>

				<div class="labelf">
					<p class="label-txt">사업체 주소 결과</p>
					<input type="text" class="input" name="restAddress"
						id="restAddress" readOnly required>

				</div>
				<div class="list"></div>
				<div class="labelf">

					<br>
					<button type="button" id="restsearch" style="display: none">식당 정보 검색</button>
					<button type="submit" id="submit" style="display: none">다음</button>
					<button type="button" id="cancel"
						onclick="location.href='memberRegister.do'">취소</button>
				</div>

			</form>
		</div>

		<br> <br> <br>
	</div>

</body>
</html>