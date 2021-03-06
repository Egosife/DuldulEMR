/**
 * 2016-11-29 이동건 생성
 */

$(document).ready(function(){
	$(".message a").click(function(){
		   $("form").animate({height: "toggle", opacity: "toggle"}, "slow");
		});
	
	//쿠키에 담긴 값 적용
	$("#hos_Code").attr('value',getCookie("hos_ck"));
	$("#emp_id").attr('value',getCookie("id_ck"));
	$("input:checkbox[id='re_hos']").prop("checked", getCookie("re_hos_ck"));
	$("input:checkbox[id='re_id']").prop("checked", getCookie("re_id_ck"));
	
	//엔터키 누를 시 로그인 발동
	$("body").on("keydown",function(e){
		if(e.which == 13){
			logon();
			return false;
		}
	});
	
	//로그인 클릭시...
	$("#loginbtn").on("click",function(){
		logon();
		return false;
	})//loginbtn click
})//ready end

// 로그인
function logon(){
	// *trim = 공백 제거
	if($.trim($("#hos_Code").val()) == ""){
		alert("병원코드가 필요합니다.");
		$("#hos_Code").focus(); //hos_Code로 포커스를 옮긴다.
	}// 병원코드 입력 체크
	else if($.trim($("#emp_id").val()) == ""){
		alert("아이디를 입력해 주세요.");
		$("#emp_id").focus(); //emp_id로 포커스를 옮긴다.
	}// 아이디 입력 체크
	else if($.trim($("#passwd").val()) == ""){
		alert("비밀번호를 입력해 주세요.");
		$("#passwd").focus(); //passwd로 포커스를 옮긴다.
	}// 비번 입력 체크
	else{ // 입력이 확인 되었을 때 작동
	
		//체크박스 체크 여부 체크
		if ($('#re_hos').is(":checked")) {
		    $('input[name=re_hos]').val("1");
		} else {
		    $('input[name=re_hos]').val("");
		}
		if ($('#re_id').is(":checked")) {
		    $('input[name=re_id]').val("1");
		} else {
		    $('input[name=re_id]').val("");
		}
	
		var params = $("#loginForm").serialize();
		$.ajax({
			type : "post",
			url : "LoginCheckAjax",
			dataType : "json",
			data : params,
			success : function(result){
				console.log(result.res);
				if(result.res == "deactivated"){
					alert("사용이 정지된 계정입니다. 관리자에게 문의하세요.");
				}else{
					if(result.res == "success"){
						//쿠키 생성
						if(result.hos_code != "none"){
							setCookie("hos_ck",result.hos_code,7);
							setCookie("re_hos_ck",result.re_hos_chk,7);
						}else{
							setCookie("hos_ck",result.hos_code,-1);
							setCookie("re_hos_ck",result.re_hos_chk,-1);
						}
						if(result.id_code != "none"){
							setCookie("id_ck",result.id_code,7);
							setCookie("re_id_ck",result.re_hos_chk,7);
						}else{
							setCookie("id_ck",result.id_code,-1);
							setCookie("re_id_ck",result.re_hos_chk,-1);
						}
						//페이지 이동
						location.href = "emrmain";
					} else {
						alert("병원코드나 아이디 또는 비밀번호를 확인해주세요.");
						$("#hos_Code").focus();
					}
				}
			},

			error: function(result) {
				alert("EMR - Login Error");
			}
		})// ajax end
	}
}//로그인 end

// 쿠키 생성
function setCookie(cName, cValue, cDay){
    var expire = new Date();
    expire.setDate(expire.getDate() + cDay);
    cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
    if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
    document.cookie = cookies;
}
// 쿠키 가져오기
function getCookie(cName) {
    cName = cName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cName);
    var cValue = '';
    if(start != -1){
        start += cName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cValue = cookieData.substring(start, end);
    }
    return unescape(cValue);
}