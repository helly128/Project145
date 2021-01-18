<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
}
</style>
</head>
<body>
	<h1>로그인 페이지</h1>
	<div class="login">
		<form>
			<!-- Email input -->
			<div class="form-outline mb-4">
				<input type="email" id="form2Example1" class="form-control" /> <label
					class="form-label" for="form2Example1">Email address</label>
			</div>

			<!-- Password input -->
			<div class="form-outline mb-4">
				<input type="password" id="form2Example2" class="form-control" /> <label
					class="form-label" for="form2Example2">Password</label>
			</div>

			<!-- 2 column grid layout for inline styling -->
			<div class="row mb-4">
				<div class="col d-flex justify-content-center">
					<!-- Checkbox -->
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="form2Example3" checked /> <label
							class="form-check-label" for="form2Example3"> Remember me
						</label>
					</div>
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
				<button type="button" class="btn btn-primary btn-floating mx-2">
					<i class="fab fa-facebook-f"></i>
				</button>

				<button type="button" class="btn btn-primary btn-floating mx-2">
					<i class="fab fa-google"></i>
				</button>

				<button type="button" class="btn btn-primary btn-floating mx-2">
					<i class="fab fa-twitter"></i>
				</button>

				<button type="button" class="btn btn-primary btn-floating mx-2">
					<i class="fab fa-github"></i>
				</button>
			</div>
		</form>
	</div>
</body>
</html>