

$(document).ready(function(){

    //버튼에 보이는 이름 완료라는 글자면 글이 업로드된다
    $("#bbs_detail_changeBtn").on("click", function(){
    	 if(($("#bbs_detail_updateForm input[name='write']").val() == $("#bbs_detail_updateForm input[name='empNo']").val()) || $("input[name='sLvCode']").val() == 0){ 
			 if($(this).val() == "완료"){
				 var updateForm = $("#bbs_detail_updateForm");
				 bbs_detail_updateForm.ajaxForm(uploadResultCallBack);
				 bbs_detail_updateForm.submit();
				 
			 }else{
				 $("#bbs_detail_changeBtn").attr("value","완료");
				 $("#bbs_write_TitleText").removeAttr("readonly");
				 $("#textarea_test").removeAttr("readonly");
			 }
		
		 }//if1
		 else{
		        alert("작성자만 글을 수정할 수 있습니다.");
	     }//else1 
		
		
		
	});
		//삭제 버튼 클릭이 행동
		$("#bbs_detail_deleteBtn").on("click", function(){
	        if(($("#bbs_detail_deleteForm input[name='write']").val() == $("#bbs_detail_deleteForm input[name='empNo']").val()) || $("input[name='sLvCode']").val() == 0){ 
			if(confirm("지울꺼니?")){
				var params = $("#bbs_detail_deleteForm").serialize();

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
		          });//ajax끝
		       }     
		     }else{
			        alert("작성자만 글을 삭제할 수 있습니다.");
			     } 
			      });//deleteBtn끝
			}); //ready끝

function uploadResultCallBack(data, result){ 

	
	if(result == "success"){
	
		var params = $("#bbs_detail_updateForm").serialize();
		
		$.ajax({
			type : "post",
			url : "updateTest",
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res > 0){
					alert("수정했습니다.")
					
					$("#bbs_detail_changeBtn").attr("value","수정");
					$("#bbs_write_TitleText").attr("readonly", "readonly");
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