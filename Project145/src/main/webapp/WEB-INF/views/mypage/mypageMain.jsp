<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>mypageMain.jsp</title>
<link href="/resources/my/css/mycss.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div align="center">
		<div class="profile-card" align="center">
			<div class="profile-cover">
				<div class="menu-container">
					<ul class="profile-actions" style="display: none;">
						<li><a href="#">Follow</a></li>
						<li><a href="#">Add as Friend</a></li>
						<li><a href="#">Like</a></li>
					</ul>
				</div>
				<div class="profile-avatar">
					<div class="btns-container">
						<div class="profile-links">
							<a class="zoom-avatar" href="#"><img
								src="https://dl.dropboxusercontent.com/s/5liaxzvwbfuqzpo/zoom.png"></a>
							<a class="read-more" href="#"><img
								src="https://dl.dropboxusercontent.com/s/62dfoo9h44o58lw/more.png"></a>
							<a class="view-map" href="#"><img
								src="https://dl.dropboxusercontent.com/s/9ofmihok0h64lvn/location.png"></a>
						</div>
					</div>
					<a href="#"><img
						src="https://dl.dropboxusercontent.com/s/7pcnqq18skh1myk/avatar.jpg"
						alt="Anis M" /></a>
				</div>
				<div class="profile-details">
					<h1>${mid }</h1>
					<h6>${member.getEmail() }</h6>
				</div>
			</div>
			<div class="profile-info" style="display: none;">
				<h1>About Me</h1>
				<div class="info-area">Lorem ipsum dolor sit amet, consetetur
					sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore
					et dolore magna aliquyam erat.Stet clita kasd gubergren, no sea
					takimata sanctus est.Lorem ipsum dolor sit amet, consectetuer
					adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet
					dolore magna aliquam erat volutpat.Ut wisi enim ad minim veniam,
					quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut
					aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet,
					consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt
					ut labore et dolore magna aliquyam erat, sed diam voluptua.</div>
				<div class="clear"></div>
			</div>
			<div class="profile-map" style="display: none;">
				<iframe width="100%" height="150" frameborder="0" scrolling="no"
					marginheight="0" marginwidth="0"
					src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Saveology+New+York&amp;aq=&amp;sll=37.0625,-95.677068&amp;sspn=40.052282,86.572266&amp;t=h&amp;ie=UTF8&amp;hq=Saveology&amp;hnear=New+York&amp;ll=40.552027,-74.420902&amp;spn=0.357117,0.912844&amp;iwloc=near&amp;output=embed"></iframe>
				<div class="clear"></div>
			</div>
			<div class="profile-content">
				<br> <a href="/myPageEdit.do?mId=${mid }"
					class="btn btn-light btn-icon-split"> <span
					class="icon text-white-50"> <i class="fas fa-arrow-right"></i>
				</span> <span class="text">내 정보 수정</span>
				</a><br> <br>
				<div class="card shadow mb-4">
					<!-- Card Header - Accordion -->
					<a href="#collapseCardExample" class="d-block card-header py-3"
						data-toggle="collapse" role="button" aria-expanded="true"
						aria-controls="collapseCardExample">
						<h6 class="m-0 font-weight-bold text-primary">내 보유금을 확인하세요 ✔</h6>
					</a>
					<!-- Card Content - Collapse -->
					<div class="collapse show" id="collapseCardExample" style="">
						<div class="card-body">
							<div class="row">
								적립금&nbsp; <input type="text" value="${member.getWalletPoint() }">&nbsp;&nbsp;
								충전금&nbsp; <input type="text" value="${member.getWalletCash() }"><br>
								MyWallet 에서 충전을 해보세요!! 하시라구요
							</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
				<br>
			</div>
		</div>
	</div>

	<script src="/resources/my/js/myjs.js"></script>
</body>
</html>