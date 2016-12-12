/** 2016-12-12 김남기 
		기능	개발 완료 **/
$(document).ready(function(){
	
	$("#datepicker1").datepicker({ //날짜 가져오기
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
		}
	});
	
	$("#cancelBtn").on("click",function(){ //취소 버튼을 누르면
		Close_Tab(this); //탭을 닫는다
	}); //cancelBtn 끝
	
	$("#saveBtn").on("click",function(){ //저장 버튼을 누르면
		if($("#datepicker1").val() == ""){ //날짜 선택 칸이 빈 칸이면
			alert("날짜를 선택하세요."); //경고창을 띄운다
		}else if($("#naeyoung").val() == ""){ //내용 입력 칸이 빈 칸이면
				alert("내용을 입력하세요."); //경고창을 띄운다
			}else{
 		 var daily_wri = $("#daily_wri");
 		
 		daily_wri.ajaxForm(uploadResultCallBack);
 		daily_wri.submit(); 
			}
	}); //saveBtn 끝
}); //ready 끝
function uploadResultCallBack(data,result){ 
	var daily_open = {tab:"Daily*업무일지*j"}; //업무일지 탭과 페이지를 연다
	var dailywrite_close = {tab:"Daily_write"}; //글 읽기 탭과 페이지를 닫는다
	if(result=="success"){ //결과가 success면 성공 json을 javascript bean으로 만듦
		
		var params = $("#daily_wri").serialize();
		
	$.ajax({
			type : "post",
			url : "dailyInsert",
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res=="true"){
					ReOpen_Tab(daily_open); //업무일지 탭과 페이지를 연다
					Close_Tab(dailywrite_close); //글 읽기 탭과 페이지를 닫는다
				}else{
					alert("저장 중 문제가 발생했습니다.");
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