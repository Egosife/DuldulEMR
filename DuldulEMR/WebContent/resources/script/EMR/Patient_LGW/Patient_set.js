/* 2016-11-25 이관우 개발 
		12-12  전체 수정 
		   13  개발완료 */

//환자일정

$(document).ready(function(){
	Set_list(); //function Set_list()를 불러옴
	Selectsort_type(); //진료과 셀렉트 값
	Calendar_Select(); //달력
	
	$("body").on("keydown",function(e){ //엔터키로 검색을 눌렀을 때
		if(e.which == 13){
			Ssearch();
		}
	});
	
	$("#S_search_Btn").on("click", function(){ //검색을 클릭 했을시
		Ssearch();
	});
	
	$("#check").on("click", function(){ //조회를 클릭 했을시
		Ssearch();
	});
	
	$("#S").on("click", "tr", function(){ //환자일정 표에서 환자를 눌렀을시
		Open_Tab(this);
	});
	
	$("#pagingS").on("click", "span", function(){ //리스트 버른을 눌렀을시
		$("input[name='Set_page']").val($(this).attr("name"));
		Set_list();
	});
	
	$("#Setlist_Btn").on("click", function(){ //목록보기
		//$("input[name='S_search_Text1']").val("");
		//$("input[name='Set_page']").val("1");
		//Set_list();
		ReOpen_Tab(this);
	});
	
 	$("#Tselect_box2").on("change",function(){ //진료의사 셀렉트 값
 		//console.log($("#treatsort_type option:selected").val());
 		$("#Select_doc").attr('value',$("#Tselect_box2 option:selected").val())
 		
 		var papamama = $("#act_S").serialize();
 		
 		$.ajax({
 			type : "post",
 			url : "get_Selectdoc",
			dataType : "json",
			data : papamama,
 			success : function(result){
 				var Sdoc = "";
 				
 				for(var i = 0; i < result.good_doctor.length; i++){
 					Sdoc += "<option value='";
 					Sdoc += result.good_doctor[i].EMP_NUM;
 					if(i == 0){
 						Sdoc += "'selected>";
 						Sdoc += result.good_doctor[i].EMP_NAME;
 						Sdoc += "</option>";
 					}else{
 						Sdoc += "'>";
 						Sdoc += result.good_doctor[i].EMP_NAME;
 						Sdoc += "</option>";
 					}
 				}
 				$("#Tselect_box3").html(Sdoc);
 				
 				Sdoc="";
 			},
 			error : function(result){
 				alert("Error - Patient_set_7040");
 			}
 		})// ajax end 
	})//treatsort_type end
});

function Set_list() {
	var parigee = $("#act_S").serialize();
	
	$.ajax({ //ajax 컨트롤러 만들어야함
		type : "post",
		url : "Set_list_page",
		dataType : "json",
		data : parigee,
		success : function(result) {
			var SL = ""; /* 메타 : Set_list 영문명 */
			
			for(var i = 0; i < result.list.length; i++) {
				SL += "<tr class='Set_table_tr' tab='treatment?PATINUM=" + result.list[i].PATIENT_NUM + "&TREATNUM=" + result.list[i].TREAT_NUM + "*진료실시입력*treatment'>";
				SL += "<td>" + result.list[i].NO + "</td>"; /* 번호 */
				SL += "<td>" + result.list[i].PATIENT_NUM + "</td>"; /* 환자번호 */
				SL += "<td>" + result.list[i].APPOINTMENT_TIME + "</td>"; /* 예약시간 수정 */
				SL += "<td>" + result.list[i].TAKE_TIME + "</td>"; /* 접수시간 수정 */
				SL += "<td>" + result.list[i].PATIENT_NAME + "</td>"; /* 환자명 */
				SL += "<td>" + result.list[i].OFFICE + "</td>"; /* 진료과 */
				SL += "<td>" + result.list[i].EMP_NAME + "</td>"; /* 진료의사 */
				SL += "<td>" + result.list[i].SORT_TYPE + "</td>"; /* 구분 */
				SL += "<td>" + result.list[i].TAKE_DATE + "</td>"; /* 접수날짜 */
				SL += "<td>" + result.list[i].CONDITION + "</td>"; /* 진료상태 */
				SL += "<td style='text-align: left;'>" + result.list[i].ETC + "</td>"; /* 비고 */
				SL += "</tr>";
			}
			$("#S").html(SL);
			
			SL = "";
			
			SL += "<span class='page_btn_box' name='1'><<</span>";
			
			if($("input[name='Set_page']").val() == 1) {
				SL += "<span class='page_btn_box' name='1'><</span>";
			} else {
				SL += "<span class='page_btn_box' name='" + ($("input[name='Set_page']").val() -1) + "'><</span>";
			}
			
			for(var i = result.pb.startPcount; i <= result.pb.endPcount; i++) {
				if(i == $("input[name='Set_page']").val()) {
					SL += "<span class='page_btn_box_now' name='" + i + "'><b>" + i + "</b></span>";
				} else {
					SL += "<span class='page_btn_box' name='" + i + "'>" + i + "</span>";
				}
			}
			
			if($("input[name='Set_page']").val() == result.pb.maxPcount) {
				SL += "<span class='page_btn_box' name='" + result.pb.maxPcount + "'>></span>";
			} else {
				SL += "<span class='page_btn_box' name='" + ($("input[name='Set_page']").val() * 1 + 1) + "'>></span>";
			}
			
			SL +="<span class='page_btn_box' name='"+result.pb.maxPcount+"'>>></span>";
			
			$("#pagingS").html(SL);
		},
		error : function(result) {
			alert("Error - Patient_set_7041");
		}
	});
}

function Ssearch() { //환자일정 검색
	$("input[name='S_search_Text1']").val($("#S_search_Text1").val());
	$("input[name='Set_page']").val("1");
	$("input[name='selSet_b']").val($("select[name='selSet_b']").val());
	Set_list();
};

function Selectsort_type(){ //진료과 셀렉트 값
	$.ajax({
		type : "post",
		url : "get_Selectsort",
		success : function(result){
			var St = "";
			
			St += "<option value='' selected>선택</option>"
			for(var i = 0; i < result.Stbox.length; i++){
				St += "<option value='";
				St += result.Stbox[i].SMALL;
				St += "' >";
				St += result.Stbox[i].CODE_NAME;
				St += "</option>";
			}
			$("#Tselect_box2").html(St);
			
			St = "";
		},
		error : function(result){
			alert("Error - Patient_set_7042");
		}
	})// ajax end	
};

function Calendar_Select(){ //달력
	$("#calendar").datepicker({
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
		}
	});
}