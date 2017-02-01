<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/bbs_detail.css" />
<script type="text/javascript" src="resources/script/bbs/bbs_detail.js"></script>
<script type="text/javascript" src="resources/script/jquery/jquery.form.js"></script>



</head>
<body>
<input type="hidden" name="sLvCode" value="${sLv_Code}"/>
<form action="#" id="bbs_detail_deleteForm"  method="post">
	<input type="hidden" name="page" value="${param.page}"/>
	<input type="hidden" name="searchText" value="${param.searchText}"/>
	<input type="hidden" name="POST_NUM" value="${param.POST_NUM}"/>
	<input type="hidden" name="empNo" value="${sEmp_Num}"/>
	<input type="hidden" name="write" value="${sEmp_Name}"/>
	

</form>

			<form action="#" id="bbs_detail_updateForm" method="post">
	  <input type="hidden" name="POST_NUM" value="${param.POST_NUM}"/>
	  <input type="hidden" name="write" value="${sEmp_Name}"/>
	  <input type="hidden" name="hospitalCode" value="${sHospital_Code}"/>
	  <input type="hidden" name="gbn" value="${sBbs_Type}"/>
      <input type="hidden" name="empNo" value="${sEmp_Num}"/>
<div class="bbs_detail_main">
   <div class="bbs_detail_top">
    	<div class="bbs_detail_top_title"><b>글 보기</b></div>
<!--  	 <div class="bbs_detail_writer">작성자</div>
 	  <div class="bbs_detail_date">등록일</div><br/> -->
    	 <div class="bbs_detail_title">제목</div>  
    

 			<div class="bbs_detail_total" style="text-align: center"> <!-- 레이아웃 상단 - 업무 날짜 선택 -->
        		<%--  <input type="text" class = "bbs_detail_writer_text" id="WritterText" readonly value="${con.WRITER}"  />
	 <input type="text" class = "bbs_detail_date_text" id="DateText" readonly value="${con.REPORTING}"/> --%>
		 <input type="text" class = "title_text" id="bbs_detail_TitleText" 
		 		name="postTitle" readonly value="${con.TITLE}"/>  

    		 </div>
    	   </div>
   				<hr> <!-- 구분선 -->	 

	  
   

    <div class="bbs_detail_mid"> 
    <div class="bbs_detail_content">글 내용</div>
    
     <div class="bbs_detail_content_text">
       		<textarea id="bbs_detail_textarea_test" class="bbs_detail_size" rows="10" cols="100" 
       			 	  name="content" readonly >${con.CONTENT}</textarea>
    </div>
  </div>
  <hr/>
   <div class="bbs_detail_bottom_bb"> 
  		 <div class="bbs_detail_1">
  		 	<c:choose>
				<c:when test="${sLv_Code == 0 || sLv_Code == 1}">
				
					<input type="button" value="수정" id="bbs_detail_changeBtn" tab="bbs_detail" class="bbs_detail_button" style="cursor:pointer"/> 
					<input type="button" value="삭제" id="bbs_detail_deleteBtn" tab="bbs_detail" class="bbs_detail_button" style="cursor:pointer"/> 
						   
				</c:when>
			</c:choose>
  		
         </div> <!-- 레이아웃 하단 - 글쓰기 버튼 -->
   </div>

   </div>
   
		</form>
		
</body>
</html>