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
$(document).ready(function(){
		$("#cancleBtn").on("click", function(){
			
			$("#actionForm").attr("action","bbs_detail");
			$("#actionForm").submit();			
		});
		
		$("#changeBtn").on("click", function(){
			 if(confirm("글을 수정하시겠습니까?")){
			     var updateForm = $("#updateForm");
			      updateForm.ajaxForm(uploadResultCallBack);
			     
			      updateForm.submit(); 
			  }     
			 });
			}); 

		function uploadResultCallBack(data, result){ //result가 뭐냐면 ajax결과임(success 인지 fail인지),,,,data는 json받은거임
			if(result == "success"){ //결과가 성공이네.......그럼 json을 자바스크립트 bean으로 만든다
				var resData = eval("(" + removePre(data) + ")");
				if(resData.fileName[0] !=null){
				$("#FileText").val(resData.fileName[0]);
				}
				var params = $("#updateForm").serialize();//serialize는 전송하기쉽게 데이터를 정리해놓은것 
				
				$.ajax({
					type : "post",
					url : "updateTest",
					dataType : "json",
					data : params,
					success : function(result){
						if(result.res> 0){
							$("#actionForm").attr("action","bbs_detail");
							$("#actionForm").submit();			
						}else{
							alert("수정 중 문제가 발생했습니다.")
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
<div class="bbs_detail_wrap">
<form action="#" id="actionForm"  method="post">
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" name="searchText" value="${param.searchText}"/>
	<input type="hidden" name="POST_NUM" value="${param.POST_NUM}"/>
	
	<input type="hidden" name="writer" value="${con.WRITER}"/>
	<input type="hidden" name="title" value="${con.TITLE}"/>
	<input type="hidden" name="content" value="${con.CONTENT}"/>
</form>

<form action="fileUploadAjax" id="updateForm" method="post" enctype="multipart/form-data">
     
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
   		제목 <input type="text" id="TitleText"  value="${con.TITLE}"/> 
   </div>
   
   <div class="bbs_detail_content">
   <textarea id="textarea_test" rows="30" cols="125" name="contents"  > ${con.CONTENT}</textarea>
	</div>
	
	  <div class="bbs_detail_file" >
   		첨부파일 <input type="file" id="FileText" readonly value="${con.FILE_NAME}"/> 
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
	  	<div class="bbs_detail_button" style="text-align:right">
   		<input type="button" value="수정" id="changeBtn"/>

   		<input type="button" value="취소" id="cancleBtn"/>
   	</div>
</form>
 
 
</div>

</body>
</html>