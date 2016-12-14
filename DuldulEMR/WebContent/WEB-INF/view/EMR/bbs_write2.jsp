<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/bbs_write.css" />
 <!-- script 영역 -->

<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">
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


</script>
</head>
<body>	
<%-- <form action="#" id="actionForm"  method="post">
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" name="searchText" value="${param.searchText}"/>
</form> --%>
	

			<form id="insertForm" method="post">
	  <input type="hidden" name="write" value="${sEmp_Name}"/>
	  <input type="hidden" name="hospitalCode" value="${sHospital_Code}"/>
	  <input type="hidden" name="gbn" value="${sBbs_Type}"/>
      <input type="hidden" name="empNo" value="${sEmp_Num}"/>
<div class="bbs_write_main">
   <div class="bbs_write_top">
    	<div class="bbs_write_top_title"><b>글쓰기</b></div>
    	 <div class="bbs_write_title">제목</div> <!-- 레이아웃 상단 - 업무 날짜  -->
    

 			<div class="bbs_write_total" style="text-align: center"> <!-- 레이아웃 상단 - 업무 날짜 선택 -->
        		<input type="text" id="TitleText" name="postTitle" placeholder="제목을 입력하세요"/> 
    		 </div>
    	   </div>
   				<hr> <!-- 구분선 -->	 

	  
   

    <div class="bbs_write_mid"> 
    <div class="bbs_write_content">글 내용</div>
     <div class="bbs_write_content_text">
       		<textarea rows="10" cols="100" name="postCon" class="bbs_write_size" placeholder="내용을 입력하세요"></textarea>
    </div>
  </div>
  <hr/>
   <div class="bbs_write_bottom_bb"> 
  		 <div class="bbs_write_1">
  			 <input type="button" value="저장" id="saveBtn" tab="bbs_write" class="bbs_write_button"/>
  	 		<input type="button" value="취소" id="cancleBtn" tab="bbs_write" class="bbs_write_button"/>	
         </div> <!-- 레이아웃 하단 - 글쓰기 버튼 -->
   </div>

   </div>
   
		</form>
		
</body>
</html>