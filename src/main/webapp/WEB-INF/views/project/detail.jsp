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
		<div class=" p-main-body" id="p-main-bodys">
   			<div class="p-body-cont">
   				<div class="header-2-menu0">
	   				<div class="p-body-header-2">
		   				<div style="display:flex;margin-top:5px;height:25px;">
				   			<input type="hidden" name="PJ_NUM" value="${projects.PJ_NUM}" />
					         |<div class="header-2-menu" onclick="PJ_IMP_go();"><a href="#">프로젝트 정보</a></div> |
					         <div class="header-2-menu" onclick="pjhrList_go();"><a href="#">참여인력</a></div> |
					         <div class="header-2-menu"><a href="#">요구사항 관리</a></div> |
					      </div>
		   			</div>
	   			</div>
	   			
	   			<!-- 프로젝트정보 -->
	   			<div id="project_BODY" >
	   				<div class="p-info-detail">
	   					<div class="p-info-detail-title">
	   						<span style="font-weight:bold;">프로젝트 정보</span>
	   						<button id="P_Modify" class="p-info-detail-bt" onclick="PJ_MODIFY();">수정</button>
	   						<button id="P_Modify" style="display:none;" class="p-info-detail-bt" onclick="PJ_MODIFY_go();">수정하기</button>
	   					</div>
	   					<div class="p-detail-table">
	   						<table border="1" id="table_Pj_Detail">
	   							<tr>
	   								<td>프로젝트명</td>
	   								<td class="td-pj-name">${projects.PJ_NAME }</td>
	   							</tr>
	   							<tr>
	   								<td>프로젝트기간</td>
	   								<td class="td-pj-date">
	   									<span><fmt:formatDate value="${projects.PJ_STARTDATE }" pattern="yyyy-MM-dd"/></span>
	   									<span>~ <fmt:formatDate value="${projects.PJ_ENDDATE }" pattern="yyyy-MM-dd"/></span>
	   								</td>
	   							</tr>
	   							<tr class="pj-price td-pj-price">
	   								<td>예상 매출액</td>
	   								<td >${projects.PJ_PRICE }원</td>
	   							</tr>
	   							<tr class="td-m-name">
	   								<td>프로젝트 매니저</td>
	   								<td>${projects.MEMBER_NAME }</td>
	   							</tr>
	   							<tr class="td-pj-field">
	   								<td>프로젝트 사업구분</td>
	   								<td>${projects.PJ_FIELD }</td>
	   							</tr>
	   							<tr class="td-pj-type">
	   								<td>프로젝트 구분</td>
	   								<c:if test="${projects.PJ_TYPE eq 1}">
		   								<td>내부 프로젝트</td>
	   								</c:if>
	   								<c:if test="${projects.PJ_TYPE eq 2}">
		   								<td>외부 프로젝트</td>
	   								</c:if>
	   							</tr>
	   							<tr class="td-pj-content">
	   								<td>프로젝트 내용</td>
	   								<td>${projects.PJ_CONTENT }</td>
	   							</tr>
	   							<tr class="td-ct-name">
	   								<td>업체명</td>
	   								<td>${projects.CT_NAME }</td>
	   							</tr>
	   							<tr class="td-pj-git">
	   								<td>깃 주소</td>
	   								<td>${projects.PJ_GIT }</td>
	   							</tr>
	   						</table>
	   					</div>
	   				</div>
	   				<!-- 프로젝트정보 끝나는 태그 -->
	   				
	   				<!-- 프로젝트정보안에 거래처 화면 -->
	   				<input type="hidden" name="CT_TYPE" value="2" />
	   				<div id="pjctList_load">
	   					<div class="p-info-cts-title">
	   						<div>
		   						<span style="font-weight:bold;">총 거래처</span>
		   						<span style="font-weight:bold;color:blue;">${pjctListCount }</span>
	   						</div>
	   						<div>
	   							<button id="modal_opne_btn_Cts_1" class="p-info-detail-bt" onclick="ct_Regi();">등록</button>
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
   								<tbody id="pjct_list" style="height: 40px;overflow-y:auto;overflow-x:hidden;">
	   							<c:forEach var="pjctList" items="${pjctList }" varStatus="status">
		   						<input type="hidden" value="${pjctList.PJCT_NUM }" name="PJCT_NUM"/>	
								<tr id="remove_row_${status.index}">
 									<td>${status.index+1 }</td>
 									<td>${pjctList.CT_NAME }</td>
 									<td>${pjctList.CT_TEL }</td>
 									<td>${pjctList.CT_FAX }</td>
 									<td>${pjctList.CT_ADDR }</td>
 									<td>${pjctList.CT_MANAGER }</td>
 									<td>
 										<button id="remov_Btt" class="remove-btt" data-row-id="${status.index}" onclick="PJCT_REMOVE_go('${pjctList.PJCT_NUM}');">
 										<i class="fa-solid fa-circle-xmark" style="color:red;font-size:23px;padding-right:5px;"></i>
 										</button>
 									</td>
								</tr>
	   							</c:forEach>
	   							</tbody>
	   						</table>
	   						<!-- <div id="addPjctList"></div> -->
	   					</div>
	   				</div>
	   				<!-- 거래처화면 끝나는 태그 -->
	   			</div>
   			</div>
   		<!-- p-main-body끝나는 태그 -->
		</div>   
	<!-- project/phead.jsp (t-body) 화면 끝나는 태그 -->
	
	
