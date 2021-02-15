<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
html, div, body, h3 {
	margin: 0;
	padding: 0;
}

h3 {
	display: inline-block;
	padding: 0.6em;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div style="background-color: #6bb33b; width: 100%; height: 100px; text-align: center; color: white;">
		<h3>Naver Login Success</h3>
		<h4>${mName}님 환영합니다. </h4>
		
		<div align="center">
		<div class="profile-card" align="center">
			<div class="profile-cover">
				<div class="menu-container">
				</div>
				<div class="profile-avatar">
					<a href="#"><img src="/images/${member.getProfileImage() }"
						width="150" height="150" onerror="this.src='/images/default.png'"
						alt="내사진" /></a>
				</div>
			</div>
			
			<h2>${mid }</h2>
			<h2>${email}</h2>
			<h5>${member.getVegtype() }</h5>
			<br> <a href="/myPageEdit.do?mId=${sessionScope.mId}"
				class="btn btn-success btn-icon-split" style="background-color: #6c9852;"> <span
				class="icon text-white-50"> <i class="fas fa-arrow-right"></i>
			</span> <span class="text">myPage 내 정보 수정</span>
			</a>
		</div><br>
	</div>
	</div>
	<br>
	<h2 style="text-align: center" id="name"></h2>
	<h4 style="text-align: center" id="email"></h4>
</body>
</html>