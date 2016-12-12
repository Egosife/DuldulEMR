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
			//var coca = $(this);
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
						//	Close_Tab(coca);
							var closeTab ={tab:"bbs_detail2"}
							var newTab = {tab:"bbs*사내게시판*bbs"}
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
					
					
					var closeTab ={tab:"bbs_detail2"}
					var newTab = {tab:"bbs*사내게시판*bbs"}
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

<form action="fileUploadAjax" id="updateForm" method="post" enctype="multipart/form-data">
<div class="bbs_detail_wrap">
<input type="hidden" name="POST_NUM" value="${param.POST_NUM}"/>
   <div class="bbs_detail_header">
   		<b>상세보기</b>
   </div>

   <div class="bbs_detail_writter">
		작성자  <input type="text" id="WritterText" readonly value="${con.WRITER}"  />
	</div>	

   <div class="bbs_detail_date">
   	등록일 <input type="text" id="DateText" readonly value="${con.REPORTING}"/> 
   </div>
   <div class="bbs_detail_title" >
	제목 <input type="text" id="TitleText" name="postTitle" readonly value="${con.TITLE}"/> 
   </div>
   
   <div class="bbs_detail_content">
<textarea id="textarea_test" rows="30" cols="125" name="content" readonly >${con.CONTENT}</textarea>
	</div>
	
	  <div class="bbs_detail_file" >
첨부파일

 <input type="text" id="FileText"readonly value="${con.FILE_NAME}"/> 
   	</div>
   	
   		<div id="showFile">
		<c:if test="${!empty con.FILE_NAME}">
		기존파일
		<input type="button" value="파일삭제" id="fileDelBtn"/>
		<br/>
		<c:choose>
				<c:when test = "${con.FILE_EXT eq 'jpg'||
							      con.FILE_EXT eq 'gif'||
							      con.FILE_EXT eq 'png'}">
				<img alt="${con.FILE_NAME}" 
				     src="resources/upload/${con.FILE_NAME}" />
				</c:when>
				<c:otherwise>
					<a href="resources/upload/${con.FILE_NAME}" download> ${con.FILE_NAME}" </a>
				</c:otherwise>
		</c:choose>
		</c:if>
	</div>

   	<div class="bbs_detail_button" >
	<input type="button" value="수정" id="changeBtn" tab="bbs_detail2"/> <!--  --> 
	<input type="button" value="삭제" id="deleteBtn" tab="bbs_detail2"/> 

   	</div>
 
</div>
</form>
</body>
</html>