<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet" href="/resource/css/project/detail.css" />
<!-- 프로젝트정보/거래처 등록 모달창.css -->
<link rel="stylesheet" href="/resource/css/project/contacts_regist_modal.css" />
<link rel="stylesheet" href="/resource/css/project/contacts_modal.css" />

<div class="p-body-header">
	 	 	<div class="p-main-title">
		     	<div>
		     		<c:choose>
						<c:when test="${projects.PJ_IMP eq 3}">
							<i class="fa-solid fa-flag ml-6" style="color:#D9001B;"></i>
						</c:when>
						<c:when test="${projects.PJ_IMP eq 2}">
							<i class="fa-solid fa-flag ml-6" style="color:#F59A23;"></i>
						</c:when>
						<c:otherwise>
							<i class="fa-solid fa-flag ml-6" style="color:#FFFF00;"></i>
						</c:otherwise>
					</c:choose>
		      		<span class="p-main-title-sty">${projects.PJ_NAME }</span>
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
		<div class=" p-main-body">
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
	   			
	   			<!-- 프로젝트정보 -->
	   			<div >
	   				<div class="p-info-detail">
	   					<div class="p-info-detail-title">
	   						<span style="font-weight:bold;">프로젝트 정보</span>
	   						<button id="P_Modify" class="p-info-detail-bt">수정</button>
	   					</div>
	   					<div class="p-detail-table">
	   						<table border="1">
	   							<tr>
	   								<td>프로젝트명</td>
	   								<td>${projects.PJ_NAME }</td>
	   							</tr>
	   							<tr>
	   								<td>프로젝트기간</td>
	   								<td>
	   									<span><fmt:formatDate value="${projects.PJ_STARTDATE }" pattern="yyyy-MM-dd"/></span>
	   									<span>~ <fmt:formatDate value="${projects.PJ_ENDDATE }" pattern="yyyy-MM-dd"/></span>
	   								</td>
	   							</tr>
	   							<tr>
	   								<td>예상 매출액</td>
	   								<td>${projects.PJ_PRICE }원</td>
	   							</tr>
	   							<tr>
	   								<td>프로젝트 매니저</td>
	   								<td>${projects.MEMBER_NAME }</td>
	   							</tr>
	   							<tr>
	   								<td>프로젝트 사업구분</td>
	   								<td>${projects.PJ_FIELD }</td>
	   							</tr>
	   							<tr>
	   								<td>프로젝트 구분</td>
	   								<c:if test="${projects.PJ_TYPE eq 1}">
		   								<td>내부 프로젝트</td>
	   								</c:if>
	   								<c:if test="${projects.PJ_TYPE eq 2}">
		   								<td>외부 프로젝트</td>
	   								</c:if>
	   							</tr>
	   							<tr>
	   								<td>프로젝트 내용</td>
	   								<td>${projects.PJ_CONTENT }</td>
	   							</tr>
	   							<tr>
	   								<td>업체명</td>
	   								<td>${projects.CT_NAME }</td>
	   							</tr>
	   							<tr>
	   								<td>깃 주소</td>
	   								<td>${projects.PJ_GIT }</td>
	   							</tr>
	   						</table>
	   					</div>
	   				</div>
	   				<!-- 프로젝트정보 끝나는 태그 -->
	   				
	   				<!-- 프로젝트정보안에 거래처 화면 -->
	   				<div>
	   					<div class="p-info-cts-title">
	   						<div>
		   						<span style="font-weight:bold;">총 거래처</span>
		   						<span style="font-weight:bold;color:blue;">3</span>
	   						</div>
	   						<div>
	   							<button id="modal_opne_btn_Cts_1" class="p-info-detail-bt">등록</button>
	   						</div>
	   					</div>
	   					<div class="p-cts-list">
	   						<table>
	   							<thead>
	   							<tr>
   									<th>No.</th>
   									<th>거래처명</th>
   									<th>대표 전화번호</th>
   									<th>대표 팩스번호</th>
   									<th>대표 주소</th>
   									<th>거래처 담당자</th>
   									<th></th>
   								</tr>
   								</thead>
   								<tbody style="height: 230px;overflow-y:auto;overflow-x:hidden;">
	   							<c:forEach begin="0" end="6" step="1">
								<tr>
 									<td>1</td>
 									<td>A거래처</td>
 									<td>042-342-4432</td>
 									<td>042-342-4431</td>
 									<td>대전 동구 여긴어디 대전로 102-1번지 어디든가고싶다대전 동구 여긴어디</td>
 									<td>김뭥미</td>
 									<td>
 										<button>
 										<i class="fa-solid fa-circle-xmark" style="color:red;font-size:23px;padding-right:5px;"></i>
 										</button>
 									</td>
								</tr>
	   							</c:forEach>
	   							</tbody>
	   						</table>
	   					</div>
	   					
	   				</div>
	   				<!-- 거래처화면 끝나는 태그 -->
	   			
	   			
	   			
	   			</div>
   			
   			</div>
   
   
   
   		<!-- p-main-body끝나는 태그 -->
		</div>   
	<!-- project/phead.jsp (t-body) 화면 끝나는 태그 -->
	
   			
   
	 


<!-- 모달창-거래처 조회 등록  -->
<div id="modal_Cts_1">

      <div class="modal_content_1">
            <div class="flex" style="background-color: #153A66;">
                  <div class="navbar text-neutral-content modal-head">
                        <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                  </div>
            </div>

			<div class="cts-view">
				<div class="cts-title">
					<span>거래처 등록</span>
				</div>
				<div class="cts-title-sub">* 거래처정보를 입력하세요.</div>
				<div class="cts-modal-search_1">
					<div class="cts-title-sub">거래처명</div>
					<input class="cts-name" placeholder="거래처명을 조회하세요." disabled></input>
				
	                  <button id="modal_opne_btn1" class="p-regi-modal-bt">찾기</button>
				</div>
				<div class="p-regi-modal-bts">
	                  <button class="p-regi-modal-bt">등록</button>
	                  <button id="modal_close_btn_Cts_1" class="p-regi-modal-bt">취소</button>
	            </div>
			</div>
      </div>

      <div class="modal_layer"></div>
</div>
<script>
//프로젝트detail 거래처 등록 모달창
document.getElementById("modal_opne_btn_Cts_1").onclick = function() {
   document.getElementById("modal_Cts_1").style.display = "block";
}

document.getElementById("modal_close_btn_Cts_1").onclick = function() {
   document.getElementById("modal_Cts_1").style.display = "none";
}
</script>






<!-- 모달창-거래처 등록 (중복되는jsp) -->
<div id="modal_1">

      <div class="modal_content">
            <div class="flex" style="background-color: #153A66;">
                  <div class="navbar text-neutral-content modal-head">
                        <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                  </div>
            </div>

			<div class="cts-view">
				<div class="cts-title">
					<span>업체명</span>
				</div>
				<div class="cts-title-sub">* 등록된 업체를 조회합니다.</div>
				<div class="p-modal-serach">
					<select class="select select-bordered p-cts-select">
						  <option disabled selected>선택 </option>
						  <option>업체명</option>
						  <option>대표자명</option>
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
								<td>(주) 업체명써</td>
								<td>대표자명</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="p-regi-modal-bts">
	                  <button class="p-regi-modal-bt">등록</button>
	                  <button id="modal_close_btn1" class="p-regi-modal-bt">취소</button>
	            </div>
			</div>
      </div>

      <div class="modal_layer"></div>
</div>







<script src="/resource/js/modal.js" defer="defer"></script>
