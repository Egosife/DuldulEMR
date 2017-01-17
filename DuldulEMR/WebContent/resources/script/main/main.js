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
			$(".main_menu_btn_acti").attr('class','main_menu_btn');
			$(this).attr('class','main_menu_btn_acti');
			$(".menu_btnlist").hide("fast");
			$("#"+idarr[0]).show("fast");
		}else{
			$(".menu_btnlist").hide("fast");
			$(".main_menu_btn_acti").attr('class','main_menu_btn');
		}
	})//main_menu_btn click end
	
	$("body").on("click",".main_menu_btn_acti",function(){
		$(".menu_btnlist").hide("fast");
		$(".main_menu_btn_acti").attr('class','main_menu_btn');
	});
	
	//logout
	$("#logoff").on("click",function(){
		clearInterval(interval_time);//시간 인터발 종료
		location.href = "Logoff";
		alert("정상적으로 로그아웃 하셨습니다.");
	});//logoutBtn end
	
	//페이지 띄어주기
	$("body").on("click",".btnlist_btns",function(){
		Open_Tab(this);
	});
	
	//탭 내용 보기
	$("body").on("click",".tab_layout",function(){
		Bbs_Type(this);
		/*if($("#tab-close_"+$(this).attr('value')).css('display') == 'none'){*/
		
		/*$(".main_tab_now").attr('class','main_tab');
		var tablayoutid = "tab_"+ tab;
		$("#"+tablayoutid).attr('class','main_tab_now');*/
		
		if($("#tab_"+$(this).attr('value')).attr('class') == 'main_tab'){
			var tabId = $(this).attr('value');
			
			if(tabId == 'a') {
				View_Tab_Content($(this).attr('value'), function(){
					refreshListA();
				});
			} else {
				View_Tab_Content($(this).attr('value'));
			}
		}
	})//탭 내용 보기 end
	
	//탭 닫기
	$("body").on("click",".main_tab_close",function(){
		if($("#tab_"+$(this).attr('value')).attr('class') == 'main_tab_now'){
			Close_Tab(this);
		}else{
			Close_OtherTab(this);
		}
	})//탭 닫기 end

	//마우스 휠 클릭으로 탭 닫기
	$("body").on("mousedown",".tab_layout",function(e){
		if(e.which == 2){
			if($("#tab_"+$(this).attr('value')).attr('class') == 'main_tab_now'){
				Close_HTab($(this).attr('value'));
			}else{
				Close_OtherHTab($(this).attr('value'));
			}
		}
	})//탭 닫기 end
	
})//ready end



//게시판 타입 기억
function Bbs_Type(obj){
	var id = $(obj).attr('id').split("_");
	
	if(id[1] == 0){
		//console.log(id);
		switch (id[2]) {
		case "0":
			Bbstype_Setsession(id[2]);
			//console.log("공지이 클릭되다!");
			break;
		case "1":
			Bbstype_Setsession(id[2]);
			//console.log("사내이 클릭되다!");
			break;
		case "2":
			Bbstype_Setsession(id[2]);
			//console.log("통합이 클릭되다!");
			break;
		}
	}
}

//게시판 타입 기억2
function Bbs_Type_Val(val){
	var id = val.split("_");
	
	if(id[1] == 0){
		//console.log(id);
		switch (id[2]) {
		case "0":
			Bbstype_Setsession(id[2]);
			//console.log("공지이 클릭되다!");
			break;
		case "1":
			Bbstype_Setsession(id[2]);
			//console.log("사내이 클릭되다!");
			break;
		case "2":
			Bbstype_Setsession(id[2]);
			//console.log("통합이 클릭되다!");
			break;
		}
	}
}

//게시판 타입 세션에 기록
function Bbstype_Setsession(num){
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
			alert("Error - Bbs_1111");
		}
	})// ajax end
}

