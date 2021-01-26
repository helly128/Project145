<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>authAccount.jsp</title>
</head>
<body>
	이용기관API 
	토큰(access_token) : ${access_token }<br>	<br><br>
	Access Token 만료 기간(expires_in) : ${expires_in }<br><br><br>
	Access Token 권한 범위(scope) : ${scope }<br><br><br> 
	이용기관코드(client_use_code) : ${client_use_code }
	인증되었습니다.
</body>
</html>