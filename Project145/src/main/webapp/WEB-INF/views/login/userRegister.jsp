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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<title>일반 회원가입</title>
</head>
<body>

<div align ="center">
<h2>일반 회원가입</h2>

<div class="search-wrapper">

<form action="memberInsert.do" method="post" >

  <div class="labelf">
    <p class="label-txt">아이디</p>
    <input type="text" class="input" id="mId" name="mId">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </div>
  
   <div class="labelf">
    <p class="label-txt">비밀번호</p>
    <input type="text" class="input" id="password" name="password">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </div>
 
  <div class="labelf">
    <p class="label-txt">비밀번호 재입력</p>
    <input type="text" class="input" id="password2">
    <div class="line-box">
      <div class="line"></div>
    </div>
</div>
 <div class="labelf">
    <p class="label-txt">이름</p>
    <input type="text" class="input" id="mName" name="mName">
    <div class="line-box">
      <div class="line"></div>
    </div>
</div> 
 <div class="labelf">
    <p class="label-txt">이메일</p>
    <input type="text" class="input" id="email" name="email">
    <div class="line-box">
      <div class="line"></div>
    </div>
</div>

  
   <input type="hidden" class="input"  name="auth" value="user">

  <div class="labelf" align="center">
    <p class="label-txt">베지테리언 타입</p>
    
    <br>
  <div class="demo">

  <table class="tbl" >
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

      <td> 
      <input type="checkbox" class="type" value="비건" checked disabled>
        <div class="tbl-data" data-item="🥦"></div>
       
      </td>
      <td> 
       <input type="checkbox" class="vtype" value="락토" checked="checked">
        <div class="tbl-data" data-item="🧀"></div>
      </td>
      <td> 
       <input type="checkbox" class="vtype" value="오보" checked="checked">
        <div class="tbl-data" data-item="🥚"></div>
      </td>
      
 </tr>
	
  </table>
  
  
 
</div>
 <input type="text" id="vegi" name="vegtype" value="비건" style="text-align: center; height:3rem; padding:10px;">
</div>


    <div class="line-box">
      <div class="line"></div>
    </div>
   <br>
    <br>
    
  <button type="submit" id="submit">가입</button>
  <button type="button" id="cancel"  onclick="location.href='memberRegister.do'">취소</button>
</form>

</div>

<br>

<br>
<br>
</div>
<script type="text/javascript">

	$(document).ready(function(){
		if($(".bizNum")!=null){
			$(".auth").val("biz");
			
		}console.log(auth);
	});

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