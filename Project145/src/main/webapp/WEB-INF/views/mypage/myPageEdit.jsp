<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>myPageEdit.jsp</title>
</head>
<body>
	<div align="center">
		<div class="col-lg-7">
			<div class="p-5">
				<div class="text-center">
					<h1 class="h3 mb-2 text-gray-800">내 정보 수정</h1>
				</div>${member}
				<form class="user" action="myPageEditResult.do" id="form"
					method="post">
					<div class="form-group row"></div>
					<div class="form-group">
						<input readonly="readonly" class="form-control form-control-user"
							placeholder="아이디당겨오기" value="${member.getMId() }">
					</div>
					<div class="form-group">
						<input readonly="readonly" class="form-control form-control-user"
							placeholder="이름당겨오기" value="${member.getMName() }">
					</div>
					<div class="form-group">
						<input readonly="readonly" class="form-control form-control-user"
							placeholder="이메일당겨오기" value="${member.getEmail() }">
					</div>
					<div class="form-group row">
						<div class="col-sm-6 mb-3 mb-sm-0">
							<input type="password" class="form-control form-control-user"
								id="password" name="password" placeholder="패스워드두개일치만들기">
						</div>
						<div class="col-sm-6">
							<input type="password" class="form-control form-control-user"
								id="password2" placeholder="Repeat Password">
						</div>
					</div>
					<hr>
					<div class="text-center">
						<a class="small" href="forgot-password.html">채식 Type을 선택해주세요!</a>&nbsp;
						<select id="vegtype" name="vegtype"
							class="form-select form-select-sm"
							aria-label=".form-select-sm example">
							<option value="비건"
								<c:if test="${member.getVegtype() == '비건' }">selected="selected"</c:if>>Vegan</option>
							<option value="락토"
								<c:if test="${member.getVegtype() == '락토' }">selected="selected"</c:if>>Lacto</option>
							<option value="오보"
								<c:if test="${member.getVegtype() == '오보' }">selected="selected"</c:if>>Ovo</option>
							<option value="락토오보"
								<c:if test="${member.getVegtype() == '락토오보' }">selected="selected"</c:if>>Lacto
								Ovo</option>
						</select>
					</div>
					<hr>
					<button type="button" class="btn btn-primary btn-user btn-block"
						id="button">수정완료</button>
					<hr>
				</form>
				<a class="btn btn-primary btn-user btn-block" href="/mypage.do">취소</a>
				<hr>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$("#button").on("click", function() {

			var password = $("#password").val();
			var password2 = $("#password2").val();

			if (password != "") {
				if (password == password2) {
					alert("수정이 완료되었습니다.")
					$("#form").submit();
					//return true;
				} else {
					alert("패스워드가 일치하지 않습니다.")
				}
			} else {
				//return false;
			}
		})
	</script>
</body>
</html>