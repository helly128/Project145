<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<style>
.smbtn {
	color: black
}
</style>
<meta charset="UTF-8">

<!--====== Register CSS ======-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/memberRegister.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
	$(function() {
		//ajax db에서 같은 이름의 식당 리스트를 가져온다.
		$("#searchbtn").click(()=>{
			$.ajax(
				{
					type:"POST",
					url:"restCheck.do",
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
								str +='</tr>';
								
							});
							$("#bizSearchList").append(str);
							
							$("#result").text("채식당에 이미 등록된 식당입니다. 아래 리스트에서 확인하세요.");
							//submit action위치 바꾸기. 
							$('#frm').attr("action", "bizInfoUpdate.do");
							
							$("#restsearch").hide();
							$("#submit").text('내식당등록');
							$("#submit").css("background-color","lightgreen");
							$("#submit").show();
								
						}else{ 
							var str = "새로운 채식 식당의 발견! 새 식당으로 등록해주세요."
							$("#noResult").append(str);
							
						$("#result").text("새로운 식당의 발견! 새로운 식당으로 등록합니다.");
						$("#restsearch").hide();
						$("#submit").css("background-color","lightgreen");
						$("#submit").show();
					}},
					error:(log)=>{alert("검색에 실패했습니다.")
					}
						
				});
		});

	});
</script>

<title>NewRestaurantInsert</title>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<div align="center">
		<h2>식당/메뉴 등록</h2>
	</div>

	<div class="search-wrapper">

		<form id="frm" action="restInsert.do">

			<div class="labelf">
				<p class="label-txt" style="font-size: 1.6rem; font-weight: bold;">식당명</p>
				<button name="search" class="searchbtn" id="searchbtn" type="button"
					style="float: right; background-color: #6C9852; height: 33px; width: 60px; 
					font-size: 1.3rem; border-radius: 50px; padding: 2px 0px 0px 0px;"
					onclick="location.href='restNameSerch.do'">확 인</button>
					
				<input type="text" class="input" id="restName" name="restName"
					style="padding: 17px 0px 17px 30px; width: 400px;" 
					placeholder="식당명을 입력해주세요." required>
				<div class="line-box">
					<div class="line"></div>
				</div>
			
			</div>
			<div class="labelf">
				<p class="label-txt" style="font-size: 1.6rem; font-weight: bold;">식당사진(1장)</p>
				<input type="file" class="input" name="uploadfile"
					multiple="multiple">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</div>

			<div class="labelf">
				<p class="label-txt" style="font-size: 1.6rem; font-weight: bold;">주소</p>
				<input type="text" class="input" id="" name=""
					placeholder="식당 주소를 입력해주세요." required>
				<div class="line-box">
					<div class="line"></div>
				</div>
			</div>

			<div class="labelf">
				<p class="label-txt" style="font-size: 1.6rem; font-weight: bold;">전화번호</p>
				<input type="text" class="input" id="" name=""
					placeholder="식당 전화번호를 입력해주세요.">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</div>

			<div class="labelf">
				<p class="label-txt" style="font-size: 1.6rem; font-weight: bold;">영업시간</p>
				<input type="text" class="input" id="" name=""
					placeholder="식당 영업시간을 입력해주세요.">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</div>

			<div class="labelf">
				<p class="label-txt" style="font-size: 1.6rem; font-weight: bold;">메뉴</p>
				
				<input type="text" class="input" id="" name="" placeholder="메뉴명" style="width: 200px; padding: 17px 0px 17px 0px;" required>
				<input type="text" class="input" id="" name="" placeholder="가격" style="width: 120px; padding: 17px 0px 17px 0px;" required>
				<select name="beganType" onchange="" id="beganType" style="width: 100px; heigh: 50px; font-size:1.3rem;">	
					<form name=move method=post>
						<option value="none" selected disabled>채식타입</option>
						<option value="began">비건</option>
						<option value="racto">락토</option>
						<option value="ovo">오보</option>
						<option value="ractoOvo">락토오보</option>
					</form>
				</select>
				<div class="line-box">
					<div class="line"></div>
				</div> 
					
			</div>
			<div>
			<button style="font-size: 1.5rem;" type="button" id="cancel" onclick="">취 소</button>
			<button style="font-size: 1.5rem;" type="submit" id="push" onclick="">등 록</button>
			</div>
		</form>
	</div>

	<br>
	<br>
	<br>
</body>
</html>