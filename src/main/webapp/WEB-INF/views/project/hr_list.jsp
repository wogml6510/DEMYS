<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../common/head.jsp" %>

<style>
/* p-main-body 고정 수정X, border만 씌워서 작업!! */
.p-main-body{
	margin-top:5px;
	width:100%;
	height: calc(930px - 65px - 63px); 
	/* background-color:#F2F2F2; */
	padding:5px;
}
</style>

<link rel="stylesheet" href="/resource/css/project/list.css" />
<link rel="stylesheet" href="/resource/css/project/phead.css" />
<link rel="stylesheet" href="/resource/css/project/detail.css" />
<!-- 프로젝트 참여인력.css -->
<link rel="stylesheet" href="/resource/css/project/hr_list.css" />
<!-- 모달창.css -->
<link rel="stylesheet" href="/resource/css/project/contacts_modal.css" />
<!-- 참여인력추가 모달.css -->
<link rel="stylesheet" href="/resource/css/project/hr_regist_modal.css" />

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
 			<c:forEach begin="0" end="4" step="1" >
			    <div class="p-list-box">
					<div style="border-bottom:1px solid #797979;">
						<div class="ellipsis p-list-title">
							<span style="color:red;font-size:20px;"><i class="fa-sharp fa-solid fa-flag"></i></span>
							<span >프로젝트제목들어가야함계속길게적는중</span>
						</div>
						<div class="p-list-date">
							<span>2023.05.02 ~ </span>
							<span> 2023.07.02</span>
						</div>
					</div>
					<div class="p-list-box-bottom">
						<span style="font-size:15px;">(주)오싸거</span>
						<span class="p-list-issu">이슈 3</span>
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
		     		<i class="fa-solid fa-flag ml-6" style="color:red;"></i> 
		      		<span class="p-main-title-sty">정보통신 연구개발사업($프로젝트명)</span>
		     	</div>
	   			<div class="p-main-reg-date">등록일 : 2023.05.09</div>
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
		
   			<div class="p-body-cont">
   				<div class="header-2-menu0">
	   				<div class="p-body-header-2">
		   				<div style="display:flex;margin-top:5px;height:25px;">
					         |<div class="header-2-menu"><a href="#">프로젝트 정보</a></div> |
					         <div class="header-2-menu"><a href="#">참여인력</a></div> |
					         <div class="header-2-menu"><a href="#">요구사항 관리</a></div> |
					      </div>
		   			</div>
	   			</div>
	   			
	   			<!-- 참여인력 정보 -->
	   			<div>
	   				<div class="hr-info">
	   					<div class="info-title">
	   						<button id="modal_opne_btn_hr_1" class="hr-regist-bt">참여인력 추가</button>
	   					</div>
	   					<div class="flex w-full mx-2.5">
	   						<span style="font-weight:bold;">총 참여인력 &nbsp;</span>
	   						<span style="font-weight:bold;color:blue;"> 6</span>
 						</div>
	   					<div class="hr-list">
   							<c:forEach begin="0" end="10" step="1">
								<div class="modal_opne_btn_hr_3 td-wrapper hr-list-cont shadow-lg">
									<div class="hr-img">
										<img src="/resource/img/imja.jpg" class="h-full" />
									</div>
									<div class="w-3/5 px-2.5">
										<div class="font-bold">No.1</div>
										<div>✔ 박연진</div>
										<div>✔ 매니저(PM)</div>
										<div>✔ 요구사항 분석</div>
									</div>
								</div>
   							</c:forEach>
	   					</div>
	   				</div>
	   				<!-- 참여인력 끝나는 태그 -->
	   			</div>
   			</div>
   
		</div>   
   		<!-- p-main-body끝나는 태그 -->
	</div>
	<!-- project/phead.jsp (t-body) 화면 끝나는 태그 -->
</div>
<!-- project/list.jsp 화면끝나는 태그 -->

<!-- 모달창-참여인력 상세  -->
<div id="modal_hr_3">

      <div class="modal_hr_content_1">
            <div class="flex" style="background-color: #153A66;">
                  <div class="navbar text-neutral-content modal-head">
                        <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                  </div>
            </div>

			<div class="cts-view">
				<div class="hr-title">
					<span>참여인력 상세</span>
				</div>
				<div class="hr-regi-detail">
					<div class="td-wrapper hr-regi-cont">
						<div class="hr-icon">
							<i class="fa-regular fa-file-image" style="font-size:210px;"></i>
						</div>
						<div class="hr-regi-conts">
							<span>No.1</span>
							<div>✔ 알방효선</div>
							<div>✔ 세부사항</div>
							<div>&nbsp;논산사는 구효선씨는 어느순산 알방에 물들어가있습니다..</div>
						</div>
					</div>
				</div>
				
				
				<div class="p-regi-modal-bts">
	                  <button class="p-regi-modal-bt">등록</button>
	                  <button id="modal_close_btn_hr_3" class="p-regi-modal-bt">취소</button>
	            </div>
			</div>
      </div>

      <div class="modal_layer"></div>
