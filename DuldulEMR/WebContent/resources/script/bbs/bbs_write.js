$(document).ready(function(){
	$("#cancleBtn").on("click", function(){
		//$("#actionForm").attr("action","notice");
		//$("#actionForm").submit();
		Close_Tab(this);
	});
	
	$("#saveBtn").on("click", function(){

		
		var insertForm = $("#insertForm");

		insertForm.ajaxForm(uploadResultCallBack);//ajaxForm:이폼 실행하면 아작스폼으로 하겠다 하는게 ajaxForm
		insertForm.submit();			
	
	});
});

function uploadResultCallBack(data, result){ //result가 뭐냐면 ajax결과임(success 인지 fail인지),,,,data는 json받은거임

	var closeTab ={tab:"bbs_write"};
	var newTab = {tab:"notice*공지사항*notice"};
	if(result == "success"){ //결과가 성공이네.......그럼 json을 자바스크립트 bean으로 만든다

		var params = $("#insertForm").serialize();//serialize는 전송하기쉽게 데이터를 정리해놓은것 
		
		$.ajax({
			type : "post",
			url : "insertTest",
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res == "true"){
					alert("저장 .")
						
					ReOpen_Tab(newTab);
					Close_Tab(closeTab);
					
				}else{
					alert("저장 중 문제가 발생했습니다.");
				}
	         },
	         error : function(result) {
	          	alert("error!");
	         }
		});
	}else{
		alert("저장실패");
	}
} //eval의 용도는 자바스크립는 bean용도로 사용하게.........
