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




<title>사업자 회원가입</title>
</head>
<body>

<div align ="center">
<h2>사용자 회원가입</h2>

<div class="search-wrapper">

<form action="InsertMember.do">

  <div class="labelf">
    <p class="label-txt">아이디</p>
    <input type="text" class="input">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </div>
  
   <div class="labelf">
    <p class="label-txt">비밀번호</p>
    <input type="text" class="input">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </div>
 
  <div class="labelf">
    <p class="label-txt">비밀번호 재입력</p>
    <input type="text" class="input">
    <div class="line-box">
      <div class="line"></div>
    </div>
</div>
 <div class="labelf">
    <p class="label-txt">이름</p>
    <input type="text" class="input">
    <div class="line-box">
      <div class="line"></div>
    </div>
</div> 
 <div class="labelf">
    <p class="label-txt">이메일</p>
    <input type="text" class="input">
    <div class="line-box">
      <div class="line"></div>
    </div>
</div>

 <div class="labelf">
    <p class="label-txt">사업자 등록번호</p>
    <input type="text" class="input" value="앞에서 파라매터값 받아옴">
    <div class="line-box">
      <div class="line"></div>
    </div>
</div>


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
      <th>RED</th>
      <th>YELLOW ORANGE</th>
      <th>GREEN</th>
    </tr>
 <tr>

      <td> 
      <input type="checkbox" id="vegi">
        <div class="tbl-data" data-item="🥦"></div>
       
      </td>
      <td> 
       <input type="checkbox" id="vegi">
        <div class="tbl-data" data-item="🧀"></div>
      </td>
      <td> 
       <input type="checkbox" id="vegi">
        <div class="tbl-data" data-item="🥚"></div>
      </td>
 </tr>

  </table>
</div>
</div>

 
    
    <div class="line-box">
      <div class="line"></div>
    </div>
   <br>
    <br>
  <button type="submit" id="submit">가입</button>
  <button type="button" id="cancel"  onclick="location.href='memberRegister.do'" >취소</button>
</form>

</div>




<br>

<h5>사업자 등록번호가 업는 사용자는 <a href="userRegister.do">일반회원가입</a>을 선택해 주세요.</h5>



<br>
<br>
</div>
</body>
</html>