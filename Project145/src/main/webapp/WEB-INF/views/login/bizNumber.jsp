<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
//ajax 
$("#search").click(()=>{
	$.ajax(
		{
			type:"POST",
			url:"bizNumCheck.do",
			data:{data: $("#bizNumInput").val()}, //사용하는 함수 
			dataType:"json",
			success: function(map){
				if(map.bizname == null){
					$("#result").text("사업자번호 오류: 다시 검색해주세요.");
					
				}
				else if (map.bizname != $("#bizNameInput").val()){
					$("#result").text("사업체명 오류: 다시 검색해주세요");
					
				}
				else if(map.bizname == $("#bizNameInput").val()){
				bizadd =map.bizaddress;
					$("#result").text("사업자 확인 완료. 다음으로");
				
				
				$("#submit").show();
				$("#search").hide();
				$("#bizAddResult").val(bizadd);
				
				} else{ 
				$("#result").text("잘못된 사용자 번호이거나 서버 오류입니다. 다시 검색해주세요.");
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

			<form action="bizRegister.do">

				<div id="result" style="font-size: 1.5rem; color: green;">등록된
					사업체명과 사업자등록 번호를 입력한 후 검색해주세요.</div>
				<div class="labelf">
					<p class="label-txt">사업체 이름</p>
					<input type="text" class="input" name="bizNameInput"
						placeholder="등록된 사업체명" id="bizNameInput" required>

					<div class="line-box">
						<div class="line"></div>
					</div>




				</div>

				<div class="labelf">
					<h3 class="label-txt">사업자 등록번호</h3>
					<input type="text" class="input" name="bizNumInput"
						placeholder="10자리번호" id="bizNumInput" required>

					<div class="line-box">
						<div class="line"></div>
						<input name="search" class="search" id="search" type="button"
							value="검색"
							style="float: right; height: 40px; width: 20px; font-size: 1rem; border-radius: 0;">
					</div>
					<br>

				</div>


				<p class="label-txt">사업체 전화번호</p>
				<input type="text" class="input" name="bizphone" id="bizphone"
					placeholder="전화번호 입력" required>
				<div class="line-box">
					<div class="line"></div>

				</div>

				<div class="labelf">
					<p class="label-txt">사업체 주소 결과</p>
					<input type="text" class="input" name="bizAddResult"
						id="bizAddResult" readOnly required>

				</div>
				<div class="labelf">

					<br>
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