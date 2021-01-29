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
	<div class="container">
		<div>
			<a href="/restaurant.do" style="margin-top: 5%"><h2>⬅</h2></a>
		</div>
		<div class="category-list-item">
		<div class="row">
			<div class="col-lg-10">
				<div style="float:left; margin-right:1rem;">
					<h2>🥗${rVo.getRestName() }</h2>
				</div>
				<div style="float:left;">
					<h3>⭐( ${rVo.getRestStarAvg() } )</h3>
				</div>
			</div>
			<div class="col-lg-2">
				<a class="main-btn btn-hover d-none d-md-block" 
				id="restResvButton" onclick=""> 예약하기</a>
			</div>
		</div>
		
		<br>
		<hr/>	
		<br/>
		
		<div class="col-lg-12" align="center">
			<img src="" height="350px" width="600px">
		</div>
		
		<br>
		<hr/>	
		<br/>
			 
			<div class="row" >
				<div class="col-lg-10">
					<div class="col-lg-7" style="float:left;">
						<h3>식당정보</h3>
						<br/>
						<h4><i class="lni lni-map-marker"></i> ${rVo.getRestAddress() } </h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<h4><i class="lni lni-checkmark-circle"></i> ${rVo.getRestTime() }</h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<h4><i class="lni lni-phone"></i> ${rVo.getRestTel() }</h4>
					</div>
					
					<div class="col-lg-3" style="float:left;">
						map지도지도
					</div>
				</div>
			</div>
			
		<br>
		<hr/>	
		<br/>
			
			<div class="row">
				<div class="col-lg-10">
					<h3>메뉴</h4>
					<c:forEach var="menuList" items="${menuList }">
						<div>
							<h4> ${menuList.getMenuName()} </h4>
						</div>
						<div style="float:left;">
							<a> ${menuList.getMenuVegeType() }</a>
						</div>
						<div style="float:left;">
							<h5> ${menuList.getMenuPrice() } </h5>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<br/>
		
		
	</div>

</body>
</html>