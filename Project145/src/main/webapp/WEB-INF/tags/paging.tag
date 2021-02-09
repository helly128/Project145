<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="com.pj.vegi.common.Paging"%>
<%@ attribute name="jsFunc" required="false" type="java.lang.String"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border-radius: 5px;
}

.pagination a:hover:not(.active) {
  background-color: #ddd;
  border-radius: 5px;
}
</style>

<c:if test="${empty jsFunc}">
	<c:set var="jsFunc" value="goList"></c:set>
</c:if>
<div class="pagination">
	<a
		href="javascript:${jsFunc}(${paging.startPage>2?paging.startPage-1:1})">Previous</a>
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
		<c:if test="${i != paging.page}">
			<a href="javascript:${jsFunc}(${i})">${i}</a>
		</c:if>
		<c:if test="${i == paging.page}">
			<a href="#">${i}</a>
		</c:if>
	</c:forEach>
	<a
		href="javascript:${jsFunc}(${paging.endPage<paging.lastPage?paging.endPage+1:paging.endPage})">Next</a>
</div>

<!-- 

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

 -->