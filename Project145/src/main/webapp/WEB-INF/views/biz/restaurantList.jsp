<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-hover">
		<tr>
			<th>가게명</th>
			<th>위치</th>
			<th>예약요청</th>
			<th>예약완료</th>
		</tr>
		<c:forEach var="restaurant" items="${restList }">
			<tr onclick="location.href='restBizSelect.do?restId=${restaurant.restId }'">
				<td>${restaurant.restName }</td>
				<td>${restaurant.restAddress }</td>
				<td>${restaurant.restReservWait }</td>
				<td>${restaurant.restReservAccept }</td>
			</tr>

		</c:forEach>
	</table>

</body>
</html>