//탭 닫기
function Close_Tab(obj){
	var tab_id = "tab_"+$(obj).attr('tab');

	$("#"+tab_id).hide('fast',function(){
		$("#"+tab_id).remove();
	});
	$("#content_"+$(obj).attr('tab')).remove();

	var id = $("#main_content_page").children('div:first').attr("value");
	var val = $("#tab_bar").children('div:first').attr("value");
	if(val != null){
		Bbs_Type_Val(val);
	}
	
	View_Tab_Content(id);
}
//탭 닫기
function Close_HTab(value){
	var tab_id = "tab_"+value;
	
	$("#"+tab_id).hide('fast',function(){
		$("#"+tab_id).remove();
	});
	$("#content_"+value).remove();
	
	var id = $("#main_content_page").children('div:first').attr("value");
	var val = $("#tab_bar").children('div:first').attr("value");
	if(val != null){
		Bbs_Type_Val(val);
	}
	
	View_Tab_Content(id);
}
//탭 닫기
function Close_OtherTab(obj){
	var tab_id = "tab_"+$(obj).attr('tab');
	
	$("#"+tab_id).hide('fast',function(){
		$("#"+tab_id).remove();
	});
	$("#content_"+$(obj).attr('tab')).remove();
}
//탭 닫기
function Close_OtherHTab(value){
	var tab_id = "tab_"+value;
	
	$("#"+tab_id).hide('fast',function(){
		$("#"+tab_id).remove();
	});
	$("#content_"+value).remove();
}
//탭 닫기
function ReClose_Tab(obj,tab){
	var tab_id = "tab_"+tab;
	
	$("#content_"+tab).remove();
	//$("#"+tab_id).remove();
	
	var id = $("#main_content_page").children('div:first').attr("value");
	var val = $("#tab_bar").children('div:first').attr("value");
	if(val != null){
		Bbs_Type_Val(val);
	}
	
	//View_Tab_Content(id);
}

//탭  유무 체크
function Open_Tab(obj){
	var tab = $(obj).attr('tab').split("*");
	var useid = $(obj).attr('id');
	
	//생성된 탭이 없을 경우 생성해준다.
	var activated_check = $("#tab_"+tab[2]).length;
	
	if(activated_check <= 0){
		if(useid != null){
			Bbs_Type(obj);
		}
		Add_Tab(obj); //탭에 선택된 오브젝트 값 전송
	}else{
		if(useid != null){
			Bbs_Type(obj);
		}
		if($("#tab_"+tab[2]).attr('class') == 'main_tab'){
		View_Tab_Content(tab[2]);
		}
	}
}
//탭 오픈 시 새로고침
function ReOpen_Tab(obj){
	var tab = $(obj).attr('tab').split("*");
	var useid = $(obj).attr('id');
	
	//생성된 탭이 없을 경우 생성해준다.
	var activated_check = $("#tab_"+tab[2]).length;
	
	if(activated_check <= 0){
		if(useid != null){
			Bbs_Type(obj);
		}
		Add_Tab(obj); //탭에 선택된 오브젝트 값 전송
	}else{
		
		if(useid != null){
			Bbs_Type(obj);
		}
		ReClose_Tab(obj,tab[2]);
		ReAdd_Tab(obj); //탭에 선택된 오브젝트 값 전송
	}
}

