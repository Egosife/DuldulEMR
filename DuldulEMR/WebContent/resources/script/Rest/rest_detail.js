/** 2016-12-14 김남기 
휴진 수정,삭제 화면 완료 **/
$(document).ready(function(){
	emp_List(); 

	$("#rest_taildatepicker1").datepicker({ //날짜 가져오기
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
		}
	});
	$("#rest_taildatepicker2").datepicker({ //날짜 가져오기
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
		}
	});
	$("#sujeongBtn").on("click",function(){ //수정 버튼을 누르면
		var tail_up = $("#tail_up"); 
		
		tail_up.ajaxForm(uploadResultCallBack); //uploadResultCallBack = ajax를 실행하고 uploadResultCallBack를 호출한다.
		tail_up.submit();
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
						ReOpen_Tab(rest_app_open); //업무일지 탭과 페이지를 연다
						Close_Tab(rest_tail_close); //글 읽기 탭과 페이지를 닫는다
					}else{
						alert("저장 中 문제가 발생했습니다.");
					}
				},
				error : function(result){
					alert("에러!!");
				}
			}); //ajax 끝
		}else{
			alert("貯藏 失敗!"); //저장 실패
		}
	} //uploadResultCallBack 끝
	
	$("#sakjeBtn").on("click",function(){
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
						ReOpen_Tab(rest_app_open); //업무일지 탭과 페이지를 연다
						Close_Tab(rest_tail_close); //글 읽기 탭과 페이지를 닫는다
					}else{
						alert("삭제 中에 문제가 발생하였습니다.")
					}
				},
				error : function(result){
					alert("error!");
				}
			}); //ajax 끝
		} //if 끝
	}); //delete 끝
	
	$("#chisoBtn").on("click",function(){ //취소 버튼을 누르면
		Close_Tab(this); //탭을 닫는다
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
				$("#tb_emp").html(html); //직원 데이터 가져오기
		}
	});
}