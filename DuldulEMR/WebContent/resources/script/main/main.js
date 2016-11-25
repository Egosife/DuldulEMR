/**
 * 161122 이동건 - 메뉴 버튼 작동
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
		clearInterval(time_interval);//시간 인터발 종료
		location.href = "Logoff";
	});//logoutBtn end
	
})//ready end

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