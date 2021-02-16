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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//주소 검색 api
	function RestAddr() {
	    new daum.Postcode({
	        oncomplete: function(data) {
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = ''; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                
                
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("restAddress").value = roadAddr;
                
	        }
	    }).open();
	}
</script>
<script>
	$(function() {
		//ajax db에서 같은 이름의 식당 리스트를 가져온다.
		$("#searchbtn").click(()=>{
			if( $("#restName").val() != "") {
				$("#restNameList").text("");

				$.ajax({
					type:"POST",
					url:"restNameSerchList.do",
					data:{restName: $("#restName").val()}, //사용하는 함수 
							
					dataType:"json",
					success: function(map){
					if(map != null && map.length > 0){
						console.log(map.length);
						console.log(map[0].restName);
						var str = "";
						$.each(map, function(i){
						str += '<a href=#>' + map[i].restName + '</a>'+'<br>';
										
						});
						$("#restNameList").show();
						$("#restNameList").append(str);
									
									
						$("#result").text("채식당에 이미 등록된 식당 이름입니다. 같은 식당이 아닌지 확인해주세요.");
						//submit action위치 바꾸기. 
										
					}else{
						$("#restNameList").text("");
						var str = "새로운 채식 식당의 발견! 새 식당으로 등록해주세요."
						$("#result").text(str);
					}},
						error:(log)=>{alert("검색에 실패했습니다.")
					}
								
				});
				
			} else {
				$("#restNameList").text("");
				$("#result").text("식당명을 입력해주세요.");
			}
			
		});

	});
</script>
<script type="text/javascript">
/* 메뉴 추가하기 */
	var length = 1;
	$(function() {
		$('#PlusButton').on('click', function() {
			var div = document.createElement('div');
			div.innerHTML = document.getElementById('childForm').innerHTML;
			$(div).find('#menuName').attr('name', 'menuVoList['+length+'].menuName');
			$(div).find('#menuPrice').attr('name', 'menuVoList['+length+'].menuPrice');
			$(div).find('#menuVegeType').attr('name', 'menuVoList['+length+'].menuVegeType');
		    document.getElementById('plus').appendChild(div);
		length++;
		})
	
	});
	
	document.addEventListener('keydown', function(event) {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		}, true);
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
					font-size: 1.3rem; font-color: white; border-radius: 50px; 
					padding: 2px 0px 0px 0px;">확 인</button>
					
				<input type="text" class="input" id="restName" name="restName"
					style="padding: 17px 0px 17px 30px; width: 400px;" 
					placeholder="식당명을 입력해주세요." required>
				<div class="line-box">
					<div class="line"></div>
				</div>
				<div id="result" style="font-size:1.1rem"></div>
				<div id="restNameList" style="width:100%; height:30px; font-size:1.3rem; font-weight: bold; display: none"></div>
			
			</div>
			<div class="labelf">
				<p class="label-txt" style="font-size: 1.6rem; font-weight: bold;">식당사진(1장)</p>
				<input type="file" class="input" name="restPic"
					multiple="multiple">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</div>

			<div class="labelf">
				<p class="label-txt" style="font-size: 1.6rem; font-weight: bold;">주소</p>
				<input type="text" onclick="RestAddr()" class="input" id="restAddress" name="restAddress"
					placeholder="식당 주소를 입력해주세요." required>
				<div class="line-box">
					<div class="line"></div>
				</div>
				<input type="text" class="input" id="etcRestAddress" name="restAddressDetail"
					placeholder="상세 주소를 입력해주세요.">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</div>

			<div class="labelf">
				<p class="label-txt" style="font-size: 1.6rem; font-weight: bold;">전화번호</p>
				<input type="text" class="input" id="" name="restTel"
					placeholder="식당 전화번호를 입력해주세요.">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</div>

			<div class="labelf">
				<p class="label-txt" style="font-size: 1.6rem; font-weight: bold;">영업시간</p>
				<input type="text" class="input" id="" name="restTime"
					placeholder="식당 영업시간을 입력해주세요.">
				<div class="line-box">
					<div class="line"></div>
				</div>
			</div>

			<div class="labelf" id="menuForm">
				<p class="label-txt" style="font-size: 1.6rem; font-weight: bold;">메뉴</p>
				<div id="childForm">
				<input type="text" class="input" id="menuName" name="menuVoList[0].menuName" placeholder="메뉴명" style="width: 200px; padding: 17px 0px 17px 0px;" required>
				<input type="text" class="input" id="menuPrice" name="menuVoList[0].menuPrice" placeholder="가격" style="width: 120px; padding: 17px 0px 17px 0px;" required>
				<select id="menuVegeType" name="menuVoList[0].menuVegeType" style="width: 100px; heigh: 50px; font-size:1.3rem;">	
						<option value="none" selected disabled>채식타입</option>
						<option value="began">비건</option>
						<option value="racto">락토</option>
						<option value="ovo">오보</option>
						<option value="ractoOvo">락토오보</option>
				</select>
				
				<div class="line-box">
					<div class="line"></div>
				</div>
				</div>	
				<!-- 요기에 추가된다!!!!!!  -->
				<div id="plus"></div>
				
				<div>
					<button class="PlusButton" id="PlusButton">+ 메뉴 추가</button>
				</div>
			</div>
			
			<div>
			<button style="font-size: 1.5rem;" type="button" id="cancel" onclick="location.href='restaurant.do'">취 소</button>
			<button style="font-size: 1.5rem;" type="submit" id="push">등 록</button>
			</div>
		</form>
	</div>

	<br>
	<br>
	<br>
</body>
</html>