<script>
function pjhrList_go(){
	var PJ_NUM = $('input[name="PJ_NUM"]').val();
	//alert(PJ_NUM);
	console.log(PJ_NUM);
	$.ajax({
		url: "PjNumhrList?PJ_NUM="+PJ_NUM,
		type: "get",
		dataType: "text",
		success: function(data){
			//alert("참여인력리스트");
			$("#project_BODY").html(data);
		},
		error: function (xhr, status, error) {
            // AJAX 요청이 실패했을 때 실행할 코드
            console.log(error);
        }
	});
}

function PJ_IMP_go(){
	var PJ_NUM = $('input[name="PJ_NUM"]').val();
	pj_detail(PJ_NUM);
}
</script>	
	
 <!-- 			
<script>


function PJ_MODIFY(){
	//var input_cnum = '<input id="c_num" type="hidden" value="'+CT_NUM +'" />';
	
	alert("dddd");
	
	var PJ_NAME = $(".td-pj-name").text();
	var PJ_NAME = $(".td-pj-date").text();
	var PJ_NAME = $(".").text();
	var PJ_NAME = $(".").text();
	var PJ_NAME = $(".").text();
	var PJ_NAME = $(".").text();
	var PJ_NAME = $(".").text();
	var PJ_NAME = $(".").text();
	var PJ_NAME = $(".").text();
	var PJ_NAME = $(".").text();
	
	console.log(PJ_NAME);
	var table_modify = $('#table_Pj_Detail tr td:last-child');
	table_modify.empty();
	
	var input_pjName = '<input style="border:1px solid black;" type="text" value="'+PJ_NAME+'" />';
	table_modify.append(input_pjName);
}
</script>  
	  -->




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
					<input id="ct-serch-name" class="cts-name" placeholder="거래처명을 조회하세요." disabled></input>
				
	                  <button id="modal_opne_btn1" class="p-regi-modal-bt" onclick="searchCONTACTS();">찾기</button>
				</div>
				<div class="p-regi-modal-bts">
	                  <button class="p-regi-modal-bt" onclick="PJCT_REGIST();">등록</button>
	                  <button id="modal_close_btn_Cts_1" class="p-regi-modal-bt">취소</button>
	            </div>
	            <!-- CONTACTS_NUM  -->
	   			<input id="c_number" type="hidden" name="CT_NUM" value=""/>
			</div>
      </div>

      <div class="modal_layer"></div>
