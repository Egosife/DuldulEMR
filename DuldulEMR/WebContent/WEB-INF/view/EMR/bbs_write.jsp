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
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
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
	if(result == "success"){ //결과가 성공이네.......그럼 json을 자바스크립트 bean으로 만든다
		var resData = eval("(" + removePre(data) + ")");
		console.log(data);
		$("#textFile").val(resData.fileName[0]);
	
		var params = $("#insertForm").serialize();//serialize는 전송하기쉽게 데이터를 정리해놓은것 
		
		$.ajax({
			type : "post",
			url : "insertTest",
			dataType : "json",
			data : params,
			success : function(result){
				if(result.res == "true"){
					alert("저장 .")
					location.href = "emrmain";
				}else{
					alert("저장 중 문제가 발생했습니다.")
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

function removePre(data){ //데이터가 들어옴
	if(data.indexOf("<pre>") > -1 ){ // >-1:존재한다는 소리			indexOf:위치 찾는거
		var st = data.indexOf(">"); //끝나는 부분의 위치 찾는
		var ed = data.indexOf("<",st); // >(이거)찾은거부터 <(이거) 찾는다
		
		return data.substring(st + 1, ed);//<(이거) 다음꺼부터 >(이거)까지 데이터를 찾는다
	}else{
		return data;
	}
}
</script>
</head>
<body>
<%-- <form action="#" id="actionForm"  method="post">
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" name="searchText" value="${param.searchText}"/>
</form> --%>
	



<div class="wrap">
   <div class="header">
   		<b>글 쓰기</b>
   </div>
<form action="fileUploadAjax" id="insertForm" method="post" enctype="multipart/form-data">
   <div class="content">
		제목 <input type="text" id="TitleText" name="postTitle" /> 
	</div>

   <div class="writter">
      <input type="hidden" name="write" value="${sEmp_Name}"/>
	  <input type="hidden" name="gbn" value="${sBbs_Type}"/>
      <input type="hidden" name="empNo" value="${sEmp_Num}"/>
      <input type="hidden" name="hospitalCode" value="${sHospital_Code}"/>
   	파일첨부<input type="file" name="postFile"/>
   	<input type = "hidden" name="textfile" id="textFile"/>
   	
 
   <div class="page_num" >
   		
   		<textarea rows="30" cols="125" name="postCon"></textarea>
   		
   </div>
   
     </div>
   <div class="search">
  	 <center><input type="button" value="저장" id="saveBtn" />
  	 <input type="button" value="취소" id="cancleBtn" tab="bbs_write"/></center>
	</div>
 </form>
</div>

</body>
</html>