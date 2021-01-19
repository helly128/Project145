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
<h2>사업자 확인</h2>

<div class="search-wrapper">

<form action="bizRegister.do">


 <div class="labelf">
    <p class="label-txt">사업장 이름</p>
    <input type="text" class="input">

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
    <input type="text" class="input">

    <div class="line-box">
      <div class="line"></div>    <button style="float:right; top:-50px}">검색</button>
    </div>
</div>




  <br>

  <button type="submit" id="submit">다음</button>
  <button type="button" id="cancel"  onclick="location.href='memberRegister.do'" >취소</button>
</form>

</div>




<br>



<br>
<br>
</div>
</body>
</html>