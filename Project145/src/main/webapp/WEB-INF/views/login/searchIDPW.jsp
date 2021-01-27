<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/login.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<script>



$(function(){	
	
	
	$('#idsearch').click(()=>{	
		var noncon_ins_id = [];//여러값을 아작스로 넘기려면 요렇게 만들어줘야
		noncon_ins_id.push(7);
		noncon_ins_id.push(8);
		
		var mEmail = $("#emailforid").val();
		var mName =  $("#nameforid").val();
		console.log("mEmail =" +mEmail +" "+"mName="+ mName);
		
		var allData ={ noncon_ins_id : JSON.stringify(noncon_ins_id),"mName":mName, "email":mEmail};
		console.log(allData);
		
		if(mEmail!="" && mName!="" ){
		//======아작스 ========	
		$.ajax({
			
			type:"post",
			url:"idSearch.do",
			data: allData ,
			dataType:"json",
			success:function(vo){
				console.log(vo);
				console.log(vo.mid);
				if(vo.mid != null){
					
					$("#idResult").text("회원님의 ID는 "+vo.mid+" 입니다.");
					
					
				}else {
					$("#idResult").text("없는 사용자 정보입니다.");
					$("#toLogin").hide;
				
				}
			//모달창 =============================
			
			$('#idsearch').click(function() {
				$('#background_modal').show();
			});
			// 2. 모달창 닫기 버튼
			$('.close').on('click', function() {
				$('#background_modal').hide();
			});
			// 3. 모달창 위도우 클릭 시 닫기
			$(window).on('click', function() {
				if (event.target == $('#background_modal').get(0)) {
		            $('#background_modal').hide();
		         }
			});	
			//모달창 =============================
			},//아작스 서섹
			error:(log)=>{
			$("#idResult").text("등록되지 않은 정보입니다.");
			
			}
			
		});	
		//======아작스 ========
		}else {
			
			$("#idResult").text("공란이 있습니다. 입력을 완료하세요.");
		}
});
});
	

	
</script>
<style type="text/css">

#idsearch:hover{ color:white};
</style>

</head>
<body>




	<div class="form">

		<ul class="tab-group">
			<li class="tab active"><a href="#signup">아이디 찾기</a></li>
			<li class="tab"><a href="#login">비밀번호 찾기</a></li>
		</ul>

		<div class="tab-content">
			<div id="signup">
				<h4>정보를 입력해주세요.</h4>

				<form action="/" method="post">


					<div class="field-wrap">
						<label> Email<span class="req">*</span>
						</label> <input type="email" id="emailforid" required autocomplete="off" />
					</div>
<br>
					<div class="field-wrap">
						<label> 이름 <span class="req">*</span>
						</label> <input type="text" id="nameforid" required autocomplete="off" />
					</div>
<br>
					<div align="center">
					<a href="#" id="idsearch" class="button button-block" data-toggle="modal"
					data-target="#smallModal">내 아이디 검색</a>
					</div>
						
					


			</form>

		</div>

		<div id="login">
			<h4>등록된 이메일로만 발송됩니다.</h4>

			<form action="/" method="post">

				<div class="field-wrap">
					<label> Email<span class="req">*</span>
					</label> <input type="email" id="emailforpw" required autocomplete="off" />
				</div>
<br>
				<div class="field-wrap">
					<label> ID<span class="req">*</span>
					</label> <input type="text" id="idforpw" required autocomplete="off" />
				</div>


<br>
				<button id="pwsearch" type="submit" class="button button-block">비밀번호 찾기</button>

			</form>

		</div>

	</div>
	<!-- tab-content -->

	</div>
	<!-- /form -->

	<div class="modal fade" id="smallModal" tabindex="-1" role="dialog" style="padding-top:200px;"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">아이디 검색 결과</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div id ="searchResult" class="modal-body" align="center">
					
					<h5><a id="idResult"></a></h5>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" id="toLogin" style="display:none" class="btn btn-primary" style="background:#1ab188; border:none;">로그인 화면</button>
				</div>
			</div>
		</div>
	</div>




	<script>
$('.form').find('input, textarea').on('keyup blur focus', function (e) {
	  
	  var $this = $(this),
	      label = $this.prev('label');

		  if (e.type === 'keyup') {
				if ($this.val() === '') {
	          label.removeClass('active highlight');
	        } else {
	          label.addClass('active highlight');
	        }
	    } else if (e.type === 'blur') {
	    	if( $this.val() === '' ) {
	    		label.removeClass('active highlight'); 
				} else {
			    label.removeClass('highlight');   
				}   
	    } else if (e.type === 'focus') {
	      
	      if( $this.val() === '' ) {
	    		label.removeClass('highlight'); 
				} 
	      else if( $this.val() !== '' ) {
			    label.addClass('highlight');
				}
	    }

	});

	$('.tab a').on('click', function (e) {
	  
	  e.preventDefault();
	  
	  $(this).parent().addClass('active');
	  $(this).parent().siblings().removeClass('active');
	  
	  target = $(this).attr('href');

	  $('.tab-content > div').not(target).hide();
	  
	  $(target).fadeIn(600);
	  
	});
</script>

</body>
</html>