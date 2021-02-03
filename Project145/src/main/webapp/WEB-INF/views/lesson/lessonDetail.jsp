<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lessonDetail.jsp</title>
<style>
.product-main {
	position: relative;
}

.product-sidebar {
	top: 100px;
	position: sticky;
	border: 1px;
	border-radius: 6px;
	box-shadow: rgba(41, 42, 43, 0.16) 1px 2px 6px -2px;
}

.textarea {
	resize: none;
	border: 1px solid #98bf80;
	border-radius: 10px;
	margin-bottom: 10px;
}

.joinBtn {
	width: 130px;
	background: #6C9852;
	border-radius: 10px;
	color: white;
	height: 60px;
}

.submitBtn {
	width: 80px;
	background: #6C9852;
	border-radius: 10px;
	color: white;
	height: 40px;
	padding: 0px;
}

.joinBtn:hover, .submitBtn:hover {
	color: white;
}

.widget-title {
	color: #545454;
	font-size: 14px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<section class="container blog-main-content mb-5">
		<div class="m-3 p-2"></div>
		<div class="row">
			<div class="col-md-7 col-sm-6 col-xs-12 product-main">
				<div>
					<div class="mb-5">
						<img width="750" src="/images/${lesson.cImg }" width="50"
							height="600">
					</div>
					<div>
						<div class="border-top pt-4 pb-5">
							<h4>상세정보</h4>
							<div class="mt-3 px-2">${lesson.cDesc }</div>
							<div class="mt-3 px-2">
								<hr>
							</div>
							<h4>커리큘럼</h4>
							<div class="mt-3 px-2">${lesson.curriculum }</div>
						</div>
						<div class="border-top pt-4 pb-5">
							<h4>강사</h4>
							<br>
							<div class="mt-3 px-2">
								<table class="table table-bordered">
									<thead class="thead-light">
										<tr>
											<th scope="col">#</th>
											<th scope="col">강사 아이디</th>
											<th scope="col">강사명</th>
											<th scope="col">강사 커리어</th>
										</tr>
									</thead>
									<tbody>
										<tr style="vertical-align: middle;">
											<td><img src="/images/${lesson.profileImage }" width=100
												" height="100"></td>
											<th scope="row">${lesson.mId }</th>
											<td>${lesson.mName }</td>
											<td>${lesson.career }</td>
										</tr>
									</tbody>
								</table>
								<br>
							</div>
						</div>
						<div class="border-top pt-4 pb-5">
							<h4>클래스 등록한 수강생</h4><br>
							<div class="mt-3 px-2">
								<table class="table table-bordered">
									<tbody>
										<c:forEach items="${mDetail }" var="member">
											<tr style="vertical-align: middle;">
												<th scope="row">${member.mId }</th>
												<td>${member.mName }</td>
												<td align="center"><img src="/images/${member.profileImage }"
													width=100 " height="100"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-1 col-sm-1"></div>
			<div class="col-md-4 col-sm-5 col-xs-12">
				<div class="product-sidebar py-3 px-4">
					<div class="border-bottom p-3">
						<h3>${lesson.cTitle }</h3>
						<span class="widget-title mb-2">Vegi Type :
							${lesson.vegtype }</span>
					</div>

					<div class="border-bottom p-3">
						<span class="widget-title mb-2">진행기간</span>
						<h5>
							<fmt:formatDate value="${lesson.cStart }" pattern="yyyy/MM/dd" />
							-
							<fmt:formatDate value="${lesson.cEnd }" pattern="yyyy/MM/dd" />
						</h5>
					</div>
					<div class="border-bottom p-3">
						<span class="widget-title mb-2">진행시간</span>
						<h5>📆 ${lesson.cTime }</h5>
					</div>
					<div class="border-bottom p-3">
						<span class="widget-title mb-2">강의료</span>
						<h5>
							<fmt:formatNumber value="${lesson.cPrice }" pattern="#,###" />
							원
						</h5>
					</div>
					<div class="border-bottom p-3">
						<span class="widget-title mb-2">장소</span>
						<h5>${lesson.cLoc }</h5>
					</div>
					<div class="border-bottom p-3">
						<span class="widget-title mb-2">등록 회원 수 / 정원</span>
						<h5>${lesson.cJoin }명/${lesson.cParti }명</h5>
					</div>
					<div class="border-bottom p-3">
						<form action="">
							<span class="widget-title mb-2">문의하기</span>
							<textarea class="textarea" rows="3"></textarea>
							<div align="right">
								<c:if test="${mId == null or mId == ''}">
									<button class="btn submitBtn btn-hover" type="submit"
										disabled="disabled">등록</button>
									<br>
									<br>
									<span>로그인 후 사용가능합니다.</span>
								</c:if>
								<c:if test="${mId != null and mId != ''}">
									<button class="btn submitBtn btn-hover" type="submit">등록</button>
								</c:if>
							</div>
						</form>
					</div>
					<div class="p-3" align="center">
						<div class="edd_purchase_submit_wrapper" align="center">
							<c:if test="${mId == null or mId == ''}">
								<button class="btn joinBtn btn-hover" disabled="disabled">클래스
									등록</button>
								<br>
								<br>
								<span>로그인 후 참가가능합니다.</span>
							</c:if>
							<c:if test="${mId != null and mId != ''}">
								<button class="btn joinBtn btn-hover">클래스 등록</button>
							</c:if><br>
							등록->결제완료-> m,c -> C_R in m wh c -> C c_join+1< c_parti ajax
							버튼c_j=c_p 마감
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%-- 
	<script>
		$(function() {
			$('.joinBtn').click(function() {
				var temp = confirm('[${meetVo.meetTitle}]\n해당 챌린지에 참가하시겠습니까?');
				if (temp) {
					location.href = "vegimeetJoinPage.do/?meetId=${meetVo.meetId}";
				}
			});
			
			if('${mId}' == null || '${mId}' == ''){
				$('.submitBtn').prop('disabled', true);
				$('.joinBtn').prop('disabled', true);
				$('.textarea').prop('disabled', true).attr('style', 'background: #e8e8e8;');
			}
			
			if('${joinFlag}' == 'true'){
				$('.joinBtn').text('참가완료');
				$('.joinBtn').prop('disabled', true);
			}
			
			//마감표시
			if('${joinFlag}' != 'true' && '${meetVo.dday}' <= 0) {
				$('.joinBtn').text('마감');
				$('.joinBtn').prop('disabled', true);
			}
			
			//마감 표시
			var today = new Date();
			today = new Date(today.getFullYear(), today.getMonth(), today.getDate());
			var start = '${meetVo.meetStart}';
			var dayArr = start.split('-');
			var startDay = new Date(dayArr[0], dayArr[1]-1, dayArr[2]);
			console.log((startDay.getTime() - today.getTime())/1000/60/60/24);
			
		})
	</script>
--%>
</body>
</html>