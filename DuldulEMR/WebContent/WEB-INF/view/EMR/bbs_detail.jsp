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
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<script type="text/javascript">


//목록 버튼 클릭했을시
$(document).ready(function(){
	visit();
		$("#listBtn").on("click", function(){
			
			$("#actionForm").attr("action","notice");
			$("#actionForm").submit();			
		});
		
		$("#changeBtn").on("click", function(){
			$("#actionForm").attr("action","bbs_detail_modify");
			$("#actionForm").submit();			
		});
		
		$("#deleteBtn").on("click", function(){
			if(confirm("지울꺼니?")){
				var params = $("#actionForm").serialize();
				$.ajax({
					type : "post",
					url : "deleteTest",
					dataType : "json",
					data : params,
					success : function(result){
						if(result.res > 0){
							location.href = "notice";	
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
	
function visit() {
	var params = $("#actionForm").serialize();
	$.ajax({
		type : "post",
		url : "visit",
		dataType : "json",
		data : params,
		success : function(result){
			alert("조회수 증가 성공");
         },
         error : function(result) {
          	alert("error!");
         }
	});
}
</script>
</head>
<body>
<form action="#" id="actionForm"  method="post">
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" name="searchText" value="${param.searchText}"/>
	<input type="hidden" name="POST_NUM" value="${param.POST_NUM}"/>
</form>


<div class="wrap">
   <div class="header">
   		<b>상세보기</b>
   </div>

   <div class="writter">
		작성자  <input type="text" id="WritterText" readonly value="${con.WRITER}"  />  
	</div>	

   <div class="date">
   	등록일 <input type="text" id="DateText" readonly value="${con.REPORTING}"/>  
   </div>
   <div class="title" >
   		제목 <input type="text" id="TitleText" readonly value="${con.TITLE}"/> 
   </div>
   
   <div class="content">
   <textarea id="textarea_test" rows="30" cols="125" name="contents" readonly > ${con.CONTENT}</textarea>
	</div>
	
	  <div class="title" >
   		첨부파일 <input type="text" id="FileText"readonly value="${con.FILE_NAME}"/> 
   	</div>
   	
   	<div class="button" style="text-align:right">
   		<input type="button" value="수정" id="changeBtn"/>
   		<input type="button" value="삭제" id="deleteBtn"/>
   		<input type="button" value="목록" id="listBtn"/>
   	</div>
 
</div>

</body>
</html>