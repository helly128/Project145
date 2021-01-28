<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
*, *:before, *:after {
	box-sizing: border-box;
}

body {
	padding: 1em;
	font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
	font-size: 15px;
	color: #b9b9b9;
	background-color: #e3e3e3;
}

h5 {
	font-size:1.3em;
	color: #4e73df;
	font-weight: 600;
}

h3 {
	font-weight: 800;
}

input, input[type="radio"]+label, input[type="checkbox"]+label:before,
	select option, select {
	width: 100%;
	padding: 1em;
	line-height: 1.4;
	background-color: #f9f9f9;
	border: 1px solid #e5e5e5;
	border-radius: 3px;
	-webkit-transition: 0.35s ease-in-out;
	-moz-transition: 0.35s ease-in-out;
	-o-transition: 0.35s ease-in-out;
	transition: 0.35s ease-in-out;
	transition: all 0.35s ease-in-out;
	font-size: 1rem;
}

input:focus {
	outline: 0;
	border-color: #4e73df;
}

input:focus+.input-icon i {
	color: #4e73df;
}

input:focus+.input-icon:after {
	border-right-color: #4e73df;
}

input[type="radio"] {
	display: none;
}

input[type="radio"]+label, select {
	display: inline-block;
	width: 50%;
	text-align: center;
	float: left;
	border-radius: 0;
}

input[type="radio"]+label:first-of-type {
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
}

input[type="radio"]+label:last-of-type {
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
}

input[type="radio"]+label i {
	padding-right: 0.4em;
}

input[type="radio"]:checked+label, input:checked+label:before, select:focus,
	select:active {
	background-color: #4e73df;
	color: #fff;
	border-color: #4e73df;
}

input[type="checkbox"] {
	display: none;
}

input[type="checkbox"]+label {
	position: relative;
	display: block;
	padding-left: 1.6em;
	font-size: 1.3rem;
}

input[type="checkbox"]+label:before {
	position: absolute;
	top: 0.2em;
	left: 0;
	display: block;
	width: 1em;
	height: 1em;
	padding: 0;
	content: "";
}

input[type="checkbox"]+label:after {
	position: absolute;
	top: 0.45em;
	left: 0.2em;
	font-size: 0.8em;
	color: #fff;
	opacity: 0;
	font-family: FontAwesome;
	content: "\f00c";
}

input:checked+label:after {
	opacity: 1;
}

HTML CSSResult Skip Results Iframe
input[type="number"] {
	-webkit-appearance: textfield;
	-moz-appearance: textfield;
	appearance: textfield;
}

input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
}

.number-input {
	border: 2px solid #ddd;
	display: inline-flex;
}

.number-input, .number-input * {
	box-sizing: border-box;
}

.number-input button {
	outline: none;
	-webkit-appearance: none;
	background-color: transparent;
	border: none;
	align-items: center;
	justify-content: center;
	width: 3rem;
	height: 3rem;
	cursor: pointer;
	margin: 0;
	position: relative;
}

.number-input button:before, .number-input button:after {
	display: inline-block;
	position: absolute;
	content: '';
	width: 1rem;
	height: 2px;
	background-color: #212121;
	transform: translate(-50%, -50%);
}

.number-input button.plus:after {
	transform: translate(-50%, -50%) rotate(90deg);
}

.number-input input[type=number] {
	font-family: sans-serif;
	max-width: 5rem;
	padding: .5rem;
	border: solid #ddd;
	border-width: 0 2px;
	font-size: 1rem;
	height: 3rem;
	font-weight: bold;
	text-align: center;
}

select {
	height: 3.4em;
	line-height: 2;
}

select:first-of-type {
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
}

select:last-of-type {
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
}

select:focus, select:active {
	outline: 0;
}

select option {
	background-color: #7ed321;
	color: #fff;
}

.input-group {
	margin-bottom: 1em;
	zoom: 1;
}

.input-group:before, .input-group:after {
	content: "";
	display: table;
}

.input-group:after {
	clear: both;
}

.input-group-icon {
	position: relative;
}

.input-group-icon input {
	padding-left: 4.4em;
}

.input-group-icon .input-icon {
	position: absolute;
	top: 0;
	left: 0;
	width: 3.4em;
	height: 3.4em;
	line-height: 3.4em;
	text-align: center;
	pointer-events: none;
}

.input-group-icon .input-icon:after {
	position: absolute;
	top: 0.6em;
	bottom: 0.6em;
	left: 3.4em;
	display: block;
	border-right: 1px solid #e5e5e5;
	content: "";
	-webkit-transition: 0.35s ease-in-out;
	-moz-transition: 0.35s ease-in-out;
	-o-transition: 0.35s ease-in-out;
	transition: 0.35s ease-in-out;
	transition: all 0.35s ease-in-out;
}

.input-group-icon .input-icon i {
	-webkit-transition: 0.35s ease-in-out;
	-moz-transition: 0.35s ease-in-out;
	-o-transition: 0.35s ease-in-out;
	transition: 0.35s ease-in-out;
	transition: all 0.35s ease-in-out;
}

.container {
	max-width: 38em;
	padding: 1em 3em 2em 3em;
	margin: 0em auto;
	background-color: #fff;
	border-radius: 4.2px;
	box-shadow: 0px 3px 10px -2px rgba(0, 0, 0, 0.2);
}

.row {
	zoom: 1;
	padding:10px;
}

.row:before, .row:after {
	content: "";
	display: table;
}

.row:after {
	clear: both;
}

.col-half {
	padding-right: 10px;
	float: left;
	width: 50%;
}

.col-half:last-of-type {
	padding-right: 0;
}

.col-third {
	padding-right: 10px;
	float: left;
	width: 33.33333333%;
}

.col-third:last-of-type {
	padding-right: 0;
}

