<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</style>
<!-- <script type="text/javascript" src="/resources/js/reple.js" />
<script type="text/javascript">
$(document).ready(function){
	var openForm = $("#openForm");
	$("button[data-oper='update']").on("click",function(e){
		openForm.attr("action","/recipe/update").submit();
	});
}
</script> -->
<!-- Modal -->
<div class="modal fade" id="repleDesc" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">댓글 상세 보기 모달</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">x</span>
				</button>
			</div>
			<div class="modal-body">
				<div>
					<table class="table table-hover" border="1">
						<thead class="text-center">
							<tr class="content">

								<th width="10">번호</th>
								<th width="90">댓글내용</th>
								<th width="40">작성일자</th>
								<th width="10">작성자</th>
							</tr>
						</thead>
						<tbody class="text-center">
							<tr>
								<td>${reId}</td>
								<td>${reContent}</td>
								<td>${reDate}</td>
								<td>${MId}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-primary" type="button" data-dismiss="modal">Cancel</button>
				<button class="btn btn-primary" type="button" data-dismiss="modal">Edit</button>
				<button class="btn btn-primary" type="button" data-dismiss="modal">Delete</button>
			</div>
		</div>
	</div>
</div>
<!-- /.modal -->
<script>
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
			if (confirm("정말 삭제 하시겠어요?")) {

				if (mid == "${sessionScope.mId}") {
					repleDelete();
					alert("삭제되었습니다.");

				} else {
					alert("본인이 작성한 댓글만 삭제 가능합니다.");
				}
			}
		});

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

	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth() + 1;
	var day = today.getDate();
	var date = year + "년" + month + "월" + day + "일"
	$('#wDate').text(date);

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

	/* //댓글 입력
	function repleWrite() {
		var reContent = $("#reContent").val();
		var rId = "${RepleVo.RId}";
		var mId = "${mId}";
		var objParams = {
				rId : rId,
				reParent : reParent,
				reDept : reDept,
				reContent : reContent,
				reDate : date,
				mId : mId
		};
		
		$.ajax({
			type : "post",
			url : "/reple/reple.do",
			headers : {
				"Content-Type" : "application/json"
			},
			dataType : "text",
			data : JSON.stringify(objParams),
			success : function() {
				alert("댓글이 등록되었습니다.");
				$("#repleList").empty();
				//$("#repleList").append('#repleList');
				repleList();
				$("#reContent").val("");
			}
		})
	} */
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
						var output = "<table>";
						console.log(result);
						for ( var i in result) {
							output += "<tr>";
							output += "<td width='60' class='delBtn'>";
							output += "<td width='200'>" + result[i].reContent;
							output += "<td width='100'>" + result[i].reDate;
							output += "<td width='60' data-mid='"+result[i].mid+"'>"
									+ result[i].mid;
							output += "<td width='60'>"
									+ "<button type='button'  data-id='"+result[i].reId+"' class='delBtn' id='delBtn'>삭제";
							output += "<td width='60'>"
									+ "<button type='button' class='reBtn' id='reBtn'>답글";
							output += "</tr>"
						}
						output += "</table>";
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
					put += "</ul>";
				});
				$("#rMat").html(put);
			},
			error : function() {
				console.log("실패ㅜㅜ");
			}

		});
	}
</script>

