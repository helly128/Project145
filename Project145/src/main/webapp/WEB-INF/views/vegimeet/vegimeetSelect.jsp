<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VEGIMEET</title>
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

div, h3 {
	word-break:keep-all;
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
						<img width="750" src="/images/${meetVo.meetPic }"
							class="attachment-full size-full wp-post-image" alt=""
							loading="lazy" sizes="(max-width: 750px) 100vw, 750px">
					</div>
					<div>
						<div class="border-top pt-4 pb-5">
							<h4>상세정보</h4>
							<div class="mt-3 px-2">${meetVo.meetContent }</div>
						</div>
						<div class="border-top pt-4 pb-5">
							<h4>주최자</h4>
							<div class="mt-3 px-2">
							${meetVo.getMId() }</div>
						</div>
						<div class="border-top pt-4 pb-5">
							<h4>참가자 목록</h4>
							<div class="mt-3 px-2">
								<c:forEach var="partiVo" items="${partiList}">
									<span>${partiVo.getMId() }</span>
								</c:forEach>
							</div>
						</div>
						<div class="border-top pt-4 pb-5 border-bottom">
							<h4>다른 참가자의 사진</h4>
							<div class="row mt-3 px-2 infiniteScroll">
								<c:forEach var="datavo" items="${dataList }">
									<div class="p-2 col-xl-3 col-lg-3 col-md-4" style="
									display:flex; align-items:center;">
										<img src="/images/${datavo.dataPic }">
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-1 col-sm-1"></div>
			<div class="col-md-4 col-sm-5 col-xs-12">
				<div class="product-sidebar py-3 px-4">
					<div class="border-bottom p-3">
						<h3>${meetVo.meetTitle }</h3>
					</div>

					<div class="border-bottom p-3">
						<span class="widget-title mb-2">진행기간</span>
						<h5>📆 ${meetVo.meetStart } ~ ${meetVo.meetEnd }</h5>
					</div>
					<div class="border-bottom p-3">
						<span class="widget-title mb-2">참가액</span>
						<h5>
							<fmt:formatNumber value="${meetVo.minMoney }" pattern="#,###" />
							원 ~
						</h5>
					</div>
					<div class="border-bottom p-3">
						<span class="widget-title mb-2">현재 모금액</span>
						<h5>${meetVo.meetFund }원</h5>
					</div>
					<div class="border-bottom p-3">
						<span class="widget-title mb-2">참가자수</span>
						<h5>${meetVo.meetParticipant }명</h5>
					</div>
					<div class="border-bottom p-3">
						<form action="">
							<span class="widget-title mb-2">문의하기</span>
							<textarea class="textarea" rows="3"></textarea>
							<div align="right">
								<button class="btn submitBtn btn-hover" type="submit">등록</button>
							</div>
						</form>
					</div>
					<div class="p-3">
						<div class="edd_purchase_submit_wrapper" align="center">
							<button class="btn joinBtn btn-hover">
								참가하기
							</button>
						</div>
					</div>
					<c:if test="${mId == null or mId == ''}">
						<span>로그인 후 참가가능합니다.</span>
					</c:if>
				</div>
			</div>
		</div>
	</section>
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
			
			
			//무한 스크롤 사진 로딩
			//https://victorydntmd.tistory.com/194
			/* let isEnd = false;
			
			$(window).scroll(function(){
				var $window = $(this);
				var scrollTop = $window.scrollTop();
	            var windowHeight = $window.height();
	            var documentHeight = $(document).height();
	            
	            console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
	            
	            // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
	            if( scrollTop + windowHeight + 30 > documentHeight ){
	                fetchList();
	            }
	           fetchList(); 
			}); */
		});
		
		var fetchList = function(){
	        if(isEnd == true){
	            return;
	        }
	        
	        // 방명록 리스트를 가져올 때 시작 번호
	        // renderList 함수에서 html 코드를 보면 <li> 태그에 data-no 속성이 있는 것을 알 수 있다.
	        // ajax에서는 data- 속성의 값을 가져오기 위해 data() 함수를 제공.
	        let startNo = $(".infiniteScroll div").last().data("no") || 1;
	        $.ajax({
	            url:"/scrollNewImage.do?" + startNo ,
	            type: "GET",
	            dataType: "json",
	            success: function(result){
	                // 컨트롤러에서 가져온 방명록 리스트는 result.data에 담겨오도록 했다.
	                // 남은 데이터가 5개 이하일 경우 무한 스크롤 종료
	                let length = result.data.length;
	                if( length < 5 ){
	                    isEnd = true;
	                }
	                $.each(result.data, function(index, vo){
	                    renderList(false, vo);
	                });
	            }
	        });
	        
	        
	    }
	</script>
</body>
</html>