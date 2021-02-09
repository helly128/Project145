<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>

<title>Insert title here</title>

<style>
.login {
	margin-left: 30%;
	margin-right: 30%;
	margin-bottom: 8%;
	margin-top: 5%;
}
</style>

</head>
<body>
	<div class="login">
		<div align="center" style="padding-top: 5%">
			<h2>로그인</h2>
			<br /> <br />
			<form id="frm" name="frm" action="/loginResult.do">
				<%-- <input type="hidden" name = "uri" value="${param.uri }"/> --%>
				<!-- Email input -->
				<div class="form-outline mb-4">
					<input type="text" id="mId" name="mId" class="form-control"
						required="required" placeholder="ID" />
				</div>

				<!-- Password input -->
				<div class="form-outline mb-4">
					<input type="password" id="password" name="password"
						class="form-control" required="required" placeholder="password" />
					<p id="p"></p>
				</div>

				<!-- 2 column grid layout for inline styling -->
				<div class="row mb-4">
					<div class="col justify-content-center">
						<a href="/searchIDPW.do">Forgot password?</a>
					</div>
					<div class="col justify-content-center">
						<!-- Submit button -->
						<button type="button"   id="check" class="middle-btn">Sign in</button>
					</div>
				</div>
			</form>
		<!-- 	<a class="btn btn-warning btn-user btn-block" id="check"
				style="color: white;">로그인 실패 테스트 </a> -->


			<!-- Register buttons -->
			<div class="row mb-4 text-center">
				<p>
					Not a member? <a href="#!">Register</a>
				</p>
				<p>or sign up with:</p>
				<br />
				<!-- 네이버아이디로로그인 버튼 노출 영역 -->
				<div id="naverIdLogin">

					<a href="${url}"> <img height="50"
						src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
				</div>
				<%
				String clientId = "1P0F_fye7hGWfHa0ztCe";//애플리케이션 클라이언트 아이디값";
				String redirectURI = URLEncoder.encode("http://localhost:8088/callback", "UTF-8");
				SecureRandom random = new SecureRandom();
				String state = new BigInteger(130, random).toString();
				String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
				apiURL += "&client_id=" + clientId;
				apiURL += "&redirect_uri=" + redirectURI;
				apiURL += "&state=" + state;
				session.setAttribute("state", state);
				%>
				<br>
			</div>

		</div>
	</div>
	<script>
		$(function() {

			$("#check").on('click', function() {
				var password = $("#password").val()
				var mId =  $("#mId").val()

				$.ajax({
					type : "post",
					url : "/LoginCheck.do",
					data : {
						password : password,
						mId : mId
					},
					dataType : "json",
					success : function(result) {
						//console.log(result)
						//console.log(typeof (result))
						if (result == true) {
							$("#frm").submit();
						} else {
							$("#p").css("color", "red");
							$("#p").text("아이디와 비밀번호를 확인해주세요.");
						}

					},
					error : function() {
						console.log("error받아오기 실패")
					}

				}) // ajax end
			})

		}) // ready end
	</script>
</body>
</html>