</div>
<script>
// 참여인력상세 모달창.js
document.getElementsByClassName("modal_opne_btn_hr_3").onclick = function() {
   document.getElementById("modal_hr_3").style.display = "block";
}

document.getElementById("modal_close_btn_hr_3").onclick = function() {
   document.getElementById("modal_hr_3").style.display = "none";
}
</script>





<!-- 모달창-참여인력 추가(등록) 화면  -->
<div id="modal_hr">

      <div class="modal_hr_content_1">
            <div class="flex" style="background-color: #153A66;">
                  <div class="navbar text-neutral-content modal-head">
                        <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                  </div>
            </div>

			<div class="cts-view">
				<div class="hr-title">
					<span>참여인력 추가</span>
				</div>
				<div class="hr-regi-detail">
					<div class="td-wrapper hr-regi-cont">
						<div class="hr-icon">
							<i class="fa-regular fa-file-image" style="font-size:210px;"></i>
						</div>
						<div class="hr-regi-conts">
							<div>✔ &nbsp;
								<input type="text" placeholder="이름을 입력하세요." class="input w-full h-9" />
								<button id="modal_opne_btn_hr_2" class="p-regi-modal-bt">조회</button>
							</div>
							<div>✔ &nbsp; 
								<div class="">
									<select class="select w-64">
									  	<option disabled selected>담당업무</option>
									  	<option>매니저(PM)</option>
									  	<option>리더(PL)</option>
									  	<option>공통설계자(AA)</option>
									  	<option>구축담당자(TA)</option>
									  	<option>DB설계자(DA)</option>
									  	<option>품질보증(QA)</option>
									  	<option>프로세스설계자(BA)</option>
									</select>
								</div>
							</div>
							<div class="font-bold">✔ 세부사항</div>
							<div>&nbsp;<input type="text" placeholder="  세부사항을 입력하세요." class="input w-full h-16" /></div>
						</div>
					</div>
				</div>
				
				
				<div class="p-regi-modal-bts">
	                  <button class="p-regi-modal-bt">등록</button>
	                  <button id="modal_close_btn_hr_1" class="p-regi-modal-bt">취소</button>
	            </div>
			</div>
      </div>

      <div class="modal_layer"></div>
</div>
<script>
// 참여인력추가 모달창.js
document.getElementById("modal_opne_btn_hr_1").onclick = function() {
   document.getElementById("modal_hr").style.display = "block";
}

document.getElementById("modal_close_btn_hr_1").onclick = function() {
   document.getElementById("modal_hr").style.display = "none";
}
</script>


<!-- 모달창-참여인력 조회화면 (프로젝드메니저등록모달창과 제목만 다름) -->
<div id="modal_1">

      <div class="modal_content">
            <div class="flex" style="background-color: #153A66;">
                  <div class="navbar text-neutral-content modal-head">
                        <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                  </div>
            </div>

			<div class="cts-view">
				<div class="cts-title">
					<span>참여인력 조회</span>
				</div>
				<div class="cts-title-sub">* 사원을 조회합니다.</div>
				<div class="p-modal-serach">
					<select class="select select-bordered p-cts-select">
						  <option disabled selected>선택 </option>
						  <option>담당자명</option>
						  <option>담당부서</option>
						  <option>직급</option>
					</select>
					<div class="p-modal-searchbar">
						<input type="text" placeholder="검색어를 입력하세요." class="input input-bordered p-modal-searchbar-input"/>
						<i class="fa-solid fa-magnifying-glass" style="font-size:30px;width:15%;display:flex;align-items: center;justify-content: space-around;"></i>
					</div>
				</div>
				<div class="cts-serch-list">
					<table border="1">
						<c:forEach begin="0" end="6" step="1" >
							<tr>
								<td>이도현</td>
								<td>서울주병원</td>
								<td>병원장아들</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="p-regi-modal-bts">
	                  <button class="p-regi-modal-bt">등록</button>
	                  <button id="modal_close_btn_hr_2" class="p-regi-modal-bt">취소</button>
	            </div>
			</div>
      </div>

      <div class="modal_layer"></div>
</div>
<script>
// 참여인력조회 모달창.js
document.getElementById("modal_opne_btn_hr_2").onclick = function() {
   document.getElementById("modal_1").style.display = "block";
}

document.getElementById("modal_close_btn_hr_2").onclick = function() {
   document.getElementById("modal_1").style.display = "none";
}
</script>

<%@ include file="../common/foot.jsp" %>