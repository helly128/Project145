<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageEdit.jsp</title>
</head>
<body>
	<div align="center">
		<div class="col-lg-7">
			<div class="p-5">
				<div class="text-center">
					<h1 class="h3 mb-2 text-gray-800">내 정보 수정</h1>
				</div>
				<form class="user">
					<div class="form-group row"></div>
					<div class="form-group">
						<input type="email" class="form-control form-control-user"
							id="exampleInputEmail" placeholder="이름당겨오기">
					</div>
					<div class="form-group">
						<input type="email" class="form-control form-control-user"
							id="exampleInputEmail" placeholder="이메일당겨오기">
					</div>
					<div class="form-group row">
						<div class="col-sm-6 mb-3 mb-sm-0">
							<input type="password" class="form-control form-control-user"
								id="exampleInputPassword" placeholder="패스워드두개일치만들기">
						</div>
						<div class="col-sm-6">
							<input type="password" class="form-control form-control-user"
								id="exampleRepeatPassword" placeholder="Repeat Password">
						</div>
					</div>
					<a href="login.html" class="btn btn-primary btn-user btn-block">
						수정완료 </a>
				</form>
				<hr>
				<div class="text-center">
					<a class="small" href="forgot-password.html">채식 Type을 선택해주세요!</a>&nbsp; <select
						class="form-select form-select-sm"
						aria-label=".form-select-sm example">
						<option selected>Vegan</option>
						<option value="1">Lacto</option>
						<option value="2">Ovo</option>
						<option value="3">Lacto Ovo</option>
					</select>
				</div>
				<hr>
			</div>
		</div>
	</div>
</body>
</html>