</div>
<script>
function ct_Regi(){
	$("#modal_Cts_1").css('display',"block");
}
document.getElementById("modal_close_btn_Cts_1").onclick = function() {
   document.getElementById("modal_Cts_1").style.display = "none";
}
</script>
<!-- 모달창-업체명  -->
<div id="modal_1" class="modal_contacts_name">

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
				<div class="p-modal-serach select_contacts">
					<select class="select select-bordered p-cts-select " name="searchType" id="searchType">
						  <option disabled selected>선택 </option>
						  <option value="cn" ${searchType=='cn' ? "selected":"" }>업체명</option>
						  <option value="cc" ${searchType=='cc' ? "selected":"" }>대표자명</option>
					</select>
					<div class="p-modal-searchbar contacts-modal-searchbar">
						<input name="keyword" type="text" placeholder="검색어를 입력하세요." class="input input-bordered p-modal-searchbar-input" value="${keyword }"/>
						<i onclick="contacts_list_go();" class="fa-solid fa-magnifying-glass" style="font-size:30px;width:15%;display:flex;align-items: center;justify-content: space-around;"></i>
					</div>
				</div>
				<div class="cts-serch-list">
					<table id="contactsList_view" border="1">
						<!-- contactsList나오는곳 -->
					</table>
				</div>
				<div class="p-regi-modal-bts add_contacts_modal">
	                  <button class="p-regi-modal-bt" onclick="CONTACTS_S_REGI();">선택</button>
	                  <button id="modal_close_btn1" class="p-regi-modal-bt" onclick="CLOSE_MODAL_CT();">취소</button>
	                  <!-- CONTACTS NUM, CEO값 받을 공간 -->
                 	 <div class="add_contacts_id" ></div>
                 	 
	            </div>
			</div>
      </div>

      <div class="modal_layer"></div>
</div>
<script>
function searchCONTACTS(){
	$(".modal_contacts_name").css('display',"block");
 	$.ajax({
		url: "Search_Modal",
		type: "get",
		dataType:"json",
		success: function(data){
			var contactsList = data.contactsList;
			var table = $('#contactsList_view');
			table.empty();
			
			for(var i=0 ; i<contactsList.length; i++ ){
				var contacts = contactsList[i];
				if (contacts.ct_TYPE == 2){
					var row = '<tr data-contacts-num ="'+ contacts.ct_NUM +'"> <td>' + contacts.ct_NAME + '</td><td>' + contacts.ct_CEO + '</td></tr>';
					table.append(row);
				}
			}
			table.find('tr').click(function(){
				var CT_NUM = $(this).data('contacts-num');
				var CT_NAME = $(this).find('td:first-child').text();
				var CT_CEO = $(this).find('td:last-child').text();
				
				var input_cnum = '<input id="c_num" type="hidden" value="'+CT_NUM +'" />';
				var input_cname = '<input id="c_name" type="hidden" value="'+CT_NAME +'" />';

		 		var addContactsId = $('.add_contacts_id');

				if (addContactsId.length) {
					addContactsId.empty();
				}
				addContactsId.append(input_cnum);
				addContactsId.append(input_cname);
				
				table.find('tr>td:last-child').each(function(){
					if($(this).text() == CT_CEO){
						$(this).parent('tr').css('background-color', "#e7e7e7e7");
					}else{
						$(this).parent('tr').css('background-color', "#ffffff");
					}
				});
			});
		}
	});
}