@media only screen and (max-width: 540px) {
	.col-half {
		width: 100%;
		padding-right: 0;
	}
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<title>클래스 등록 폼</title>
</head>
<body>


	<div class="container" align="center">
	<form>	
			<br>
			<div class="pagetitle" align="center">
				<h3>새로운 클래스 등록</h3>
			</div>
			<br>
			<div class="row" id="uploadpic">
				<h5>대표사진</h5>

				<div class="div-image" style="float: right;">
					<input type="file" name="uploadfile" class="classPic"
						accept="image/*" onchange="setImage(event);"
						style="background-color: white; border: none; margin-left: 10px; padding: 0; border-radius: 2px;">
				</div>

				<!-- Card Body -->
				<div class="image-container p-3" style="width: 100%" align="center">
					<img id="class-image" src="/images/images-empty.png" height="300px"
						width="auto">

				</div>
			</div>
			<br>
			<div class="row">
				<h5>클래스명</h5>
				<div class="input-group input-group-icon">
					<input type="text" placeholder="클래스 이름" required autocomplete="off">
					<div class="input-icon">
						<i class="fa fa-pencil"></i>
					</div>
				</div>
			</div>

			<br>

			

				<p>
				<h5>베지테리언타입</h5>
				<br>
				

				<div class="row">
				<div class="col-half">
					<input type="checkbox" class="input-text mb-4" id="vegan"
						name="vegType" value="비건" required><label for="vegan">
						🥦&nbsp비건</label>&nbsp&nbsp <input type="checkbox"
						class="input-text mb-4" id="locto" name="vegType" value="락토"
						required><label for="locto"> 🧀&nbsp락토</label>
						
						
						</div>
						<div class="col-half">
						 
					<input type="checkbox" class="input-text mb-4" id="ovo"
						name="vegType" value="오보" required><label for="ovo">
						🥚&nbsp오보</label> &nbsp&nbsp <input type="checkbox"
						class="input-text mb-4" id="all" name="vegType" value="오보"
						required><label for="all"> 🥗&nbsp모두</label>
					</div>
				


			</div>

			<div class="row"></div>



			<div class="row">
				<div class="col-half">
					<h5>시작일</h5>
					<div class="input-group">
						<input type="date" name="">
					</div>
				</div>
				<div class="col-half">
					<h5>종료일</h5>
					<div class="input-group">
						<input type="date" name="">
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-half">
					<h5>모집정원(명)</h5>
					<div class="input-group">

						<div class="number-input"  style="margin:10px">
							<button
								onclick="this.parentNode.querySelector('input[type=number]').stepDown()"></button>
							<input class="quantity" min="0" name="quantity" value="1"
								type="number">
							<button
								onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
								class="plus"></button>
						</div>
					</div>
				</div>
				<div class="col-half">
					<h5>가격(5000원 단위)</h5>
					<div class="input-group">

						<div class="number-input"  style="margin:10px">
							<button
								onclick="this.parentNode.querySelector('input[type=number]').stepDown(1000)"></button>
							<input class="quantity" min="1000" name="quantity" value="5000"
								type="number">
							<button
								onclick="this.parentNode.querySelector('input[type=number]').stepUp(5000)"
								class="plus"></button>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<h5>강사 정보</h5>
				<div class="input-group">
					<input type="radio" name="payment-method" value="card"
						id="payment-method-card" checked=checked> <label
						for="payment-method-card"><span><i
							class="fa fa-users"></i>기존 강사 목록</span></label> <input type="radio"
						name="payment-method" value="paypal" id="payment-method-paypal" />
					<label for="payment-method-paypal"> <span><i
							class="fa fa-user-plus"></i>강사 추가</span></label>

				</div>

			</div>

			<div class="card shadow mb-4" align="center">
				<br>
				<div class="row">
					<div class="col-half">
						<h5 style="padding-top: 20px;">강사이름 mName</h5>
					</div>
					<div class="col-half">
						<div class="input-group">
							<select style="width: 80%; padding: 2px; margin:15px;">
								<option>강사1 mId</option>
								<option>강사2 mId</option>
								<option>강사2 mId</option>
							</select>

						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-half">
						<div class="profile-cover">
							<div class="profile-avatar">
								<img
									src="https://dl.dropboxusercontent.com/s/7pcnqq18skh1myk/avatar.jpg"
									alt="Anis M" />
							</div>

							<div class="profile-details" style="font-size: 1.5rem">
								<a href="https://www.instagram.com/maxencefvl/?hl=ko"
									target="blank"><i class="fa fa-id-card-o"></i></a> &nbsp<a
									href="https://www.instagram.com/maxencefvl/?hl=ko"
									target="blank"><i class="fa fa-instagram"></i></a> &nbsp<a
									href="https://www.instagram.com/maxencefvl/?hl=ko"
									target="blank"><i class="fa fa-envelope-o"></i></a>
							</div>
						</div>
					</div>
					
					<br>
					<div class="col-half">
						<h5>강사이력</h5>
						<br>
						강사의 이력은 이렇슴 애플<br> 삼성<br> 테슬라<br> 예담<br>
					</div>
					<br>
					
					<button class="btn btn-warning" style="margin:10px;width:90%; padding:10px;">강사에게
						콜라보 신청</button></div>
				</div>
			
	




			<div class="row">
				<h5>확인 내용</h5>
				<div class="input-group">
					<input type="checkbox" id="terms" /> <label for="terms">
						위 내용에 동의합니당</label>
				</div>
			</div>
			<button class="btn btn-primary" type="button" style="margin:10px; padding:10px;">클래스 개설 신청</button>
			<button class="btn btn-primary" type="button" style="margin:10px; padding:10px;">클래스 목록으로</button>
		
		</form>
</div>
	<br>



</body>
</html>