//탭 추가
function ReAdd_Tab(obj){
	var tab = $(obj).attr('tab').split("*");
	var tab_id = "tab_"+tab[2];
	var tab_close = "tab-close_"+tab[2];
	var useid = $(obj).attr('id');
	if(useid != null){
		var id = $(obj).attr('id').split("_");
		if(id.length > 2){
			var tab_type = "tabM_"+id[1]+"_"+id[2];
			var tab_value = "tabV_"+id[1]+"_"+id[2];
		}else{
			var tab_type = "tabM_"+id[0];
			var tab_value = "tabV_"+id[0];
		}
	}else{
		var tab_type = "tabM_"+tab[2];
		var tab_value = "tabV_"+tab[2];
	}
	
/*	var html="";
	html += "<div class='main_tab' id='" +tab_id+"' value='"+tab_value+"'>";
	html += "<div class='tab_layout' id='"+tab_type+"' value='"+tab[2]+"'>";
	html += "<div class='tab_text' value='"+tab[2]+"'>"+tab[1]+"</div>";
	html += "</div>";
	html += "<div class='main_tab_close' id='"+tab_close+"' value='"+tab[2]+"' tab='"+tab[2]+"'></div>";
	html += "</div>";
	$("#tab_bar").append(html);*/
	
	html = "";
	html += "<div class='pages' id='content_"+tab[2]+"' value='"+tab[2]+"'></div>"
	$("#main_content_page").append(html);
	html = "";
	
	//$("#"+tab_id).css('display','none');
	//$("#"+tab_id).css('display','block');
	
	$("#content_"+tab[2]).load(tab[0]);
	
	ReView_Tab_Content(tab[2]);
}
//탭 추가
function Add_Tab(obj){
	var tab = $(obj).attr('tab').split("*");
	var tab_id = "tab_"+tab[2];
	var tab_close = "tab-close_"+tab[2];
	var useid = $(obj).attr('id');
	if(useid != null){
		var id = $(obj).attr('id').split("_");
		if(id.length > 2){
			var tab_type = "tabM_"+id[1]+"_"+id[2];
			var tab_value = "tabV_"+id[1]+"_"+id[2];
		}else{
			var tab_type = "tabM_"+id[0];
			var tab_value = "tabV_"+id[0];
		}
	}else{
		var tab_type = "tabM_"+tab[2];
		var tab_value = "tabV_"+tab[2];
	}
	
	var html="";
	html += "<div class='main_tab_now' id='" +tab_id+"' value='"+tab_value+"'>";
		html += "<div class='tab_layout' id='"+tab_type+"' value='"+tab[2]+"'>";
			html += "<div class='tab_text' value='"+tab[2]+"'>"+tab[1]+"</div>";
		html += "</div>";
		html += "<div class='main_tab_close' id='"+tab_close+"' value='"+tab[2]+"' tab='"+tab[2]+"'>X</div>";
	html += "</div>";
	$("#tab_bar").append(html);
	
	html = "";
	html += "<div class='pages' id='content_"+tab[2]+"' value='"+tab[2]+"'></div>"
	$("#main_content_page").append(html);
	html = "";
	
	$("#"+tab_id).css('display','none');
	$("#"+tab_id).show("fast");
	
	$("#content_"+tab[2]).load(tab[0]);
	
	View_Tab_Content(tab[2]);
}

//선택된 탭만 보이게 하기
function ReView_Tab_Content(tab){
	$(".main_tab_now").attr('class','main_tab');
	var tablayoutid = "tab_"+ tab;
	$("#"+tablayoutid).attr('class','main_tab_now');
	$(".pages").css('display','none');
	/*$(".main_tab_close").css('display','none');*/
	$("#content_"+tab).css('display','block');
	/*$("#tab-close_"+tab).css('display','block');*/
}

//선택된 탭만 보이게 하기
function View_Tab_Content(tab){
	$(".main_tab_now").attr('class','main_tab');
	var tablayoutid = "tab_"+ tab;
	$("#"+tablayoutid).attr('class','main_tab_now');
	$(".pages").css('display','none');
	/*$(".main_tab_close").css('display','none');*/
	$("#content_"+tab).fadeIn('fast');
	/*$("#tab-close_"+tab).fadeIn('slow');*/
}

//선택된 탭만 보이게 하기(새로고침)
function View_Tab_Content(tab, fnc){
	$(".main_tab_now").attr('class','main_tab');
	var tablayoutid = "tab_"+ tab;
	$("#"+tablayoutid).attr('class','main_tab_now');
	$(".pages").css('display','none');
	/*$(".main_tab_close").css('display','none');*/
	$("#content_"+tab).fadeIn('fast', fnc);
	/*$("#tab-close_"+tab).fadeIn('slow');*/
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