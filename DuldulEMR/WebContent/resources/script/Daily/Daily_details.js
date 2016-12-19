/** 2016-12-12 김남기 
		기능	개발 완료 **/
$(document).ready(function(){
	$("#details_calendar").datepicker({ //날짜 가져오기
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
		}
	});
	
	$("#listBtn").on("click",function(){ //취소 버튼을 누르면
		Close_Tab(this); //탭을 닫는다
	}); //listBtn 끝
	
	$("#updateBtn").on("click",function(){ //수정 버튼을 누르면
		var details_up = $("#details_up"); 
		
		details_up.ajaxForm(uploadResultCallBack); //uploadResultCallBack = ajax를 실행하고 uploadResultCallBack를 호출한다.
		details_up.submit();
	});//updateBtn	
	
	function uploadResultCallBack(data,result){ //data엔 json이 들어가있음
		var dailyopen = {tab:"Daily*업무일지*j"}; //업무일지 탭과 페이지를 연다
		var dailydetails_close = {tab:"Daily_details"}; //글 읽기 탭과 페이지를 닫는다
		if(result=="success"){ //결과가 success면 성공 json을 javascript bean으로 만듦

			var params = $("#details_up").serialize();
			
			$.ajax({
				type : "post",
				url : "dailyUpdate",
				dataType : "json",
				data : params,
				success : function(result){
					if(result.res>0){ //result.res가 0보다 크면
						alert("수정이 되었습니다."); //경고창 띄우기
						ReOpen_Tab(dailyopen); //업무일지 탭과 페이지를 연다
						Close_Tab(dailydetails_close); //글 읽기 탭과 페이지를 닫는다
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
	
	$("#details_delete").on("click",function(){
		var dailyopen = {tab:"Daily*업무일지*j"}; //업무일지 탭과 페이지를 연다
		var dailydetails_close = {tab:"Daily_details"}; //글 읽기 탭과 페이지를 닫는다
		
		if(confirm("정말 삭제하시겠습니까?")){
			var params = $("#details_del").serialize();
			
			$.ajax({
				type : "post",
				url : "dailyDelete",
				dataType : "json",
				data : params,
				success : function(result){
					if(result.ress>0){
						alert("삭제 되었습니다."); //경고창 띄우기
						ReOpen_Tab(dailyopen); //업무일지 탭과 페이지를 연다
						Close_Tab(dailydetails_close); //글 읽기 탭과 페이지를 닫는다
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
}); //ready 끝