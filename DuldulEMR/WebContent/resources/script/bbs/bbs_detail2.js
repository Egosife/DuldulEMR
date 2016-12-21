
$(document).ready(function(){

		
		$("#changeBtn").on("click", function(){
			if($(this).val() == "완료"){
				var updateForm = $("#updateForm");
				updateForm.ajaxForm(uploadResultCallBack);
				updateForm.submit();
				
			}else{
				$("#changeBtn").attr("value","완료");
				$("#TitleText").removeAttr("readonly");
				$("#textarea_test").removeAttr("readonly");
			}
			
		});
		
		$("#deleteBtn").on("click", function(){

			if(confirm("지울꺼니?")){
				var params = $("#deleteForm").serialize();
				console.log(params);
				$.ajax({
					type : "post",
					url : "deleteTest",
					dataType : "json",
					data : params,
					success : function(result){
						if(result.res > 0){
			
							var newTab = {tab:"bbs*사내게시판*bbs"}
							var closeTab ={tab:"bbs_detail2"}
							Close_Tab(closeTab);
							ReOpen_Tab(newTab);
						}else{
							alert("삭제가 안된다능.")
						}
			         },
			         error : function(result) {
			          	alert("error!");
			         }
				});
			
			}
			
		});
	});

function uploadResultCallBack(data, result){ 

	
	if(result == "success"){
	
		var params = $("#updateForm").serialize();
		
		$.ajax({
			type : "post",
			url : "updateTest",
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res > 0){
					alert("수정했습니다.")
					
					$("#changeBtn").attr("value","수정");
					$("#TitleText").attr("readonly", "readonly");
					$("#textarea_test").attr("readonly", "readonly");
					
					
					var newTab = {tab:"bbs*사내게시판*bbs"}
					var closeTab ={tab:"bbs_detail2"}
					Close_Tab(closeTab);
					ReOpen_Tab(newTab);
					
				}else{
					alert("수정 중 문제가 발생했습니다.")
				}
	         },
	         error : function(result) {
	          	alert("error!");
	         }
		});
	} else {
		alert("저장실패");
	} 
}