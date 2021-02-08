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
<!--====== Bootstrap CSS ======-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/bootstrap-5.0.5-alpha.min.css">
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
			<br/><br/>
			<form action="/loginResult.do">
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
				</div>

				<!-- 2 column grid layout for inline styling -->
				<div class="row mb-4">
					<div class="col justify-content-center">
						<a href="/searchIDPW.do">Forgot password?</a>
					</div>
					<div class="col justify-content-center">
						<!-- Submit button -->
						<button type="submit" class="middle-btn">Sign in</button>
					</div>
				</div>



				<!-- Register buttons -->
				<div class="row mb-4 text-center">
					<p>
						Not a member? <a href="#!">Register</a>
					</p>
					<p>or sign up with:</p>
					<br />
					<!-- 네이버아이디로로그인 버튼 노출 영역 -->
					<div id="naverIdLogin"></div>

					<a href="${url}"> <img height="50"
						src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
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
			</form>
		</div>
	</div>
</body>
</html>