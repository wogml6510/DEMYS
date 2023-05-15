<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.pagination {
  display: inline-block;
  width:100%;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 11px;
  text-decoration: none;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>

<form id="jobForm">	
	<input type='hidden' name="page" value=""/>
	<input type='hidden' name="perPageNum" value=""/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="keyword" value="" />
</form>

<div class="pagination">
	  <a href="javascript:list_go(1)" class="page-link">&laquo;</a>
	  <a href="#" class="page-link">&lt;</a>
	  
	  <c:forEach>
	  	<a href="#" class="page-link">1</a>
	  </c:forEach>
	  <!-- <a class="active" href="#">2</a> -->
	  
	  <a href="#" class="page-link">&gt;</a>
	  <a href="#" class="page-link">&raquo;</a>
</div>

<script>
function list_go(page,url){
	if(!url) url="main";
	
	$("form#jobForm input[name='page']").val(page);
	$("form#jobForm input[name='perPageNum']").val();
	$("form#jobForm input[name='searchType']").val($('select[name="searchType"]').val());
	$("form#jobForm input[name='keyword']").val($('div.p-searchbar>input[name="keyword"]').val());
	
	$('form#jobForm').attr({
		action:url,
		method:'get'
	}).submit();
}
</script>