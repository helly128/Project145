<%@ page session="false" contentType="text/html; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<head>
	<title>Home</title>
</head>
<body>


${empVO.firstName } : ${evo.lastName }
<h1>
	Hello world! 
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
