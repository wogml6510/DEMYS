<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="pageTitle" value=""></c:set>


<%@ include file="../common/head.jsp" %>

<style>
/* p-main-body 고정 수정X, border만 씌워서 작업!! */
.p-main-body{
	margin-top:5px;
	width:100%;
	height: calc(930px - 65px - 63px); 
	background-color:#F2F2F2;
	padding:5px;
}
</style>

<link rel="stylesheet" href="/resource/css/project/list.css" />
<link rel="stylesheet" href="/resource/css/project/phead.css" />

<div class="project-part">

	<div class="p-sidbar">
		<div class="p-bt">
			<div class="p-regist">
				<button class="p-rg-bt">
					<i class="fa-regular fa-square-plus"></i>
					프로젝트등록
				</button>
				<div class="p-inend">
					<button class="p-inpro">진행중 </button>
					<button class="p-end">완료 </button>
				</div>
				<div class="p-check">
					<div style="padding-top:3px;">
					  <label class="cursor-pointer label">
					    <input type="checkbox" checked="checked" class="checkbox checkbox-info" />
					    <span class="label-text">&nbsp;전체 프로젝트</span>
					  </label>
					</div>
					<div class="w-42">
						<select class="select w-full max-w-xs">
						  	<option disabled selected>프로젝트명</option>
						  	<option>프로젝트명</option>
						  	<option>업체명</option>
						</select>
					</div>
				</div>
			</div>
			<div class="p-searchbar">
				<input type="text" placeholder="검색어를 입력하세요." class="input input-bordered" style="width:85%;"/>
				<i class="fa-solid fa-magnifying-glass" style="font-size:30px;width:15%;display:flex;align-items: center;justify-content: space-around;"></i>
			</div>
			
		</div>
		<div class="p-list">
 			<c:forEach var="pj" items="${projects }" >
			    <div class="p-list-box">
					<div style="border-bottom:1px solid #797979;">
						<div class="ellipsis p-list-title">
							<span style="color:red;font-size:20px;"><i class="fa-sharp fa-solid fa-flag"></i></span>
							<span >${pj.PJ_NAME }</span>
						</div>
						<div class="p-list-date">
							<span><fmt:formatDate value="${pj.PJ_STARTDATE }" pattern="yyyy-MM-dd"/></span>
							<span>~<fmt:formatDate value="${pj.PJ_ENDDATE }" pattern="yyyy-MM-dd"/></span>
						</div>
					</div>
					<div class="p-list-box-bottom">
						<span style="font-size:15px;">${pj.CT_NAME }</span>
						<span class="p-list-issu">이슈 ${pj.ISSUE_COUNT }</span>
					</div>
				</div>
			</c:forEach>
		
			<div class="p-list-pagination">
			
			</div>
			
		</div>
	
	</div>
	 <div class="p-body">
		<div class="p-body-header">
	 	 	<div class="p-main-title">
		     	<div>
		      		<span class="p-main-title-sty"></span>
		     	</div>
	   			<div class="p-main-reg-date"></div>
		 	 </div>
		 	 
	      	<div class="p-body-header-1">
			      <div style="display: flex;">
			         <div class="header-1-menu"><a href="#">프로젝트</a></div> |
			         <div class="header-1-menu"><a href="#">단위업무</a></div> |
			         <div class="header-1-menu"><a href="#">이슈관리</a></div> |
			         <div class="header-1-menu"><a href="#">예산수립</a></div> |
			         <div class="header-1-menu"><a href="#">회의록</a></div> |
			         <div class="header-1-menu"><a href="#">산출물관리 &nbsp;</a></div>
			      </div>
	      	</div>
	   </div> 
	   <!-- project작업공간 -->
		<div class="p-main-body">
   
   
   
   
   		<!-- p-main-body끝나는 태그 -->
		</div>   
	<!-- project/phead.jsp (t-body) 화면 끝나는 태그 -->
	</div>
<!-- project/list.jsp 화면끝나는 태그 -->
</div>

<%@ include file="../common/foot.jsp" %>