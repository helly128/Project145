
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.replebox {
	margin-left: 10%;
	margin-right: 10%;
}

.rereplebox {
	margin-left: 15%;
	margin-right: 15%;
}

<
style type ="text /css ">.likeAction {
	border: none;
	background: transparent;
}

.noresize {
	resize: none; /* 사용자 임의 변경 불가 */
}

textarea {
	resize: none;
	border: 1px solid #98bf80;
	border-radius: 10px;
	margin-bottom: 0px;
}

.delBtn {
	border: none;
	background: transparent;
	font-size: 14px;
}

.reContent {
	font-size: 15px;
	color: black;
}
</style>


<script>
	function dateFormat(dat) {
		var date = new Date(dat);
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		var hour = date.getHours();
		var min = date.getMinutes();
		if (hour < 10) {
			hour = '0' + hour;
		}
		if (min < 10) {
			min = '0' + min;
		}
		if (month < 10) {
			month = '0' + month;
		}
		if (day < 10) {
			day = '0' + day;
		}
		var newDate = year + "-" + month + "-" + day + " " + hour + ":"
				+ min;
		return newDate;
	}
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth() + 1;
	var day = today.getDate();
	var date = year + "년" + month + "월" + day + "일"

	$(document).ready(function() {
		repleList();//댓글 목록 불러오기

		$("#repleBtn").click(function() {
			repleWrite();//댓글 쓰기 버튼 클릭시 json으로 입력
		});

		$("#repleList").on('click', '.delBtn', function() {
			/* var delAlert = confirm("정말 삭제 하시겠어요?");delAlert == ture */
			/* mid=$(event.target).data("mid")  "${mId}"== mid*/
			var mid = $(event.target).parent().prev().text()
			console.log($(event.target).parent().prev().text())

			if (mid == "${sessionScope.mId}") {

				if (confirm("정말 삭제 하시겠어요?")) {
					repleDelete();
					alert("삭제되었습니다.");

				}
			} else {
				alert("본인이 작성한 댓글만 삭제 가능합니다.");
			}
		});
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		var day = today.getDate();
		var date = year + "-" + month + "-" + day
		$('#wDate').text(date);

	});
	//댓글 삭제
	function repleDelete() {
		id = $(event.target).data("id")
		$.ajax({
			type : "delete",
			url : "/reple/reple.do/" + id,
			success : function(result) {
				repleList();

			}
		});
	}

	//댓글 입력
	function repleWrite() {
		var reContent = $("#reContent").val();
		var rId = "${RepleVo.RId}"
		var mId = "${mId}"
		$.ajax({
			type : "post",
			url : "/reple/reple.do",
			headers : {
				"Content-Type" : "application/json"
			},
			dataType : "text",
			data : JSON.stringify({
				rId : rId,
				reContent : reContent,
				reDate : date,
				mId : mId
			}),
			success : function() {
				alert("댓글이 등록되었습니다.");
				$("#repleList").empty();
				//$("#repleList").append('#repleList');
				repleList();
				$("#reContent").val("");
			}
		})
	}

	/* 	//댓글 수정
	 function repleEdit() {
	 $.ajax({
	 type : "put",
	 url : "/reple/{reId}",
	 success : function(result) {
	 alert("댓글이 수정되었습니다.");
	 $("#repleList").empty();
	 //$("#repleList").append('#repleList');
	 repleList();
	 $("#reContent").val("");
	 }
	 })
	 } */

	//댓글 목록 출력
	function repleList() {
		$
				.ajax({
					type : "get",
					url : "/reple/reple.do?RId=${recipeVo.RId}",
					success : function(result) {
						var output = `<ul style='list-style:none;'>`; 
						for ( var i in result) {
							var date = dateFormat(result[i].reDate);
							if(result[i].reDepth == 2){
								output += "<li style='padding-left:60px;position:relative;' data-mid='\${result[i].mid}'>";
							} else{
								output += "<li>";
							}
							output += `<div class='reple-total mb-3' style="position:relative;">
											<span style="position:absolute;"><image
											src="/images/\${result[i].profileImage}" style='border-radius: 30%; width:45px;'></span>
											<div style='padding-left:60px; position:relative;' class='reple-content'>
												<div class="mb-1" style="color:black;">
													<strong>\${result[i].mname}</strong>
												</div>
												<div class="reContent">
													\${result[i].reContent}
												</div>
												<div>
													<span style="font-size:12px;">\${date}</span>
													<button type='button' data-id='\${result[i].reId}' class='delBtn' id='delBtn'><i class="lni lni-trash"></i></button>
												</div>
											</div>
										</div>
									</li>`;
							
							
							
						}
							/* output += `<tr class="mt-1">`;
							if(result[i].reDepth == 1){
								var img = `<td rowspan="2" width='60' style="padding: 8px 8px 8px 8px;"><image
									src="/images/\${result[i].profileImage}" style='border-radius: 30%; width:45px;'></td>`;
							} else{
								var img = `<td rowspan="2" width='120' style="padding: 8px 8px 8px 68px;"><image
									src="/images/\${result[i].profileImage}" style='border-radius: 30%; width:45px;'></td>`;
							}
								output += `<td rowspan="3" width='60'></td>
											\${img}
											<td data-mid="\${result[i].mid}" style="padding: 8px 8px 3px 12px;" colspan="2"><strong>\${result[i].mname}</strong></td>
										</tr>
										<tr>
											<td style="padding: 3px 8px 3px 12px; font-size: 15px;" colspan="2">\${result[i].reContent}</td>
										</tr>
										<tr class='border-bottom'>
											<td> </td>										
											<td style="font-size:12px; color:grey; padding: 3px 8px 3px 12px;">\${date} <button type='button' data-id='\${result[i].reId}' class='delBtn' id='delBtn'><i class="lni lni-trash"></i></button></td>
											<td width='60' style="padding: 3px 8px 3px 8px;"></td>
										</tr>`;
							
						}
						output += "</table>"; */
						output += `</ul>`;
						$("#repleList").html(output);
					}
				});
	}

	//재료
	function matName(name) {
		console.log(name);
		$.ajax({
			type : "get",
			url : "/recipeMaterial.do/" + name,
			contentType : "application/json",
			success : function(result) { //[{},{},{}]를 뽑아야ㅐ해
				console.log(result);
				var put = "<ul>";
				$.each(result, function(idx, item) {//item이 vo다.
					put += "<li>" + item.title;
					put += "<li>" + item.lprice + "원";
					put += "<li>" + "홈페이지 : " + item.mallName;
					put += "<li>" + "<a href='"+item.link+"'>" + item.link
							+ "</a>";
					put += "<hr/>";
				});
				put += "</ul>";
				$("#rMat").html(put);
				if (result.length == 0) {
					alert("검색 가능한 값이 없습니다.😂");
				}
			},
			error : function() {
				console.log("실패ㅜㅜ");
			}

		});

		$("#cards")
				.on(
						'click',
						'.likeAction',
						function() {

							if ('${mId}' == null || '${mId}' == '') {
								alert("로그인 후 이용가능합니다.")
							} else {
								var classId = $(this).data('id')

								if ($(this).children('img').attr('src') == '/images/empty_like.png') {
									$.ajax({
										url : 'lessonLike.do/' + classId,
										type : 'post',
										contentType : "application/json",
										success : function(result) {

										}
									}) // ajax end
									$(this).children('img').attr('src',
											'/images/filled_like.png')
								} else {
									$.ajax({
										url : 'lessonUnLike.do/' + classId,
										type : 'post',
										contentType : 'application/json',
										success : function(result) {

										}
									}) //ajax end
									$(this).children('img').attr('src',
											'/images/empty_like.png')
								}
							}
						});

	}
