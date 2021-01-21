<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--====== Bootstrap CSS ======-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/assets/css/bootstrap-5.0.5-alpha.min.css">
<style>

.login {
	margin-left: 40%;
	margin-right: 40%;
	margin-bottom: 8%;
	margin-top: 5%;
}
</style>
  <%
    String clientId = "1P0F_fye7hGWfHa0ztCe";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8088/callback.do", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
</head>
<body>
	<div class="login">
	<h1>로그인 페이지</h1>
		<form action="/loginResult.do">
			<!-- Email input -->
			<div class="form-outline mb-4">
				<input type="text" id="mId" name="mId" class="form-control" required="required"/> <label
					class="form-label" for="form2Example1" >ID</label>
			</div>

			<!-- Password input -->
			<div class="form-outline mb-4">
				<input type="password" id="password" name="password" class="form-control" required="required"/> <label
					class="form-label" for="form2Example2">Password</label>
			</div>

			<!-- 2 column grid layout for inline styling -->
			<div class="row mb-4">
				<div class="col d-flex justify-content-center">
					<!-- Checkbox -->
					<!-- <div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="form2Example3" checked /> <label
							class="form-check-label" for="form2Example3"> Remember me
						</label>
					</div> -->
				</div>

				<div class="col">
					<!-- Simple link -->
					<a href="#!">Forgot password?</a>
				</div>
			</div>

			<!-- Submit button -->
			<button type="submit" class="middle-btn">Sign
				in</button>

			<!-- Register buttons -->
			<div class="text-center">
				<p>
					Not a member? <a href="#!">Register</a>
				</p>
				<p>or sign up with:</p>
				<br />
				<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
 
			</div>
		</form>
	</div>
</body>
</html>