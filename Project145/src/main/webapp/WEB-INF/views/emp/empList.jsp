<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html><html><head><title>  </title></head>
<body>
<a href="insertFormEmp">사원등록</a>
<h3>사원목록</h3>
<c:forEach items="${empList}" var="emp">
    ${emp.employeeId} ${emp.firstName}  ${emp.lastName} <br>
</c:forEach>
</body>
</html>