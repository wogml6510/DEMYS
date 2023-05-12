<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리까지 한번에 해결 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />

<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.5/dist/full.css" rel="stylesheet" type="text/css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


</head>
<style>
body {
   margin:0;
   padding:0;
   border:4.5px solid #153A66;
   width:100%;
   height:100vh;
}
</style>

<!-- 참여인력수정.css -->
<link rel="stylesheet" href="/resource/css/project/hr_modify.css" />

<body>
<!-- 참여인력 수정  -->

<div class="hr_detail">
        <div class="flex" style="background-color: #153A66;">
            <div class="navbar text-neutral-content openWindow-head">
                  <div class="openWindow-head-1">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
            </div>
      	</div>

		<div class="hr-modify-conts">
			<div class="hr-modify-title">
				<span>참여인력 수정</span>
			</div>
			<div class="hr-regi-detail">
				<div class="td-wrapper hr-modi-cont">
					<div class="hr-icon">
						<i class="fa-regular fa-file-image" style="font-size:210px;"></i>
					</div>
					<div class="hr-modi-conts">
						<div>✔ 바다표범 </div>
						<div>
							<div class="flex items-center justify-between w-full">
								<div class="">✔ 업무가뭐야</div>
								<select class="select w-60">
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
                  <button class="p-regi-modal-bt">수정</button>
                  <button onclick="CloseWindow();" class="p-regi-modal-bt">취소</button>
            </div>
		</div>
</div>
<script src="/resource/js/common.js" defer="defer"></script> 


</body>







