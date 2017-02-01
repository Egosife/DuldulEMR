$(document).ready(function(){
	$("#cancleBtn").on("click", function(){
		var closeTab ={tab:"bbs_write2"};
		var newTab = {tab:"bbs*사내게시판*bbs"};
		//$("#actionForm").attr("action","notice");
		//$("#actionForm").submit();
		Close_Tab(closeTab);
		ReOpen_Tab(newTab);
	});
	
	$("#saveBtn").on("click", function(){

		
		var insertForm = $("#insertForm");

		insertForm.ajaxForm(bbs_write_2_uploadResultCallBack);//ajaxForm:이폼 실행하면 아작스폼으로 하겠다 하는게 ajaxForm
		insertForm.submit();			
	
	});
});

function bbs_write_2_uploadResultCallBack(data, result){ //result가 뭐냐면 ajax결과임(success 인지 fail인지),,,,data는 json받은거임

	var closeTab ={tab:"bbs_write2"};
	var newTab = {tab:"bbs*사내게시판*bbs"};
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
						
					Close_Tab(closeTab);
					ReOpen_Tab(newTab);
					
				}else{
					alert("Error - Write_2001");
				}
	         },
	         error : function(result) {
	        	 alert("Error - Write_2002");
	         }
		});
	}else{
		alert("Error - Write_2003");
	}
} //eval의 용도는 자바스크립는 bean용도로 사용하게.........

