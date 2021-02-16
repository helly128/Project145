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
  background-color: #6C9852;
  color: white;
  border-radius: 5px;
	background-color: #6C9852;
	background-color: #6C9852;
	color: white;
	border-radius: 5px;
	background-color: lightblue;
	background-color: #6C9852;
	color: white;
	border-radius: 5px;
}

.pagination a:hover:not(.active) {
	background-color: lightgray;
	border-radius: 5px;
}
</style>

<c:if test="${empty jsFunc}">
	<c:set var="jsFunc" value="goList"></c:set>
</c:if>
<div class="pagination">
	<c:if test="${paging.prev}">
		<a
			href="javascript:${jsFunc}(${paging.startPage>2?paging.startPage-1:1})">&laquo;</a>
	</c:if>
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
		<c:if test="${i != paging.page}">
			<a href="javascript:${jsFunc}(${i})">${i}</a>
		</c:if>
		<c:if test="${i == paging.page}">
			<a class="active" href="#">${i}</a>
		</c:if>
	</c:forEach>
	<c:if test="${paging.next}">
		<a
			href="javascript:${jsFunc}(${paging.endPage<paging.lastPage?paging.endPage+1:paging.endPage})">&raquo;</a>
	</c:if>
</div>

