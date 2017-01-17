/** 2016-11-22 이관우 개발
	   	    23 - ajax부분 수정
		    30 - JSP부분 수정
		 12-01 - JSP개발 완료 
		 	05 - 키 이벤트 추가, 혈액형 수정**/

//환자조회

$(document).ready(function(){
	patient_list(); //function patient_list()를 불러옴
	
	$("body").on("keydown", function(n){ //엔터키로 검색을 눌렀을 때
		if(n.which == 13){
			p_search();
		}
	});
	
	$("#search_Btn").on("click", function(){ //검색을 클릭 했을시
		p_search();
	});
	
	$("#Pat_Btn").on("click", function(){ //환자 등록 눌렀을시
		//$("#act").attr("action", "Sign_up");
		//$("#act").submit();
		Open_Tab(this);
	});
	
	$("#pagingP").on("click", "span", function(){ //리스트 버튼을 눌렀을시
		$("input[name='Pat_page']").val($(this).attr("name"));
		patient_list();
	});
	
	$("#P").on("click", "tr", function(){ //환자표에서 환자를 눌렀을시
		//$("input[name='text_p']").val($(this).attr("name"));
		//$("#act").attr("action", "Details");
		//$("#act").submit();
		ReOpen_Tab(this);
	});
	
	$("#Patlist_Btn").on("click", function(){ //목록보기
		$("input[name='search_Text1']").val("");
		$("input[name='Pat_page']").val("1");
		patient_list();
	});
});

function patient_list() {
	var parasol = $("#act").serialize();
	
	$.ajax({
		type : "post",
		url : "Pat_list",
		dataType : "json",
		data : parasol,
		success : function(result) {
			var PL = ""; /* 메타 : page_list 영문명 */
			
			for(var i = 0; i < result.list.length; i++) {
				PL += "<tr class='p_table_tr' name='" + result.list[i].PATIENT_NUM + "'tab='Details?pizza=" + result.list[i].PATIENT_NUM + "*환자 상세조회*Details'>";
				PL += "<td>" + result.list[i].NO + "</td>"; /* 번호 */
				PL += "<td>" + result.list[i].PATIENT_NUM + "</td>"; /* 환자 번호 */
				PL += "<td>" + result.list[i].PATIENT_NAME + "</td>"; /* 성명 */
				PL += "<td>" + result.list[i].BIRTH + "</td>"; /* 생년월일 */
				PL += "<td>" + result.list[i].PHONE1 + "</td>"; /* 연락처1 */
				PL += "<td>" + result.list[i].ADDRESS + "</td>"; /* 주소 */
				PL += "<td>" + result.list[i].BLOOD + "</td>"; /* Blood type */
				PL += "</tr>";
			}
			$("#P").html(PL);
			
			PL = "";
			
			PL += "<span class='page_btn_box' name='1'><<</span>";
			
			if($("input[name='Pat_page']").val() == 1) {
				PL += "<span class='page_btn_box' name='1'><</span>";
			} else {
				PL += "<span class='page_btn_box' name='" + ($("input[name='Pat_page']").val() -1) + "'><</span>";
			}
			
			for(var i = result.pb.startPcount; i <= result.pb.endPcount; i++) {
				if(i == $("input[name='Pat_page']").val()) {
					PL += "<span class='page_btn_box_now' name='" + i + "'><b>" + i + "</b></span>";
				} else {
					PL += "<span class='page_btn_box' name='" + i + "'>" + i + "</span>";
				}
			}
			
			if($("input[name='Pat_page']").val() == result.pb.maxPcount) {
				PL += "<span class='page_btn_box' name='" + result.pb.maxPcount + "'>></span>";
			} else {
				PL += "<span class='page_btn_box' name='" + ($("input[name='Pat_page']").val() * 1 + 1) + "'>></span>";
			}
			
			PL +="<span class='page_btn_box' name='"+result.pb.maxPcount+"'>>></span>";
			
			$("#pagingP").html(PL);
		},
		error : function(result) {
			alert("Error - Patient_page_7040");
		}
	});
}

function p_search() { //환자검색
	$("input[name='search_Text1']").val($("#search_Text1").val());
	$("input[name='Pat_page']").val("1");
	$("input[name='selP_b']").val($("select[name='selP_b']").val());
	patient_list();
};