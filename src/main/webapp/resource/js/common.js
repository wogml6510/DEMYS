//팝업창들 띄우기
//새로운 Window창을 Open할 경우 사용하는 함수 ( arg: 주소, 창타이틀, 넓이, 길이 )
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
	winleft = (screen.width - WinWidth) / 2 ;
	wintop = (screen.height - WinHeight) / 2 ;
	var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth
							+ ",height="+WinHeight + ",top="+wintop+",left="
							+ winleft + ",resizable=yes");
	win.focus();
}
//팝업창 닫기
function CloseWindow(){
	window.opener.location.reload(true);
	window.close();
}

// 페이지네이션 + 조회
function list_go(page,url){
	if(!url) url="main";
	
	$("form#searchForm input[name='page']").val(page);
	$("form#searchForm input[name='searchType']").val($('select[name="searchType"]').val());
	$("form#searchForm input[name='keyword']").val($('div.p-searchbar>input[name="keyword"]').val());
	
	console.log($('select[name="searchType"]').val());
	
	$('form#searchForm').attr({
		action:url,
		method:'get'
	}).submit();
}
