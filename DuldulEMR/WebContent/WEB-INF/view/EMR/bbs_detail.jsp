<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/bbs_detail.css" />
 <!-- script 영역 -->

<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">


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
			
							var newTab = {tab:"notice*공지사항*notice"}
							var closeTab ={tab:"bbs_detail"}
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
					
					
					var newTab = {tab:"notice*공지사항*notice"}
					var closeTab ={tab:"bbs_detail"}
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
</script>
</head>
<body>
<form action="#" id="deleteForm"  method="post">
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" name="searchText" value="${param.searchText}"/>
	<input type="hidden" name="POST_NUM" value="${param.POST_NUM}"/>
	

</form>

			<form action="#" id="updateForm" method="post">
	  <input type="hidden" name="POST_NUM" value="${param.POST_NUM}"/>
	  <input type="hidden" name="write" value="${sEmp_Name}"/>
	  <input type="hidden" name="hospitalCode" value="${sHospital_Code}"/>
	  <input type="hidden" name="gbn" value="${sBbs_Type}"/>
      <input type="hidden" name="empNo" value="${sEmp_Num}"/>
<div class="bbs_detail_main">
   <div class="bbs_detail_top">
    	<div class="bbs_detail_top_title"><b>글쓰기</b></div>
<!--  	 <div class="bbs_detail_writer">작성자</div>
 	  <div class="bbs_detail_date">등록일</div><br/> -->
    	 <div class="bbs_detail_title">제목</div>  
    

 			<div class="bbs_detail_total" style="text-align: center"> <!-- 레이아웃 상단 - 업무 날짜 선택 -->
        		<%--  <input type="text" class = "bbs_detail_writer_text" id="WritterText" readonly value="${con.WRITER}"  />
	 <input type="text" class = "bbs_detail_date_text" id="DateText" readonly value="${con.REPORTING}"/> --%>
		 <input type="text" class = "bbs_detail_title_text" id="TitleText" 
		 		name="postTitle" readonly value="${con.TITLE}"/>  

    		 </div>
    	   </div>
   				<hr> <!-- 구분선 -->	 

	  
   

    <div class="bbs_detail_mid"> 
    <div class="bbs_detail_content">글 내용</div>
    
     <div class="bbs_detail_content_text">
       		<textarea id="textarea_test" class="bbs_detail_size" rows="10" cols="100" 
       			 	  name="content" readonly >${con.CONTENT}</textarea>
    </div>
  </div>
  <hr/>
   <div class="bbs_detail_bottom_bb"> 
  		 <div class="bbs_detail_1">
  			<input type="button" value="수정" id="changeBtn" tab="bbs_detail" class="bbs_detail_button"/> <!--  --> 
			<input type="button" value="삭제" id="deleteBtn" tab="bbs_detail" class="bbs_detail_button"/> 
         </div> <!-- 레이아웃 하단 - 글쓰기 버튼 -->
   </div>

   </div>
   
		</form>
		
</body>
</html>