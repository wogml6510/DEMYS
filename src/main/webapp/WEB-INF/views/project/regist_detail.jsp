<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/resource/css/project/regist_detail.css" />
<link rel="stylesheet" href="/resource/css/project/contacts_modal.css" />

<div class="p-body-header">
	 	 	
	   <!-- project작업공간 -->
		<div class="p-main-body">
   			
   			<div class="p-regist-view">
   				<div class="p-regi">
   					<span class="p-regi_1">프로젝트 등록</span>
   					<span class="p-regi_2">신규 프로젝트를 등록하세요.</span>
   				</div>
   				<div class="p-regi-2">
   					<div class="p-regi-made">
   						Step1. 프로젝트 만들기
   						<i class="fa-regular fa-circle-right"></i>
   					</div>
   					<div class="p-regi-detail">
   						Step2. 상세정보 등록
   						<i class="fa-regular fa-circle-right"></i>
   					</div>
   				</div>
   				<span style="font-weight:bold;">* 프로젝트 정보를 입력하세요.</span>
   				<div class="p-detail-select">
   					<table style="width:100%;">
	   					<tr>
	   						<td>프로젝트명</td>
	   						<td><input type="text" value="${projects.PJ_NAME }" placeholder="프로젝트명을 입력하세요." class="input input-bordered p-reg-input" /></td>
	   					</tr>
	   					<tr>
	   						<td>프로젝트 기간</td>
	   						<td style="display:flex;flex-direction:row;width:60%;" >
	   							<div>
	   								<input type="date" value="${projects.PJ_STARTDATE }"/>
	   							</div>
	   							<span>&nbsp;~&nbsp;</span>
	   							<div>
	   								<input type="date" value="${projects.PJ_ENDDATE }" />
	   							</div>
	   						</td>
	   					</tr>
	   					<tr>
	   						<td>프로젝트 내용</td>
	   						<td><input type="text" value="${projects.PJ_CONTENT }" placeholder="프로젝트내용을 입력하세요." class="input input-bordered p-reg-input" /></td>
	   					</tr>
	   					<tr>
	   						<td>프로젝트 중요도</td>
	   						<td>
	   							<select id="pj-type-option" class="select select-bordered p-reg-select">
								  <option disabled selected>선택</option>
								  <option value="3" ${projects.PJ_TYPE == '3' ? "selected":""} style="color:red;">&#xf024; 매우 중요</option>
								  <option value="2" ${projects.PJ_TYPE == '2' ? "selected":""} style="color:#F59A23;">&#xf024; 중요</option>
								  <option value="1" ${projects.PJ_TYPE == '1' ? "selected":""} style="color:#FFFF00;">&#xf024; 보통</option>
								</select>
	   						</td>
	   					</tr>
	   					<tr>
	   						<td>프로젝트 사업구분</td>
	   						<td>
	   							<select class="select select-bordered p-reg-select">
								  <option disabled selected>선택 </option>
								  <option value="교육" ${projects.PJ_FIELD == '교육' ? "selected":""} >교 &nbsp; 육</option>
								  <option value="건설" ${projects.PJ_FIELD == '건설' ? "selected":""}>건 &nbsp; 설</option>
								  <option value="제조" ${projects.PJ_FIELD == '제조' ? "selected":""}>제 &nbsp; 조</option>
								  <option value="물류" ${projects.PJ_FIELD == '물류' ? "selected":""}>물 &nbsp; 류</option>
								  <option value="공공" ${projects.PJ_FIELD == '공공' ? "selected":""}>공 &nbsp; 공</option>
								  <option value="금융" ${projects.PJ_FIELD == '금융' ? "selected":""}>금 &nbsp; 융</option>
								  <option value="기타" ${projects.PJ_FIELD == '기타' ? "selected":""}>기 &nbsp; 타</option>
								</select>
	   						</td>
	   					</tr>
	   					<tr>
	   						<td>예상매출액</td>
	   						<td><input type="text" value="${projects.PJ_PRICE }" placeholder="예상매출액을 입력하세요." class="input input-bordered p-reg-input" /></td>
	   					</tr>
	   					<tr >
	   						<td>업체명</td>
	   						<td><input type="text" value="" disabled placeholder="업체명을 입력하세요." class="input input-bordered p-reg-input" /></td>
	   						<td><div ><button id="modal_opne_btn1" class="p-type-bt-0"> 찾기 </button></div> </td>
	   					</tr>
	   					<tr>
	   						<td>프로제트 매니저</td>
	   						<td><input id="m_name" type="text" value="" disabled placeholder="프로젝트매니저를 입력하세요." class="input input-bordered p-reg-input" /></td>
	   						<td><div ><button id="modal_opne_btn2" class="p-type-bt-0" onclick="javascript:searchMEMBER_NAME();"> 찾기 </button></div> </td>
	   					</tr>
	   					<tr>
	   						<td class="p-git">
	   							<span>깃 주소</span>
	   							<div class="form-control ml-20">
								  <label class="label cursor-pointer">
								    <input type="checkbox" checked="checked" class="checkbox checkbox-primary" value="${projects.PJ_GIT}"/>
								    <span class="label-text ml-2">미 정</span> 
								  </label>
								</div>
	   						</td>
	   						<td><input type="text" placeholder="깃주소를 입력하세요." class="input input-bordered p-reg-input" /></td>
	   					</tr>
	   				</table>
   				</div>
   				<div class="p-type-bt">
   					<button class="p-type-bt-1">이전</button>
   					<button class="p-type-bt-1">등록</button>
   				</div>
   				
   			</div>
   
   		<!-- p-main-body끝나는 태그 -->
		</div>   
	<!-- project/phead.jsp (t-body) 화면 끝나는 태그 -->
	</div>