</head>
<body>
	<div class="container">

		<div>
			<a href="/recipeMain.do" style="margin-top: 5%"><h2>⬅</h2></a>
		</div>
		<div class="category-list-item">
			<h2>🍏${recipeSelect.getRTitle() }</h2>
			<br />
			<div class="row">
				<div class="col-lg-10">
					<div class="icon">
						<i class="lni lni-users">${recipeSelect.getMId()} </i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i
							class="lni lni-calendar">${recipeSelect.getRDate()}</i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i
							class="lni lni-book">${recipeSelect.getRHit()}</i>
					</div>
					<div class="recipecontent">
						<textarea rows="5" cols="60">${recipeSelect.getRContent() }</textarea>
					</div>
				</div>
				<div class="col-lg-2">
					<img src="/images/${recipeSelect.getRImage()}" height="200px"
						width="200px">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-10"></div>
				<div class="col-lg-2">
					<button type="button" class="btn btn-success"
						onclick="location.href='/recipeUpdate.do?rId=${recipeSelect.getRId()}'">Edit</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-danger" data-toggle="modal"
						data-target="#exampleModal">Delete</button>
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
		<!-- 관련 재료 -->
		<div>
			<h3>🍋Ingredient</h3>
			<br />
			<div class="row">
				<div class="col-lg-4">
					Used Ingredient<br /> <br />
					<ol style="margin-left: 10%">
						<c:forEach var="recipeMaterial" items="${recipeMaterial}">
							<li><a onclick="matName('${recipeMaterial.getMatName()}')">${recipeMaterial.getMatName()}</a>&nbsp;${recipeMaterial.getMatVol()}</li>
						</c:forEach>

					</ol>

				</div>
				<div class="col-lg-8" id="rMat">
					Go to Cheapest Mall<br /> <br />
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
			<div class="row">
				<!-- 클래스리스트 시작 -->
				<input type="hidden" value="${lesson}">
				<c:forEach var="lesson" items="${lessons }">
					<div class="col-xl-3 col-lg-3 col-md-3">
						<div class="single-product">
							<div class="product-img">
								<a href="/lessonProduct.do?cId=${lesson.getCId() }"> <img
									src="/images/${lesson.getCImg() }" width="150" height="250">
								</a>
								<div class="product-action">
									<a href="javascript:void(0)"><i class="lni lni-heart"></i></a>
									<a href="javascript:void(0)" class="share"><i
										class="lni lni-share"></i></a>
								</div>
							</div>
							<div class="product-content">
								<input type="hidden" value="클래스아이디">
								<h3 class="name">
									<a href="product-details.html">${lesson.CTitle }</a>
								</h3>
								<span class="update">${lesson.getCDesc() }</span>
								<ul class="address">
									<li><a href="javascript:void(0)"><i
											class="lni lni-user"></i> ${lesson.lecName }</a></li>
									<li><a href="javascript:void(0)"><i
											class="lni lni-package"></i> ${lesson.CHit }</a></li>
									<li><a href="javascript:void(0)"><i
											class="lni lni-calendar"></i> ${lesson.CEnd }</a></li>
									<li><a href="javascript:void(0)"><i
											class="lni lni-map-marker"></i> ${lesson.vegType }</a></li>
								</ul>
								<div class="product-bottom">
									<h3 class="price">${lesson.CPrice }원</h3>
									<a href="javascript:void(0)" class="link-ad">좋아요</a>
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
					<div class="row" align="left">
						<div class="col-lg-6" align="center">댓글 내용</div>
						<div class="col-lg-2">작성일자</div>
						<div class="col-lg-2">작성자</div>
						<div class="col-lg-1">비고</div>
						<hr />
					</div>
					<input type="hidden" value="${reple}">
					<!-- 댓글 목록 출력되는 부분 -->
					<div class="row" id="repleList"></div>

				</div>

			</div>
			<br /> <br />
			<h5>🖊댓글 작성</h5>
			<br /> <br />
			<div class="container">
				<div class="search-wrapper">
					<!--로그인 한 회원에게만 댓글만 수정 삭제 가능하도록 처리-->
					<c:if test="${sessionScope.mId != null }">
						<div class="row justify-content-center">
							<div class="row" align="left">
								<div class="col-lg-2">
									<p>
										작성자 &nbsp;: &nbsp;${sessionScope.mId }<input type="hidden"
											name="mId" id="mId">
									</p>
								</div>
								<div class="col-lg-10">
									작성일자&nbsp;:&nbsp; <span id="wDate"> </span>
								</div>
							</div>
							<div class="col-lg-19 col-sm-8 col-10">
								<div class="search-input">
									<input type="text" name="reContent" id="reContent"
										placeholder="🤷‍♂️댓글을 입력 해 주세요">
								</div>
							</div>

							<div class="col-lg-2 col-sm-5 col-10">
								<!-- Submit button -->
								<button class="middle-btn" id="repleBtn">댓글</button>
							</div>
						</div>

					</c:if>
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
		<!--로그인 한 회원에게만 댓글만 수정 삭제 가능하도록 처리-->
		<%-- <c:if test="${sessionScope.mId != null }">
			<div class="replebox" id="repleList">
				<div class="single-box">
					<div class="row">
						<div class="icon col-lg-1">
							<h1>
								<i class="lni lni-bulb"></i>
							</h1>
						</div>
						<form id="openForm" action="">
							<div class="icon col-lg-11">
								<div class="row" align="left">
									<div class="col-lg-2">
										<p>작성자 &nbsp;: &nbsp;${sessionScope.mId }</p>
									</div>
									<div class="col-lg-10">
										<p>작성일자&nbsp;: &nbsp;${rDate }</p>
									</div>
								</div>
							</div>
					</div>
				</div>
				<div class="row">
					<textarea rows="3" cols="100" id="rContent" name="rContent"
						placeholder="댓글을 입력하세요">
					</textarea>
				</div>
				<br />
				<div class="row" align="right">
					<div class="col-lg-10">
						<label id="repleSecret">비밀댓글<input type="checkbox"
							id="repleSecret"></label>
					</div>
					<div class="col-lg-2">
						<button type="button" id="repleBtn">댓글 작성</button>
					</div>
				</div>
				</form>
		</c:if>
	</div> --%>
		<br />

		<!-- <div class="re-reple">
		<div class="search-wrapper">
			<form name="form1" method="post">
				<div class="row justify-content-center">
					<div class="col-lg-6 col-sm-4 col-3">
						<div class="search-input">
							<input type="text" name="keyword" id="keyword"
								placeholder="🤷‍♂️댓글을 입력 해 주세요">
						</div>
					</div>
					<div class="col-lg-2 col-sm-2 col-1">
						Submit button
						<button type="button" class="middle-btn">댓글</button>
					</div>
				</div>
			</form>
		</div>
		대댓글
		<div class="rereplebox">
			<div class="single-box">
				<div class="row">
					<div class="icon col-lg-1">
						<h1>
							<i class="lni lni-bulb"></i>
						</h1>
					</div>
					<div class="icon col-lg-11">
						<div class="row" align="left">
							<div class="col-lg-2">
								<p>작성자</p>
							</div>
							<div class="col-lg-10">
								<p>작성일자</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<p>Buy and sell everything from used cars to mobile phones and
					computer or search for property.Buy and sell everything from used
					cars to mobile phones and computer or search for property.Buy and
					sell everything from used cars to mobile phones and computer or
					search for property.</p>
			</div>
			<div class="row">
				<div class="col-lg-10">
					<a>↪</a>
				</div>
				<div class="col-lg-2">
					<a>🚫</a>
				</div>
			</div>
		</div>

	</div> -->
	</div>
</body>
</html>