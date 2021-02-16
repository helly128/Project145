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
<link href="/resources/my/css/mycss.css" rel="stylesheet"
	type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div align="center">
		<br />
		<div class="profile-card" align="center">
			<div class="profile-cover">
				<div align="center">
					<h3>Naver Login Success</h3>
					<h4>${mName} 님 환영합니다.</h4>
					<ul class="profile-actions" style="display: none;">
					</ul>
				</div>
				<br /> <br /> <br /> <br />
				<div class="profile-avatar">
					<img src="/images/${member.getProfileImage() }" width="150"
						height="150" onerror="this.src='/images/default.png'" alt="내사진" />
				</div>

			</div>
			<br />
			<br />
			<br />
			<br />
			<br /> <br> <a href="/myPageEdit.do?mId=${sessionScope.mId}"
				class="btn btn-success btn-icon-split"
				style="background-color: #6c9852;">myPage 내 정보 수정</span>
			</a>
		</div>
		<div align="center">
		<br>
		<%--  <h2>${sessionScope.mId}</h2> --%>
		 <h2>${sessionScope.password}</h2>
		<c:if test="${sessionScope.password eq '0000'} ">
		<p style="color: red;">기본 비밀번호는 0000입니다. 내 정보 수정 페이지에서 변경해주세요.</p>
		</c:if>
		</div>
	</div>

	<br>

</body>
</html>