<!-- 모달창-업체명  -->
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
 <!-- 모달창-프로젝트메니저  -->
    <div id="modal_2" class="modal_member_name">

      <div class="modal_content">
            <div class="flex" style="background-color: #153A66;">
                  <div class="navbar text-neutral-content modal-head">
                        <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                  </div>
            </div>

			<div class="cts-view">
				<div class="cts-title">
					<span>프로젝트 매니저</span>
				</div>
				<div class="cts-title-sub">* 담당매니저를 선택하세요.</div>
				<div class="p-modal-serach select_member">
					<select class="select select-bordered p-cts-select" name="searchType" id="searchType">
						  <option disabled selected>선택 </option>
						  <option value="mn" ${searchType=='mn' ? "selected":"" }>매니저명</option>
						  <option value="md" ${searchType=='md' ? "selected":"" }>담당부서</option>
					</select>
					<div class="p-modal-searchbar">
						<input name="keyword" type="text" placeholder="검색어를 입력하세요." class="input input-bordered p-modal-searchbar-input" value="${keyword }"/>
						<i onclick="member_list_go();" class="fa-solid fa-magnifying-glass" style="font-size:30px;width:15%;display:flex;align-items: center;justify-content: space-around;"></i>
					</div>
				</div>
				<div class="cts-serch-list">
					<table id="memberList_view" border="1">
						<!-- memberList나오는 위치 -->
					</table>
				</div>
				<div class="p-regi-modal-bts">
	                  <button class="p-regi-modal-bt" onclick="MEMBER_S_REGI();">등록</button>
	                  <button id="modal_close_btn2" class="p-regi-modal-bt" onclick="CLOSE_MODAL();">취소</button>
	            </div>
			</div>
      </div>

      <div class="modal_layer"></div>
</div>

<script>
function searchMEMBER_NAME(){
	
	$(".modal_member_name").css('display',"block");
	$.ajax({
		url: "regist_detail",
		type: "get",
		dataType:"json",
		success: function(data){
			var memberList = data.memberList;
			var table = $('#memberList_view');
			table.empty();
			//console.log(data);
			for(var i=0 ; i<memberList.length; i++ ){
				var member = memberList[i];
				var row = '<tr><td>' + member.member_NAME + '</td><td>' + member.member_DEP + '</td></tr>';
				table.append(row);
			}
		}
	}); 
}

//조회
function member_list_go(){
	
	//alert("리스트 돋보기");
	var searchType = $('.select_member>select[name="searchType"]').val();
	var keyword = $('div.p-modal-searchbar>input[name="keyword"]').val();
	
	$.ajax({
		//alert("리스트 ajax");
		url: "regist_searchMEMBER",
		type: "get",
		dataType:"json",
		data:{
			"searchType":searchType,
			"keyword": keyword
		},
		success: function(data){
			var memberList = data.memberList;
			var table = $('#memberList_view');
			table.empty();
			
			for(var i=0 ; i<memberList.length; i++ ){
				var member = memberList[i];
				var row = '<tr data-member-num ="'+ member.member_NUM +'"> <td>' + member.member_NAME + '</td><td>' + member.member_DEP + '</td></tr>';
				table.append(row);
			}
			
			table.find('tr').click(function(){
				var MEMBER_NAME = $(this).find('td:first-child').text();
				var MEMBER_NUM = $(this).data('member-num');
				MEMBER_S_REGI(MEMBER_NAME, MEMBER_NUM);
				
				table.find('tr>td:first-child').each(function(){
					if($(this).text() == MEMBER_NAME){
						$(this).parent('tr').css('background-color', "#e7e7e7e7");
					}else{
						$(this).parent('tr').css('background-color', "#ffffff");
					}
				});
				//alert(MEMBER_NAME);
			});
		}
	});
	
}

function MEMBER_S_REGI(MEMBER_NAME, MEMBER_NUM){
	alert("MEMBER_S_REGI값넘어옴");
	console.log(MEMBER_NAME);
	console.log(MEMBER_NUM);
	//$('#m_name>input').val('');
	$('#m_name').val(MEMBER_NUM);
	$('#m_name').attr('placeholder', MEMBER_NAME);
	
	
	
	
	$(".modal_member_name").css('display', "none");
}

function CLOSE_MODAL(){
	$(".modal_member_name").css('display', "none");
}

</script>
 <!-- 모달창  -->
<!-- <script src="/resource/js/modal.js" defer="defer"></script> -->
