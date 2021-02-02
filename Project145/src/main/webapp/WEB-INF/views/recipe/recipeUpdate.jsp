<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recipe Insert</title>
<style>
input, textarea {
	border: 1px solid #6C9852;
}
</style>

</head>
<body>
	<div class="container">
		<div>
			<a href="/recipeMain.do" style="margin-top: 5%"><h2>⬅</h2></a>
		</div>
		<form id="frm" name="frm" method="post"
			action="/recipeUpdateResult.do" encType="multipart/form-data">
			<div class="category-list-item">
				<div class="row">

					<div class="col-lg-12">
						<h3>recipe title🍏</h3>
						<br /> <input type="text" id="rTitle" name="rTitle"
							style="border: '1'" value="${select.RTitle }"
							placeholder="제목을 입력하세요"> <br />
					</div>

				</div>
			</div>
			<div>
				<div class="row">
					<div class="col-lg-12">
						<textarea rows="5" cols="120" id="rContent" name="rContent">${select.RContent } </textarea>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-3">
						<i class="lni lni-users">작성자</i> <input type="text" id="mId"
							name="mId" value="${select.MId }" readonly>
					</div>
					<div class="col-lg-3">
						<i class="lni lni-calendar">작성일자</i> <input type="text"
							id="reDate" name="rDate" value="${select.RDate }" readonly>

					</div>
					<div class="col-lg-3">
						<p>이미지 수정</p>
						<input type="file" name="rImage" id="rImage" name="rImage"
							multiple="multiple">
					</div>
					<div class="col-lg-2 col-sm-4 col-5">
						<p>
							<i class="lni lni-grid-alt theme-color">비건타입 </i>
						</p>
						<div class="search-input">
							<label for="category"></label> <select name="category"
								id="category">
								<option value="none" selected disabled>비건 레벨</option>
								<option value="none">비건</option>
								<option value="none">락토</option>
								<option value="none">오보</option>
								<option value="none">락토오보</option>
							</select>
						</div>
					</div>
					<!-- <div class="col-lg-3">
					<img src="#" height="200px" width="200px">
				</div> -->
				</div>
			</div>
			<hr>
			<br />
			<!-- 관련 재료 -->

			<div>
				<h3>Ingredient🍋</h3>
				<br />
				<div class="row">
					Used Ingredient<br /> <br />
					<div class="col-lg-12 ">
						<%-- <c:forEach var="rm" items="${rm}">
							
						</c:forEach> --%>
						<table border="0" class="col-lg-12 " id="dataTable" name="dataTable">
							<tbody>
								<tr name="trMat">
									<td class="col-md-5"><input type="text" name="matName"
										placeholder="재료명"></td>
									<td class="col-md-5"><input type="text" name="matVol"
										placeholder="재료 양"></td>
									<td class="col-md-1"></td>
									<td class="col-md-1">
										<button type="button" name="addMat" id="addMat"
											class="btn btn-primary">➕</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

			</div>
			<hr />
			<br />
			<script>
			/* 	//재료 추가 버튼
				$(document)
						.on(
								"click",
								"button[name=addMat]",
								function() {

									var addMatText = '<tr name="trMat">'
											+ '    <td class="col-md-5">'
											+ '        <input type="text" class="form-control" name="matName" placeholder="재료명">'
											+ '</td>'
											+ '<td class="col-md-5">'
											+ '        <input type="text" class="form-control" name="matVol" placeholder="재료 양">'
											+ '</td>'
											+ '<td class="col-md-1">'
											+ '        <button class="btn btn-default" name="delMat">삭제</button>'
											+ '    </td>' + '</tr>';

									var trHtml = $("tr[name=trMat]:last"); //last를 사용하여 trMat라는 명을 가진 마지막 태그 호출

									trHtml.after(addMatText); //마지막 trMat명 뒤에 붙인다.

								}); 
			
				//재료 삭제 버튼
				$(document).on("click", "button[name=delMat]", function() {

					var trHtml = $(this).parent().parent();

					trHtml.remove(); //tr 테그 삭제

				});
				//추가한 재료 배열에 넣기
				function matArr() {
				    var matArr = [];     // 배열 초기화
				    $("input").each(function(i) {
				    	matArr.push($(this).val('matVol'));  
				    	matArr.push($(this).val('matName'));   
				    })
				 
				} 
				*/
				
				<c:set var="listLength" value="${fn:length(recipeVo.recipeVoList) }" /> 
				var length = '<c:out value="${listLength}"/>';
				$(function(){
					//메뉴추가 버튼 클릭 시 행 추가
					$("#addMat").on('click', function(){
						var tr = $("<tr>").attr("role", "row");
						tr.append($("<td>").append($("<input>").addClass('menu-input').attr({
							type: 'text',
							name: 'recipeVoList['+length+'].matName',
							required: 'true'
						})));
						tr.append($("<td>").append($("<input>").addClass('menu-input').attr({
							type: 'text',
							name: 'recipeVoList['+length+'].matVol'
						})));
						tr.append($("<td>"));
						tr.append($("<td>").append($("<button>").addClass('btn btn-primary delMat delMat'+length).attr({
							type: 'button'
						}).text('취소')));
						$("#dataTable > tbody").append(tr);
						
						length++;
					});
					
					
					//입력취소 버튼 누르면 해당하는 행 삭제
					$('#dataTable').on('click', '.delMat', function(){
						$(this).closest('tr').remove();
					});
				});
			</script>
			<!-- 관련 클래스 -->
			<c:set var="clistLength" value="${fn:length(lessonVO.classVoList) }" /> 
			<div>
				<div class="row">
					<h3>Related Class📖</h3>
					<div>
						<div class="plus">
							<br />

							<div class="col-lg-12" align="center">
								<table align="center">
									<tr>
										<td class="col-md-2" align="center" valign="middle"><select
											name="rType" id="rType">
												<option value="none" selected disabled>비건 레벨</option>
												<option value="비건">비건</option>
												<option value="락토">락토</option>
												<option value="오보">오보</option>
												<option value="락토오보">락토오보</option>
										</select></td>

										<td class="col-md-7"><input type="text"
											placeholder="Search Class" size="1000" id="keyword"
											name="keyword"></td>
										<td class="col-md-1"></td>
										<td class="col-md-1"><button class="btn btn-primary"
												id="searchC" name="searchC" type="button">search</button></td>
									</tr>
								</table>
							</div>
							<div id="search-result" align="center">class search result</div>
							<br /> <br />
						</div>

					</div>
				</div>
			</div>
			<div class="col-md-12" align="right">
				<button type="submit" class="btn btn-primary" value="">수정하기</button>
			</div>

			<script>
			var clength = '<c:out value="${clistLength}"/>';
			

				//클래스 검색 버튼 클릭 검색할 코드를 넘겨서 값을 가져온다. 
				
					$("#searchC").click(function() {
						/* //alert("검색 버튼 클릭!");
						var keyword = $("#searchCd").serialize(); */
						$.ajax({
							url : 'lessonSearch.do',
							type : 'POST',
							dataType : "json",
							data : {keyword:$("#keyword").val(),
									vegType: $("#rType").val()
									},
							success : function(data) {
								console.log(data);
								var output = "<table>";
								for ( var i in data) {
									output += "<tr>";
									output += "<td width='100'>" + data[i].lecName;
									output += "<td width='200'>" + data[i].ctitle;
									output += "<td width='250'>" + data[i].cdesc;
									output += "<td width='60'>"+"<input type='checkbox' name='class_check' data-id='"+data[i].cid+"'>";
									output += "</tr>" 
								}
								output += "</table>";
								$("#search-result").html(output);
								// success
							},
							error : function() {
								alert("ajax통신 실패!!!");
							}
						});
					});
				/*  data-id='"+data[i].cid+"'> 읽어올때는 $(this).data('id') */
				//검색한 클래스 선택 체크박스
					function checkboxArr() {
					    var checkArr = [];     // 배열 초기화
					    $("input[name='class_check']:checked").each(function(i) {
					        checkArr.push($(this).data('id'));     // 체크된 것만 값을 뽑아서 배열에 push
					    console.log('id: '+$(this).data('id'));
					    })
					 
					}
				
					$(function(){
						
							checkboxArr();
						
					});
				/* //최종 수정
					$("#updateBtn").click(function(){
						recipeUpdate();//수정 버튼 클릭시 실행
						checkboxArr();//체크된 클래스 부르고
					});
					function recipeUpdate(){
						$.ajax({
							type:"post",
							url:"/recipeUpdateResult.do",
							data:{
								valueClassArr: checkArr,
								valueMatArr: matArr,
							}
						});
					} */
			</script>
		</form>
		<br />
	</div>
</body>