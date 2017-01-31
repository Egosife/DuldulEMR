/** 2016-12-14 김남기 
휴진 신청 화면 완료 **/
$(document).ready(function(){
	REST_emp_List(); 
	rest_Date();
	
	$("#rest_jajangBtn").on("click",function(){ /* 글쓰기 버튼을 누르면 */
		if($("#r_datepicker1s").val() == ""){ //날짜 선택 칸이 빈 칸이면
			alert("날짜를 선택하세요."); //경고창을 띄운다
			
		}else if($("#r_datepicker2s").val() == ""){ //내용 입력 칸이 빈 칸이면
				alert("날짜를 선택하세요."); //경고창을 띄운다
			}else if($("#rest_text").val()==""){
				alert("내용을 입력하세요.");
			}else{
 		 var rest_wri = $("#rest_wri");
 		
 		rest_wri.ajaxForm(REST_uploadResultCallBack);
 		rest_wri.submit(); 
			}
	}); //insertBtn end
	
	$("#rest_sunsilBtn").on("click",function(){ //취소 버튼을 누르면
		var tab = {tab:"rest_apply*휴진현황*rest_apply"};
		
		Close_Tab(this); //탭을 닫는다
		ReOpen_Tab(tab);
	}); //cancelBtn 끝
});//ready end

function REST_emp_List(){
	var params = $("#restEmp_Form").serialize();
	
	$.ajax({
		type : "post",
		url : "emp_List",
		dataType : "json",
		data : params,
		success : function(result){
			var html="";
			
				html += "<tr name='"+result.list.EMP_NAME+"'>";
				html += "<td>"+result.list.EMP_NAME+"</td>"; //직원 이름
				html += "<td>"+result.list.POSITION+"</td>"; //직책
				html += "<td>"+result.list.EMP_NUM+"</td>"; //사원 번호
				html += "<td>"+result.list.OFFICE+"</td>"; //근무과
				html += "</tr>";
				$("#rest_tb_emp").html(html); //직원 데이터 가져오기
		}
	});
}
function REST_uploadResultCallBack(data,result){ 
	var rest_apply_open = {tab:"rest_apply*휴진현황*rest_apply"}; //업무일지 탭과 페이지를 연다
	var rest_close = {tab:"rest"}; //글 읽기 탭과 페이지를 닫는다
	if(result=="success"){ //결과가 success면 성공 json을 javascript bean으로 만듦
		
		var params = $("#rest_wri").serialize();
		
	$.ajax({
			type : "post",
			url : "restInsert",
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res=="true"){
					Close_Tab(rest_close); //글 읽기 탭과 페이지를 닫는다
					ReOpen_Tab(rest_apply_open); //업무일지 탭과 페이지를 연다
				}else{
					alert("Error - rest_0000");
				}
			},
			error : function(result){
				alert("Error - rest_1994");
			}
		}); //ajax 끝
	}else{
		alert("Error - rest_0425"); //저장 실패
	}
} //uploadResultCallBack 끝
$("#r_datepicker1s").datepicker({
	dateFormat : 'yy-mm-dd',
	duration: 200,
	onSelect:function(dateText, inst){
		var rest_first_Date = parseInt($("#r_datepicker2s").val().replace("-", '').replace("-", ''));
		var rest_second_Date = parseInt(dateText.replace(/-/g,''));
		var rest_tDate = parseInt($("#rest_TDATE").val());
		
        if (rest_second_Date > rest_first_Date || rest_second_Date < rest_tDate) {
        	alert("날짜를 올바르게 선택하세요.");
        	//달력에 종료 날짜 넣어주기
    		$("#r_datepicker1s").val($("#rest_SDATE").val());
		} else {
			$("#rest_SDATE").val($("#r_datepicker1s").val());
		}
	}
});
$("#r_datepicker2s").datepicker({
	dateFormat : 'yy-mm-dd',
	duration: 200,
	onSelect:function(dateText, inst){
		var rest_first_Date = parseInt($("#r_datepicker1s").val().replace("-", '').replace("-", ''));
		var rest_second_Date = parseInt(dateText.replace(/-/g,''));
		var rest_tDate = parseInt($("#rest_TDATE").val());
		
        if (rest_first_Date > rest_second_Date || rest_second_Date < rest_tDate) {
        	alert("날짜를 올바르게 선택하세요.");
        	//달력에 종료 날짜 넣어주기
    		$("#r_datepicker2s").val($("#rest_EDATE").val());
		} else {
			$("#rest_EDATE").val($("#r_datepicker2s").val());
		}
	}
});
function rest_Date(){
	var r_date = new Date();
	var months = "";
	
	if(r_date.getMonth()+1 < 10){
		months = "0" + (r_date.getMonth()+1);
	}else{
		months = r_date.getMonth()+1;
	}
	var r_interDate = r_date.getFullYear()+""+months+""+r_date.getDate();
	$("#rest_TDATE").val(r_interDate);
}