</script>

</head>
<body>
	<c:set var="contentIndex"
		value="${recipeSelect.getRContent().indexOf('<img src') }" />
	<div class="container mb-5">

		<div>
			<a href="/recipeMain.do" style="margin-top: 5%"><h2>⬅</h2></a>
		</div>
		<div class="category-list-item">
			<h2>🍏${recipeSelect.getRTitle() }</h2>
			<br />
			<div class="icon">
				<i class="lni lni-user"> ${recipeSelect.getMId()} </i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i
					class="lni lni-calendar"> ${recipeSelect.getRDate()}</i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i
					class="lni lni-book"> ${recipeSelect.getRHit()}</i>
			</div>
			<c:if test="${contentIndex == -1 }">
				<div align="center">
					<img src="${recipeSelect.getRImage()}" width="400px">
				</div>
			</c:if>
			<div class="recipecontent my-4">${recipeSelect.getRContent() }</div>

			<div class="row">
				<div class="col-lg-10"></div>
				<div class="col-lg-2">
					<c:if test="${sessionScope.mId==recipeSelect.MId}">
						<button type="button" class="btn btn-success"
							onclick="location.href='/recipeUpdate.do?rId=${recipeSelect.getRId()}'">Edit</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-danger" data-toggle="modal"
							data-target="#exampleModal">Delete</button>
					</c:if>
				</div>
			</div>
		</div>
		<hr />
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">게시물 삭제</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">게시물을 정말 삭제하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							onclick="location.href='/recipeDelete.do?rId=${recipeSelect.getRId()}'">삭제하기</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소하기</button>
					</div>
				</div>
			</div>
		</div>

		<br />
		<!-- <script>
		Handlebars.registerHelper("eqReplyWriter", function (replyWriter, block) {
		    var accum = "";
		    if (replyWriter === "${login.userId}") {
		        accum += block.fn();
		    }
		    return accum;
		});
		</script> -->
		<!-- 관련 재료 -->
		<div>
			<h3>🍋Ingredient</h3>
			<br />
			<div class="row">
				<div class="col-lg-4">
					Used Ingredient<br /> <br />
				</div>
				<div class="col-lg-8">
					Go to Cheapest Mall<br /> <br />
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<ol style="margin-left: 10%">
						<c:forEach var="recipeMaterial" items="${recipeMaterial}">
							<li style="cursor: pointer"><a
								onclick="matName('${recipeMaterial.getMatName()}')">${recipeMaterial.getMatName()}&nbsp;&nbsp;&nbsp;${recipeMaterial.getMatVol()}</a></li>
						</c:forEach>

					</ol>

				</div>
				<div class="col-lg-8" id="rMat">
					<ol>
						<li>값이 없으면 검색되지 않습니다.😂</li>

					</ol>
				</div>
			</div>
		</div>

		<hr />
		<br />
		<!-- 관련 클래스 -->
		<div>
			<h3>📖Related Class</h3>
			<br /> <br />
			<div class="row" id="cards">
				<!-- 클래스리스트 시작 -->
				<c:forEach var="lesson" items="${lessons }">
					<div class="col-xl-3 col-lg-3 col-md-3">
						<div class="single-product">
							<div class="product-img">
								<a href="/lessonProduct.do?cId=${lesson.getCId() }"> <img
									src="/images/${lesson.getCImg() }" width="150" height="250">
								</a>
							</div>
							<div class="product-content">
								<h3 class="name">
									<a href="/lessonProduct.do?cId=${lesson.getCId() }">${lesson.getCTitle() }</a>
								</h3>
								<span class="update">${lesson.getCDesc() }</span>
								<ul class="address">
									<li><i class="lni lni-calendar"></i> ${lesson.getCEnd() }
										${lesson.getCStart() }</li>
									<li><i class="lni lni-map-marker"></i>
										${lesson.getVegType() }</li>
									<li><i class="lni lni-package"></i> ${lesson.getCHit() }</li>
								</ul>
								<div class="product-bottom">
									<h3 class="price">${lesson.CPrice }원</h3>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<br />

		<div>
			<div>

				<h5>🖊댓글 목록</h5>
				<br />
				<div id="reloadReple">
					<input type="hidden" value="${reple}">
					<!-- 댓글 목록 출력되는 부분 -->
					<div class="row">
						<div class="col-lg-10 col-md-10 mx-5" id="repleList"></div>
					</div>
				</div>

			</div>
			<br /> <br />
			<h5>🖊댓글 작성</h5>
			<br />
			<div class="search-wrapper">
				<!--로그인 한 회원에게만 댓글만 수정 삭제 가능하도록 처리-->
				<div class="row justify-content-center"
					style="display: flex; align-items: center;">
					<div class="col-lg-9 col-sm-9 col-10">
						<div class="search-input">
							<textarea name="reContent" id="reContent" rows="4"
								placeholder="🤷‍♂️댓글을 입력 해 주세요"></textarea>
						</div>
					</div>
					<div class="col-lg-2 col-sm-5 col-10">
						<!-- Submit button -->
						<button class="middle-btn" id="repleBtn">등록</button>
					</div>
				</div>
			</div>
		</div>
		<!-- reple Modal -->
		<div class="modal fade" id="repleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="repleModalLabel">게시물 삭제</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">게시물을 정말 삭제하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							onclick="repleDelete()">삭제하기</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소하기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 댓글-->

		<br />


	</div>
</body>
</html>