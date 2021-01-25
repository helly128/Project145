<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<style>
.smbtn {color:black}
</style>
<meta charset="UTF-8">

<!--====== Register CSS ======-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/memberRegister.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
$(function(){
	
//ajax 1 사업자 등록 정보를 크롬 드라이버로 가져온다
$("#searchbtn").click(()=>{
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
					$("#result").text("사업자 확인 완료. 식당 검색을 해주세요.");
					
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

//ajax2 db에서 같은 이름의 식당 리스트를 가져온다.
$("#restsearch").click(()=>{
	$.ajax(
		{
			type:"POST",
			url:"bizCheck.do",
			data:{restName: $("#restName").val()}, //사용하는 함수 
			dataType:"json",
			success: function(map){
				
				if(map != null && map.length > 0){
					console.log(map.length);
					console.log(map[0].restName);
					var str ='<tr>';
					$.each(map, function(i){
						str += '<td>'+map[i].restName+'</td>' +
						'<td>'+map[i].restAddress +'</td>' +
						'<td>'+'<input name="restEdit" type="radio" value="' +map[i].restId + '">'+'</td>';
			
						str +='</tr>' + '내식당 추가' ;
						
					});
					$("#bizSearchList").append(str);
					
					$("#result").text("채식당에 이미 등록된 식당입니다. 아래 리스트에서 확인하세요.");
					
					$("#restsearch").hide();
					$("#submit").css("background-color","lightgreen");
					$("#submit").show();
						
				}else{ 
					var str = "새로운 채식 식당의 발견! 새 식당으로 등록해주세요."
					$("#noResult").append(str);
					
				$("#result").text("새로운 식당의 발견! 새로운 식당으로 등록합니다.");
				$("#restsearch").hide();
				//submit action위치 바꾸기. 
				$("#submit").css("background-color","lightgreen");
				$("#submit").show();
			}},
			error:(log)=>{alert("실패임")
			}
				
		});
});


//ajax3
$("#restEdit").click(()=>{
	$.ajax(
		{
			type:"POST",
			url:"bizRestEdit.do",
			data:{restId: $(this).val()}, //사용하는 함수 
			dataType:"json",
			success: function(n){
				if(n != null) {
					alert("레스토랑의 관리자가 되었습니다.");
				}else {alert("수정 오류");}
			},
			error:(log)=>{alert("수정 실패")
			}	
		});
});

});

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
						<input name="search" class="searchbtn" id="searchbtn" type="button"
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
						
				<table id="bizSearchList" border="1" style="width:100%; height:30px; font-size:1rem;">
				<tr><td>식당명</td><td>식당 주소</td><td>내 식당 확인</td></tr>
				</table>
				
				</div>
				<div id="noResult"></div>
				<div class="labelf">

					<br>
					<button type="button" id="restsearch" >식당 정보 검색</button>
					<button type="submit" id="submit" style="display: none">등록</button>
					<button type="button" id="cancel"
						onclick="location.href='memberRegister.do'">취소</button>
				</div>

			</form>
		</div>
		
		
		<br> <br> <br>
	</div>

</body>
</html>