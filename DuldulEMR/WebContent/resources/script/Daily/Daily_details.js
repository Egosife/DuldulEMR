/** 2016-12-12 김남기 
		기능	개발 완료 **/
$(document).ready(function(){
	$("#details_calendar").datepicker({ //날짜 가져오기
		dateFormat : 'yy-mm-dd',
		duration: 200,
		onSelect:function(dateText, inst){
		}
	});
	
	$("#details_listBtn").on("click",function(){ //취소 버튼을 누르면
		var tab = {tab:"Daily*업무일지*Daily"};
		
		Close_Tab(this); //탭을 닫는다
		ReOpen_Tab(tab);
	}); //listBtn 끝
	
	$("#details_updateBtn").on("click",function(){ //수정 버튼을 누르면
		if($(this).val() == "등록"){
			var details_up = $("#details_up"); 
			
			details_up.ajaxForm(Daily_uploadResultCallBack); //uploadResultCallBack = ajax를 실행하고 uploadResultCallBack를 호출한다.
			details_up.submit();
		}else{
			$("#details_updateBtn").attr("value","등록");
			$("#details_calendar").removeAttr("readonly");
			$("#details_text").removeAttr("readonly");
		}
	});//updateBtn	
	
	function Daily_uploadResultCallBack(data,result){ //data엔 json이 들어가있음
		var dailyopen = {tab:"Daily*업무일지*Daily"}; //업무일지 탭과 페이지를 연다
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
						$("#updateBtn").attr("value","등록");
						$("#details_calendar").removeAttr("readonly");
						$("#details_text").removeAttr("readonly");
						Close_Tab(dailydetails_close); //글 읽기 탭과 페이지를 닫는다
						ReOpen_Tab(dailyopen); //업무일지 탭과 페이지를 연다
					}else{
						alert("Error - Daily_details_0000");
					}
				},
				error : function(result){
					alert("Error - Daily_details_1994");
				}
			}); //ajax 끝
		}else{
			alert("Error - Daily_details_0425");
		}
	} //uploadResultCallBack 끝
	
	$("#details_delete").on("click",function(){
		var dailyopen = {tab:"Daily*업무일지*Daily"}; //업무일지 탭과 페이지를 연다
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
						Close_Tab(dailydetails_close); //글 읽기 탭과 페이지를 닫는다
						ReOpen_Tab(dailyopen); //업무일지 탭과 페이지를 연다
					}else{
						alert("Error - Daily_details_0001")
					}
				},
				error : function(result){
					alert("Error - Daily_details_1988");
				}
			}); //ajax 끝
		} //if 끝
	}); //delete 끝
}); //ready 끝