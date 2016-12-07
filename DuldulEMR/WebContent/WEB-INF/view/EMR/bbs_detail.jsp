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
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>
<script type="text/javascript">


//목록 버튼 클릭했을시
var updateFlag = false;

$(document).ready(function(){

		
		$("#changeBtn").on("click", function(){
		//	 $("#actionForm").attr("action","bbs_detail_modify");
			//$("#actionForm").submit();	 
			//Open_Tab(this);
			if(updateFlag){
				updateFlag = false;
				$("#changeBtn").attr("value","수정");
				$("#TitleText").attr("readonly", "readonly");
				$("#textarea_test").attr("readonly", "readonly");
				
			}else{
				updateFlag = true;
				$("#changeBtn").attr("value","완료");
				$("#TitleText").removeAttr("readonly");
				$("#textarea_test").removeAttr("readonly");
			}
			
		});
		
		$("#deleteBtn").on("click", function(){
			var coca = $(this);
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
							Close_Tab(coca);
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

</script>
</head>
<body>
<form action="#" id="deleteForm"  method="post">
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" name="searchText" value="${param.searchText}"/>
	<input type="text" name="POST_NUM" value="${param.POST_NUM}"/>
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
   <textarea id="textarea_test" rows="30" cols="125" name="contents" readonly >${con.CONTENT}</textarea>
	</div>
	
	  <div class="file" >
   		첨부파일 <input type="text" id="FileText"readonly value="${con.FILE_NAME}"/> 
   	</div>
   	
   	<div class="button" >
   		<input type="button" value="수정" id="changeBtn" tab="bbs_detail_modify*글수정*bbs_detail_modify" /> <!--  -->
   		<input type="button" value="삭제" id="deleteBtn" tab="bbs_detail"/>

   	</div>
 
</div>

</body>
</html>