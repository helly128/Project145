<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

form {
  width: 60%;
  margin: 60px auto;
  background: #efefef;
  padding: 60px 120px 80px 120px;
  text-align: center;
  -webkit-box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
  box-shadow: 2px 2px 3px rgba(0,0,0,0.1);
}
label {
  display: block;
  position: relative;
  margin: 40px 0px;
}
.label-txt {
  position: absolute;
  top: -1.6em;
  padding: 10px;
  font-family: sans-serif;
  font-size: .8em;
  letter-spacing: 1px;
  color: rgb(120,120,120);
  transition: ease .3s;
}
.input {
  width: 100%;
  padding: 10px;
  background: transparent;
  border: none;
  outline: none;
}

.line-box {
  position: relative;
  width: 100%;
  height: 2px;
  background: #BCBCBC;
}

.line {
  position: absolute;
  width: 0%;
  height: 2px;
  top: 0px;
  left: 50%;
  transform: translateX(-50%);
  background: #8BC34A;
  transition: ease .6s;
}

.input:focus + .line-box .line {
  width: 100%;
}

.label-active {
  top: -3em;
}

button {
  display: inline-block;
  padding: 12px 24px;
  background: rgb(220,220,220);
  font-weight: bold;
  color: rgb(120,120,120);
  border: none;
  outline: none;
  border-radius: 3px;
  cursor: pointer;
  transition: ease .3s;
}

button:hover {
  background: #8BC34A;
  color: #ffffff;
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align ="center">
<h2>일반 회원가입</h2>

<div class="search-wrapper">

<form action="InsertMember.do">

  <label>
    <p class="label-txt">아이디</p>
    <input type="text" class="input">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">비밀번호</p>
    <input type="text" class="input">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
   <label>
    <p class="label-txt">비밀번호 재입력</p>
    <input type="text" class="input">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
    <label>
    <p class="label-txt">이름</p>
    <input type="text" class="input">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
   <label>
    <p class="label-txt">이메일</p>
    <input type="text" class="input">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
   <label>
   <p>___________________ 여기는 나중에 음식 아이콘으로 바꿀께 !! </p>
    <p class="label-txt">베지테리언 타입</p>
    <br>
    
    <select style="background:none;">
    <option>비건</option>
    <option>락토</option>
    <option>오보</option>
    <option>락토오보</option>
    </select>
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <button type="submit" id="submit">가입</button>
  <button type="button" id="cancel"  onclick="location.href='memberRegister.do'" >취소</button>
</form>

</div>





<br>

<h5>클래스 운영자나 채식당 사업주는 <a href="bizRegister.do">사업자 가입</a>을 선택해 주세요.</h5>



<br>
<br>
</div>
</body>
