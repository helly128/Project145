<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	

$("#search").click(()=>{
	$.ajax(
		{
			type:"POST",
			url:"bizNumCheck.do",
			data:{data: $("#bizNumInput").val()}, //사용하는 함수 
			success: function(data){
				if(data == "RegBiz"){
				$("#result").text("사업자 확인 완료. 다음으로");
				alert('등록된 사업자번호 입니다.');
				
				$("#submit").show();
				$("#search").hide();
				
				} else{ alert('검색 실패. 다시 검색해주세요.');
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

<div align ="center">
<h2>사업자 확인</h2>

<div class="search-wrapper">

<form action="bizRegister.do">


 <div class="labelf">
    <p class="label-txt">사업장 이름</p>
    <input type="text" class="input" >

    <div class="line-box">
      <div class="line"></div> 
    </div>
 
 <div class="labelf">
    <p class="label-txt">사업체 주소 검색</p>
    <input type="text" class="input">

    <div class="line-box">
      <div class="line"></div>    <button style="float:right; top:-50px}">검색</button>
    </div>
</div>
    
    
</div>
 <div class="labelf">
    <p class="label-txt">사업자 등록번호</p>
    <input type="text" class="input" name="bizNumInput" 
    placeholder="10자리번호" id="bizNumInput" required>

    <div class="line-box">
      <div class="line"></div> 
      <input name="search" class="search" id="search" type="button" value="검색"
      style="float:right; height:40px; width:20px; font-size:1rem; border-radius: 0;" >
    </div>
    <br>
    <div id="result" style="font-size:1rem;">사업자등록 번호를 검색해주세요.</div>
</div>
		



  <br>
  <button type="submit" id="submit" style="display:none">다음</button>
  <button type="button" id="cancel"  onclick="location.href='memberRegister.do'" >취소</button>
</form>

</div>




<br>



<br>
<br>
</div>

</body>
</html>