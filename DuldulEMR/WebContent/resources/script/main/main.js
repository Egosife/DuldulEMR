/**
 * 161122 이동건 - 메뉴 버튼 작동
 * 161125 이동건 - 시간관련 함수 추가
 */

$(document).ready(function(){
	NowTime();//시간 인터발 시작
	
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
		alert("정상적으로 로그아웃 하셨습니다.");
		clearInterval(interval_time);//시간 인터발 종료
		location.href = "Logoff";
	});//logoutBtn end
	
	//페이지 띄어주기
	$("body").on("click",".btnlist_btns",function(){
		//console.log(this);
		//console.log($(this).attr('value'));
		add_tab(this); //탭에 선택된 오브젝트 값 전송
		var val = $(this).attr('value').split("*");
		$("#main_content_page").load(val[0]);
	});
	
	//탭 닫기
	$("body").on("click",".main_tab_close",function(){
		console.log($(this).attr('value'));
		$("#tab_"+$(this).attr('value')).remove();
		$("#main_content_page").load("clear");
	})
	
})//ready end


//탭 추가
function add_tab(obj){
	//console.log(obj);
	var val = $(obj).attr('value').split("*");
	var id = $(obj).attr('id').split("_");
	var tab_id = "tab_"+id[1]+"_"+id[2];
	var tab_close = id[1]+"_"+id[2];
	
	var html="";
	html += "<div class='main_tab' id='" +tab_id+ "'>";
		html += "<div class='tab_layout'>";
			html += "<div class='main_tab_close' value='"+tab_close+"'></div>";
		html += "</div>";
		html += "<div class='tab_layout'>";
			html += "<div class='tab_text'>"+val[1]+"</div>";
		html += "</div>";
	html += "</div>";
	$("#tab_bar").append(html);
	html = "";
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