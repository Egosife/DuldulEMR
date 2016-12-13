/** 2016-11-24 이관우 개발 
		 12-02 JSP전체 수정 
	 	    05 키 이벤트 엔터 추가 
		    05 개발완료 **/
		   
//직원조회

$(document).ready(function(){
	Emp_list(); //function Emp_list()를 불러옴
	console.log("aasdad");
	$("body").on("keydown",function(e){ //엔터키로 검색을 눌렀을 때
		if(e.which == 13){
			Esearch();
		}
	});
	
	$("#Esearch_Btn").on("click", function(){ //검색을 클릭 했을시
		Esearch();
	});
	
	$("#pagingE").on("click", "span", function(){ //리스트 버른을 눌렀을시
		$("input[name='Emp_page']").val($(this).attr("name"));
		Emp_list();
	});
	
	$("#EMPlist_Btn").on("click", function(){ //목록보기
		$("input[name='Esearch_Text1']").val("");
		$("input[name='Emp_page']").val("1");
		Emp_list();
	});
});

function Emp_list() {
	var parirock = $("#act_E").serialize();
	
	$.ajax({ //ajax 컨트롤러 만들어야함
		type : "post",
		url : "EMP_list",
		dataType : "json",
		data : parirock,
		success : function(result) {
			var EL = ""; /* 메타 : Emp_list 영문명 */
			
			for(var i = 0; i < result.list.length; i++) {
				EL += "<tr>";
				EL += "<td>" + result.list[i].NO + "</td>"; /* 번호 */
				EL += "<td>" + result.list[i].EMP_NUM + "</td>"; /* 직원번호 */
				EL += "<td>" + result.list[i].EMP_NAME + "</td>"; /* 성명 */
				EL += "<td>" + result.list[i].POSITION_CODE + "</td>"; /* 직책 */
				EL += "<td>" + result.list[i].OFFICE_CODE + "</td>"; /* 진료과 */
				EL += "<td>" + result.list[i].EMAIL + "</td>"; /* E-MAIL */
				EL += "<td>" + result.list[i].PHONE + "</td>"; /* 전화번호 */
				EL += "</tr>";
			}
			$("#E").html(EL);
			
			EL = "";
			
			if($("input[name='Emp_page']").val() == 1) {
				EL += "<span name='1'> < </span>";
			} else {
				EL += "<span name='" + ($("input[name='Emp_page']").val() -1) + "'> < </span>";
			}
			
			for(var i = result.pb.startPcount; i <= result.pb.endPcount; i++) {
				if(i == $("input[name='Emp_page']").val()) {
					EL += "<span name='" + i + "'><b>" + i + "</b></span>";
				} else {
					EL += "<span name='" + i + "'>" + i + "</span>";
				}
			}
			
			if($("input[name='Emp_page']").val() == result.pb.maxPcount) {
				EL += "<span name='" + result.pb.maxPcount + "'> > </span>";
			} else {
				EL += "<span name='" + ($("input[name='Emp_page']").val() * 1 + 1) + "'> > </span>";
			}
			
			$("#pagingE").html(EL);
		},
		error : function(result) {
			alert("정보가 없습니다");
		}
	});
}

function Esearch() { //직원검색
	$("input[name='Esearch_Text1']").val($("#Esearch_Text1").val());
	$("input[name='Emp_page']").val("1");
	$("input[name='selE_b']").val($("select[name='selE_b']").val());
	Emp_list();
};