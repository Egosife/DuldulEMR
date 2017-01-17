/** 2016-12-14 김남기 
휴진 수정,삭제 화면 완료 **/
$(document).ready(function(){
	showCalendar(d.getFullYear(),(d.getMonth() + 1));
});

$(document).ready(function(){
	emp_List();
	rest_detail_Date();
	rest_shincheong();
	
	$("#rd_datepicker1").datepicker({ //날짜 가져오기
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
			var firstDate = parseInt($("#rd_datepicker2").val().replace("-", '').replace("-", ''));
			var secondDate = parseInt(dateText.replace(/-/g,''));
			var rest_dtDate = parseInt($("#DT_DATE").val());
			
            if (secondDate > firstDate || secondDate < rest_dtDate) {
            	alert("날짜를 올바르게 선택하세요.");
            	//달력에 종료 날짜 넣어주기
        		$("#rd_datepicker1").val($("#rd_SDATE").val());
			} else {
				$("#rd_SDATE").val($("#rd_datepicker1").val());
			}
		}
	});
	$("#rd_datepicker2").datepicker({ //날짜 가져오기
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
			var firstDate = parseInt($("#rd_datepicker1").val().replace("-", '').replace("-", ''));
			var secondDate = parseInt(dateText.replace(/-/g,''));
			var rest_dtDate = parseInt($("#DT_DATE").val());
			
            if (firstDate > secondDate || secondDate < rest_dtDate) {
            	alert("날짜를 올바르게 선택하세요.");
            	//달력에 종료 날짜 넣어주기
        		$("#rd_datepicker2").val($("#rd_EDATE").val());
			} else {
				$("#rd_EDATE").val($("#rd_datepicker2").val());
			}
		}
	});
	$("#rd_sujeongBtn").on("click",function(){ //수정 버튼을 누르면
		if($(this).val() == "등록"){
			var tail_up = $("#tail_up"); 
			
			tail_up.ajaxForm(uploadResultCallBack); //uploadResultCallBack = ajax를 실행하고 uploadResultCallBack를 호출한다.
			tail_up.submit();
		}else{
			$("#rd_sujeongBtn").attr("value","등록");
			$("#rd_datepicker1").removeAttr("readonly");
			$("#rd_datepicker2").removeAttr("readonly");
			$("#rd_datepicker1").val("");
			$("#rd_datepicker2").val("");
			$("#rd_rest_rest").removeAttr("readonly");
		}
	});//sujeongBtn
	function uploadResultCallBack(data,result){ //data엔 json이 들어가있음
		var rest_app_open = {tab:"rest_apply*휴진현황*rest_apply"}; //업무일지 탭과 페이지를 연다
		var rest_tail_close = {tab:"rest_detail"}; //글 읽기 탭과 페이지를 닫는다
		if(result=="success"){ //결과가 success면 성공 json을 javascript bean으로 만듦
			
			var params = $("#tail_up").serialize();
			
			$.ajax({
				type : "post",
				url : "detail_sujeong",
				dataType : "json",
				data : params,
				success : function(result){
					if(result.res>0){ //result.res가 0보다 크면
						alert("수정이 되었습니다."); //경고창 띄우기
						$("#rd_changeBtn").attr("value","수정");
						$("#rd_datepicker1").attr("readonly", "readonly");
						$("#rd_datepicker2").attr("readonly", "readonly");
						$("#rd_rest_rest").attr("readonly", "readonly");
						Close_Tab(rest_tail_close); //글 읽기 탭과 페이지를 닫는다
						ReOpen_Tab(rest_app_open); //업무일지 탭과 페이지를 연다
					}else{
						alert("Error - rest_detail_0000");
					}
				},
				error : function(result){
					alert("Error - rest_detail_1994");
				}
			}); //ajax 끝
		}else{
			alert("Error - rest_detail_0425"); //저장 실패
		}
	} //uploadResultCallBack 끝
	
	$("#rd_sakjeBtn").on("click",function(){
		var rest_app_open = {tab:"rest_apply*휴진현황*rest_apply"}; //업무일지 탭과 페이지를 연다
		var rest_tail_close = {tab:"rest_detail"}; //글 읽기 탭과 페이지를 닫는다
		
		if(confirm("정말 삭제하시겠습니까?")){
			var params = $("#tail_del").serialize();
			
			$.ajax({
				type : "post",
				url : "detail_sakje",
				dataType : "json",
				data : params,
				success : function(result){
					if(result.ress>0){
						alert("삭제 되었습니다.") //경고창 띄우기
						Close_Tab(rest_tail_close); //글 읽기 탭과 페이지를 닫는다
						ReOpen_Tab(rest_app_open); //업무일지 탭과 페이지를 연다
					}else{
						alert("Error - rest_detail_0001")
					}
				},
				error : function(result){
					alert("Error - rest_detail_1988");
				}
			}); //ajax 끝
		} //if 끝
	}); //delete 끝
	
	$("#rd_chisoBtn").on("click",function(){ //취소 버튼을 누르면
		var tab = {tab:"rest_apply*휴진현황*rest_apply"};
		
		Close_Tab(this); //탭을 닫는다
		ReOpen_Tab(tab);
	}); //chisoBtn 끝
});//ready end

/* 직원 데이터 가져오기 */
function emp_List(){
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
				$("#rd_tb_emp").html(html); //직원 데이터 가져오기
		}
	});
}
function rest_detail_Date(){
	var rd_date = new Date();
	
	var rd_interDate = rd_date.getFullYear()+""+(rd_date.getMonth()+1)+""+rd_date.getDate();
	$("#DT_DATE").val(rd_interDate);
}
function rest_shincheong(){
	if($("#rd_R_CHECK").val()==1){
		$("#rd_sujeongBtn").val("재신청");
	}
	if($("#rd_R_CHECK").val()==2){
		$("#rd_sujeongBtn").css("display","none")
		$("#rd_sakjeBtn").css("display","none");
	}
}