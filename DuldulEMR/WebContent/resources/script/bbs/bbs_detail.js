

$(document).ready(function(){

		//버튼에 보이는 이름 완료라는 글자면 글이 업로드된다
		$("#changeBtn").on("click", function(){
			if($(this).val() == "완료"){
				var updateForm = $("#updateForm");
				updateForm.ajaxForm(uploadResultCallBack);
				updateForm.submit();
			//버튼에 보이는 이름 완료라는 글자가 되면 	TitleText(제목부분),textarea_test(글 쓰는 부분) 다 읽기만 하고 수정이 될수 없게 한다
			}else{
				$("#changeBtn").attr("value","완료");
				$("#TitleText").removeAttr("readonly");
				$("#textarea_test").removeAttr("readonly");
			}
			
		});
		//삭제 버튼 클릭이 행동
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
			
							var newTab = {tab:"notice*공지사항*notice"}
							var closeTab ={tab:"bbs_detail"}
							Close_Tab(closeTab);
							ReOpen_Tab(newTab);
						}else{
				            alert("Error - Detail_delete_1001");
						}
			         },
			         error : function(result) {
			             alert("Error - Detail_delete_1002");
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
					
					
					var newTab = {tab:"notice*공지사항*notice"}
					var closeTab ={tab:"bbs_detail"}
					Close_Tab(closeTab);
					ReOpen_Tab(newTab);
					
				}else{
		            alert("Error - Detail_1001");
				}
	         },
	         error : function(result) {
	             alert("Error - Detail_1002");
	         }
		});
	} else {
        alert("Error - Detail_1003");
	} 
}