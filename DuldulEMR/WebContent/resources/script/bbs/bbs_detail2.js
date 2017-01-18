
$(document).ready(function(){

		
		$("#bbs_detail2_changeBtn").on("click", function(){
			
			

			 if(($("#updateForm input[name='write']").val() == $("#updateForm input[name='empNo']").val()) || $("input[name='sLvCode']").val() == 0){ 
				 if($(this).val() == "완료"){
					 var updateForm = $("#updateForm");
					 updateForm.ajaxForm(uploadResultCallBack2);
					 updateForm.submit();
					 
				 }else{
					 $("#bbs_detail2_changeBtn").attr("value","완료");
					 $("#TitleText").removeAttr("readonly");
					 $("#textarea_test").removeAttr("readonly");
				 }
			
			 }//if1
			 else{
			        alert("작성자만 글을 수정할 수 있습니다.");
		     }//else1 
			
			
			
		});
		
		$("#bbs_detail2_deleteBtn").on("click", function(){
		 if(($("#deleteForm input[name='write']").val() == $("#deleteForm input[name='empNo']").val()) || $("input[name='sLvCode']").val() == 0){ 
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
				            alert("Error - Detail_delete_2001");
						}
			         },
			         error : function(result) {
				            alert("Error - Detail_delete_2002");
		             }
		          });//ajax끝
		       }     
		     }else{
		        alert("작성자만 글을 삭제할 수 있습니다.");
		     } 
		      });//deleteBtn끝
		}); //ready끝

function uploadResultCallBack2(data, result){ 

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
					
					$("#bbs_detail2_changeBtn").attr("value","수정");
					$("#TitleText").attr("readonly", "readonly");
					$("#textarea_test").attr("readonly", "readonly");
					
					
					var newTab = {tab:"bbs*사내게시판*bbs"}
					var closeTab ={tab:"bbs_detail2"}
					Close_Tab(closeTab);
					ReOpen_Tab(newTab);
					
				}else{
		            alert("Error - Detail_2001");
				}
				
	         },
	         error : function(result) {
		            alert("Error - Detail_2002");
	         }

		});
	
	}//if2
	else {
        alert("Error - Detail_2003");
	}//else2
	
	
	
	
	 
}