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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

$(function(){

//ajax1 . 아이디 중복 체크
$("#idDuplCheck").click(()=>{
	$.ajax(
		{
			type:"POST",
			url:"idDuplCheck.do",
			data:{data: $("#Id").val()}, //사용하는 함수 
			dataType:"json",
			success: function(result){
				if(result==0){
					console.log(result);
					$("#result").css("color","green");
					$("#result").text("사용할 수 있는 아이디 입니다.");
					$("#idDuplCheck").text("중복검색");
					$("#idDuplCheck").css("background-color",'');
					$("#idDuplCheck").css("border","none");
					$("#idDuplCheck").css("color","green");
					$("#idDuplCheck").css("font-size","1rem");
					$("#mId").val($("#Id").val());		
				} else{ 
				$("#result").css("color","red");
				$("#result").text("이미 사용중인 아이디 입니다.");
				
			}},
			error:(log)=>{alert("실패+log")
			}
				
		});


});

// 비밀번호 체크
$("input").keyup(function(){
	var pw1=$("#password").val();
	var pw2=$("#password2").val();
	if(pw1 !="" && pw2 !=""){
		if(pw1 != pw2){
			$('#pwresult').show();
		}else 
			$("#pwresult").hide();
			
			
	}
});


$("#submitbtn").click(()=>{
	if ($("#email").val()==""||$("#mName").val()==""||$("#vegitype").val()==""){
		alert("정보가 입력되지 않았습니다. 다시 확인하세요.")
	}
	else if ($("#mId").val()==""){		
		alert("아이디 중복체크를 하세요");}
	else if($("#password").val()!=$("#password2").val()||$("#password").val()==""){
		alert("비밀번호를 다시 확인하세요");
	}else if($("#mId").val() == $("#Id").val()){
		document.memberfrm.submit();
	}else{
		alert('다시 중복 체크하세요.');
	}
		
		
	});



});

</script>


<title>일반 회원가입</title>
</head>
<body>

	<div align="center">
		<h2>일반 회원가입</h2>

		<div class="search-wrapper">

			<form action="memberInsert.do" method="post" id="memberfrm" name="memberfrm">

				<div class="labelf">
					<p class="label-txt">아이디</p>
					<div id="result" style="float: right;">개인정보를 입력해주세요.</div>

					<input type="text" class="input" id="Id"> <input
						type="hidden" class="input" id="mId" name="mId" required readonly>

					<div class="line-box">
						<button type="button" id="idDuplCheck"
							style="float: right; background-color: lightGreen; height: 30px; top: -50px; width: 100px; font-size: 1rem; border-radius: 0; padding: 0;">중복확인</button>
						<div class="line"></div>
					</div>
				</div>

				<div class="labelf">
					<p class="label-txt">비밀번호</p>
					<input type="password" class="input" id="password" name="password"
						required>
					<div class="line-box">
						<div class="line"></div>
					</div>
				</div>

				<div class="labelf">
					<p class="label-txt">비밀번호 재입력</p>
					<div id="pwresult" style="float: right; display: none; color: red">비밀번호가
						일치하지 않습니다.</div>
					<input type="password" class="input" id="password2">
					<div class="line-box">
						<div class="line"></div>
					</div>
				</div>
				<div class="labelf">
					<p class="label-txt">이름</p>
					<input type="text" class="input" id="mName" name="mName" required>
					<div class="line-box">
						<div class="line"></div>
					</div>
				</div>
				<div class="labelf">
					<p class="label-txt">이메일</p>
					<input type="text" class="input" id="email" name="email" required>
					<div class="line-box">
						<div class="line"></div>
					</div>
				</div>


				<input type="hidden" class="input" name="auth" value="user">

				<div class="labelf" align="center">
					<p class="label-txt">베지테리언 타입</p>

					<br>
					<div class="demo">

						<table class="tbl">
							<tr>
								<th>채소</th>
								<th>유제품</th>
								<th>달걀</th>
							</tr>

							<tr>
								<th></th>
								<th></th>
								<th></th>
							</tr>
							<tr>

								<td><input type="checkbox" class="type" value="비건" checked
									readonly>
									<div class="tbl-data" data-item="🥦"></div></td>
								<td><input type="checkbox" class="vtype" value="락토"
									checked="checked">
									<div class="tbl-data" data-item="🧀"></div></td>
								<td><input type="checkbox" class="vtype" value="오보"
									checked="checked">
									<div class="tbl-data" data-item="🥚"></div></td>

							</tr>

						</table>



					</div>
					<input type="text" id="vegi" readonly required name="vegtype"
						value="비건"
						style="text-align: center; height: 3rem; padding: 10px;">
				</div>


				<div class="line-box">
					<div class="line"></div>
				</div>
				<br> <br>

				<button type="button" id="submitbtn">가입</button>
				<button type="button" id="cancel"
					onclick="location.href='memberRegister.do'">취소</button>
			</form>

		</div>

		<br> <br> <br>
	</div>
	<script type="text/javascript">


		// .check 클래스 중 어떤 원소가 체크되었을 때 발생하는 이벤트

		$(".vtype").click(function(){ 
			var str ="";  
			$(".vtype").each(function(){ 
				if($(this).is(":checked")){ 
					str += $(this).val() + ""}
				else {str =="비건"}
				
			});
			$("#vegi").val(str);  
		});
//	})

$(".vtype").click();
</script>
</body>



</html>