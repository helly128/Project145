<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="com.pj.vegi.common.Paging"%>
<%@ attribute name="jsFunc" required="false" type="java.lang.String"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<c:if test="${empty jsFunc}">
	<c:set var="jsFunc" value="goList"></c:set>
</c:if>
<div class="pagination" id="dataTable_paginate">
	<a class="page-link"
		href="javascript:${jsFunc}(${paging.startPage>2?paging.startPage-1:1})">Previous</a>
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
		<c:if test="${i != paging.page}">
			<a href="javascript:${jsFunc}(${i})" aria-controls="dataTable"
				data-dt-idx="1" tabindex="0" class="page-link">${i}</a>
		</c:if>
		<c:if test="${i == paging.page}">
			<a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0"
				class="page-link">${i}</a>
		</c:if>
	</c:forEach>
	<a
		href="javascript:${jsFunc}(${paging.endPage<paging.lastPage?paging.endPage+1:paging.endPage})"
		aria-controls="dataTable" data-dt-idx="7" tabindex="0"
		class="page-link">Next</a>
</div>

<!-- 

<c:if test="${empty jsFunc}">
	<c:set var="jsFunc" value="go_page"></c:set>
</c:if>
<ul class="pagination justify-content-center">
	<li class="page-item">	
		<a class="page-link" href="javascript:${jsFunc}(${paging.startPage>2?paging.startPage-1:1})">이전</a></li>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
			<c:if test="${i != paging.page}">
				<li class="page-item"><a class="page-link" href="javascript:${jsFunc}(${i})">${i}</a></li>
			</c:if>
			<c:if test="${i == paging.page}">
				<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
			</c:if>
		</c:forEach>
	<li class="page-item">
		<a class="page-link" href="javascript:${jsFunc}(${paging.endPage<paging.lastPage?paging.endPage+1:paging.endPage})">다음</a></li>
</ul>

 -->