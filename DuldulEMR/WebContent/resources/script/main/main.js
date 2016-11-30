/**
 * 161122 이동건 - 메뉴 버튼 작동
 * 161125 이동건 - 시간관련 함수 추가
 * 161128 이동건 - 탭 기능 구현
 */

$(document).ready(function(){
	NowTime();//시간 인터발 시작
	
	//메뉴 보이기, 숨기기
	$("body").on("click",".main_menu_btn",function(){
		var idarr = this.id.split('_');
		if($("#"+idarr[0]).css('display') == 'none'){
			$("#"+idarr[0]).css('display','block');
		}else{
			$("#"+idarr[0]).css('display','none');
		}
	})//main_menu_btn click end
		
	//logout
	$("#logoff").on("click",function(){
		clearInterval(interval_time);//시간 인터발 종료
		location.href = "Logoff";
		alert("정상적으로 로그아웃 하셨습니다.");
	});//logoutBtn end
	
	//페이지 띄어주기
	$("body").on("click",".btnlist_btns",function(){
		//console.log(this);
		//console.log($(this).attr('value'));
		var val = $(this).attr('value').split("*");
		
		//생성된 탭이 없을 경우 생성해준다.
		var activated_check = $("#tab_"+val[0]).length;
		if(activated_check <= 0){
			bbs_type(this);
			Add_Tab(this); //탭에 선택된 오브젝트 값 전송
		}else{
			bbs_type(this);
			View_Tab_Content(val[0]);
		}
			
	});
	
	//탭 내용 보기
	$("body").on("click",".tab_layout",function(){
		bbs_type(this);
		View_Tab_Content($(this).attr('value'));
	})//탭 내용 보기 end
	
	//탭 닫기
	$("body").on("click",".main_tab_close",function(){

		$("#content_"+$(this).attr('value')).remove();
		$("#tab_"+$(this).attr('value')).remove();
		var id = $("#main_content_page").children('div:first').attr("value");
		View_Tab_Content(id);
	})//탭 닫기 end
	
})//ready end

//게시판 타입 기억
function bbs_type(obj){
	var id = $(obj).attr('id').split("_");
	
	if(id[1] == 0){
		//console.log(id);
		switch (id[2]) {
		case "0":
			bbstype_setsession(id[2]);
			//console.log("공지이 클릭되다!");
			break;
		case "1":
			bbstype_setsession(id[2]);
			//console.log("사내이 클릭되다!");
			break;
		case "2":
			bbstype_setsession(id[2]);
			//console.log("통합이 클릭되다!");
			break;
		}
	}
}
//게시판 타입 세션에 기록
function bbstype_setsession(num){
	//console.log(num+"이 들어왔다");
	var params = "type="+num
	$.ajax({
		type : "post",
		url : "BbsCheckAjax",
		dataType : "json",
		data : params,
		success : function(result){
		},
		error : function(result){
			alert("ERROR - Bbs");
		}
	})// ajax end
}

//탭 추가
function Add_Tab(obj){
	//console.log(obj);
	var val = $(obj).attr('value').split("*");
	var id = $(obj).attr('id').split("_");
	var tab_id = "tab_"+val[0];
	var tab_type = "tabM_"+id[1]+"_"+id[2]
	var tab_close = "tab-close_"+val[0];
	
	var html="";
	html += "<div class='main_tab' id='" +tab_id+ "' value='"+val[0]+"'>";
		html += "<div class='tab_layout' id='"+tab_type+"' value='"+val[0]+"'>";
			html += "<div class='tab_text' value='"+val[0]+"'>"+val[1]+"</div>";
		html += "</div>";
		html += "<div class='main_tab_close' id='"+tab_close+"' value='"+val[0]+"'></div>";
	html += "</div>";
	$("#tab_bar").append(html);
	
	html = "";
	html += "<div class='pages' id='content_"+val[0]+"' value='"+val[0]+"'></div>"
	$("#main_content_page").append(html);
	html = "";
	
	$("#content_"+val[0]).load(val[0]);
	
	View_Tab_Content(val[0]);
}

//선택된 탭만 보이게 하기
function View_Tab_Content(id){
	$(".pages").css('display','none');
	$(".main_tab_close").css('display','none');
	$("#content_"+id).css('display','block');
	$("#tab-close_"+id).css('display','block');
}


//현재 시간
function NowTime(){
	var date = new Date();
	var day = "";
	var Minutes = "";
	
	//요일 필터링
	switch (date.getDay()) {
	case 0:	day = "일";
		break;
	case 1:	day = "월";
		break;
	case 2:	day = "화";
		break;
	case 3:	day = "수";
		break;
	case 4:	day = "목";
		break;
	case 5:	day = "금";
		break;
	case 6:	day = "토";
		break;
	}
	
	//분 필터링
	if(date.getMinutes() < 10){
		Minutes = "0"+date.getMinutes();
	}else{
		Minutes = date.getMinutes();
	}
	
	//현재(초기) 시간 출력
	var nowTime = "";
	nowTime += date.getFullYear()+"년 "+(date.getMonth()+1)+"월 "+date.getDate()+"일";
	nowTime += "<br/>";
	nowTime += day+"요일 "+date.getHours()+" : "+Minutes;
	$("#nowtime").html(nowTime);

	//이후 시간변화를 담당하는 인터발
	interval_time = setInterval(Interval_Time, 1000);
}

//시간 인터발
function Interval_Time(){
	var date = new Date();
	var day = "";
	var Minutes = "";
	
	//요일 필터링
	switch (date.getDay()) {
	case 0:	day = "일";
		break;
	case 1:	day = "월";
		break;
	case 2:	day = "화";
		break;
	case 3:	day = "수";
		break;
	case 4:	day = "목";
		break;
	case 5:	day = "금";
		break;
	case 6:	day = "토";
		break;
	}
	
	//분 필터링
	var Minutes = "";
	if(date.getMinutes() < 10){
		Minutes = "0"+date.getMinutes();
	}else{
		Minutes = date.getMinutes();
	}
	
	var interDate = "";
	interDate += date.getFullYear()+"년 "+(date.getMonth()+1)+"월 "+date.getDate()+"일";
	interDate += "<br/>";
	interDate += day+"요일 "+date.getHours()+" : "+Minutes;
	$("#nowtime").html(interDate);
}