// 업체Contacts조회
function contacts_list_go(){
	
	//alert("리스트 돋보기");
	var searchType = $('.select_contacts>select[name="searchType"]').val();
	var keyword = $('div.contacts-modal-searchbar>input[name="keyword"]').val();
	
	$.ajax({
		
		url: "regist_searchCONTACTS",
		type: "get",
		dataType:"json",
		data:{
			"searchType":searchType,
			"keyword": keyword
		},
		success: function(data){
			var contactsList = data.contactsList;
			var table = $('#contactsList_view');
			table.empty();
			
			for(var i=0 ; i<contactsList.length; i++ ){
				var contacts = contactsList[i];
				if (contacts.ct_TYPE == 2){
					var row = '<tr data-contacts-num ="'+ contacts.ct_NUM +'"> <td>' + contacts.ct_NAME + '</td><td>' + contacts.ct_CEO + '</td></tr>';
					table.append(row);
				}
			}
			table.find('tr').click(function(){
				var CT_NUM = $(this).data('contacts-num');
				var CT_NAME = $(this).find('td:first-child').text();
				var CT_CEO = $(this).find('td:last-child').text();
				
				var input_cnum = '<input id="c_num" type="hidden" value="'+CT_NUM +'" />';
				var input_cname = '<input id="c_name" type="hidden" value="'+CT_NAME +'" />';

		 		var addContactsId = $('.add_contacts_id');

				if (addContactsId.length) {
					addContactsId.empty();
				}
				addContactsId.append(input_cnum);
				addContactsId.append(input_cname);
				
				table.find('tr>td:last-child').each(function(){
					if($(this).text() == CT_CEO){
						$(this).parent('tr').css('background-color', "#e7e7e7e7");
					}else{
						$(this).parent('tr').css('background-color', "#ffffff");
					}
				});
			});
		}
	});
	
}
//조회화면에서 등록버튼(선택)
function CONTACTS_S_REGI(){	
	var CT_NAME = $('#c_name').val();
	//alert(CT_NAME);
	$('#ct-serch-name').val(CT_NAME);
	$(".modal_contacts_name").css('display', "none");
}
// 거래처등록모달_찾은후 등록하기버튼 (PJ_NUM값 필요, Project:현제 프로젝트에 거래처만 넣어야함)
// 등록시 필요한 값: PJCT_NUM(시퀀스), CT_TYPE=2, PJ_NUM, CT_NUM
function PJCT_REGIST(){
	var CT_NUM = $('#c_num').val();
	var PJ_NUM = $('input[name="PJ_NUM"]').val();
	var CT_TYPE = $('input[name="CT_TYPE"]').val();
	var data = {
			"ct_NUM":parseInt(CT_NUM),
			"pj_NUM":parseInt(PJ_NUM),
			"ct_TYPE":parseInt(CT_TYPE)
	}
	$.ajax({
   		url:"<%=request.getContextPath()%>/project/contacts_Regist",
   		type:"post",
   		dataType:"json",
   		contentType:"application/json",
   		data:JSON.stringify(data),
   		success: function(){
		     alert("진짜 등록완료인데..");
   		},
	    error:function(){
	    	alert("거래처등록이 완료되었습니다.");
	    	$('#ct-serch-name').val('');
	    	$('#modal_Cts_1').css('display', "none");
		    pj_detail(PJ_NUM);
	    }
   	});
	/* 	$.ajax({
			url:"Search_Modal",
			type:"get",
			dataType:"json",
			success: function(data){
				alert("거래처등록이 완료되었습니다.");
				$('#ct-serch-name').val(''); //조회화면에 들어간 value지우기
				//pj_detail(PJ_NUM);
				$('#modal_Cts_1').css('display', "none");
				
				
					var pjctList = data.contactsList;
				var numCount = parseInt($('#pjct_list tr:last-child td:first-child').text());
				numCount = numCount + 1;
				for(var i=0 ; i<pjctList.length; i++ ){
					var pjct = pjctList[i];
					if(pjct.ct_NUM == CT_NUM){
						var pjct_row = '<tr><td >' + numCount + '</td><td>'
							+pjct.ct_NAME+'</td><td>'
							+pjct.ct_TEL+ '</td><td>' 
							+pjct.ct_FAX+ '</td><td>' 
							+pjct.ct_ADDR+ '</td><td>' 
							+pjct.ct_MANAGER+ '</td>'
							+'<td><button><i class="fa-solid fa-circle-xmark" style="color:red;font-size:23px;padding-right:5px;"></i></button></td></tr>';
						var addPJCT_list = $("#pjct_list");
						addPJCT_list.append(pjct_row);
					}
				}
			}
		}); */
} 

function PJCT_REMOVE_go(PJCT_PK){
	/* var PJCT_NUM = PJCT_PK;
	
	console.log(PJCT_NUM); */
	var PJ_NUM = $('input[name="PJ_NUM"]').val();
	//var PJ_NUM = PJ_PK;
	//alert(PJ_NUM);
	var data = {'PJCT_NUM':parseInt(PJCT_PK) }
	$.ajax({
		url:"pjct_Remove",
		type:"post",
		data:data,
		success: function(){
			alert("삭제가 완료되었습니다.");
			pj_detail(PJ_NUM);
		},
		error:function(){
			alert("서버상에 오류로 삭제되지 못하였습니다.");
     	}
	});

}
function CLOSE_MODAL_CT(){
	$(".modal_contacts_name").css('display', "none");
}

</script>





