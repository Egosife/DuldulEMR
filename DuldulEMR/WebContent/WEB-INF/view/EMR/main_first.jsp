<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="resources/css/EMR/main_first.css" />
<script type="text/javascript" src="resources/script/bbs/main_first.js"></script>
 


</head>
<body>
<form action="" method="post" id="main_top_notice">
	<input type="hidden" name="POST_NUM" value="${param.POST_NUM}"/>
	<input type="hidden" name="gbn" value="${gbn}"/>
	<c:choose>
		<c:when test="${empty param.page}"> <!-- 넘어오는값중에 empty면 페이지를 1로 세팅-->
			<input type="hidden" name="page" value="1"/>
		</c:when>
		<c:otherwise>
			<input type="hidden" name="page" value="${param.page}"/> <!-- empty가 아니면 이부분으로 페이지를 보여지는세팅 -->
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="searchText" value="${param.searchText}"/> 
</form>

<form action="" method="post" id="main_middle_bbs">
	<input type="hidden" name="POST_NUM" value="${param.POST_NUM}"/>
	<input type="hidden" name="gbn" value="${gbn}"/>
	<c:choose>
		<c:when test="${empty param.page}"> <!-- 넘어오는값중에 empty면 페이지를 1로 세팅-->
			<input type="hidden" name="page" value="1"/>
		</c:when>
		<c:otherwise>
			<input type="hidden" name="page" value="${param.page}"/> <!-- empty가 아니면 이부분으로 페이지를 보여지는세팅 -->
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="searchText" value="${param.searchText}"/> 
</form>

<form action="" id="main_bottom_rest" method="post">
<c:choose>
	<c:when test="${empty param.page}">
		<input type="hidden" name="page" value="1"/>
	</c:when>
	<c:otherwise>
		<input type="hidden" name="page" value="${param.page}"/>
	</c:otherwise>
</c:choose>
<input type="hidden" name="EMP_NUM" value="${sEmp_Num}"/> <!-- 직원 코드 가져오기 -->
<input type="hidden" name="HOSPITAL_CODE" value="${sHospital_Code}"/> <!-- 병원 코드 가져오기 --> 
</form>

<div class="first_main">
   <div class="first_top">
   		<div class="first_top_information"><b>공지사항</b>  
   		<input type="button" value="더보기" class="more_Btn" 
				   id="top_moreBtn" tab="notice*공지사항*notice" style="cursor:pointer"/></div>
				
   		<table class="first_top_table"  >
   		<colgroup>
   			<col style="width:10%;">
   			<col style="width:30%;">
   			<col style="width:20%; ">
   			<col style="width:20%; ">
   			<col style="width:20%; ">
   			</colgroup>
   				<thead >
					<tr >
	  					<th scope="cols">번호</th>
        			    <th scope="cols">제목</th>
         			    <th scope="cols">작성자</th>
						<th scope="cols">작성일</th>
						<th scope="cols">조회수</th>
					</tr>
				</thead>
			<tbody id="top_notice"></tbody>
				</table>
				

				
   </div>

   <div class="first_middle">
   		<div class="first_middle_information"><b>사내게시판</b>
   		<input type="button" value="더보기" class="more_Btn" 
				   id="middle_moreBtn" tab="bbs*사내게시판*bbs" style="cursor:pointer"/></div>
				   
   		
   		   		  
   		<table  class="first_middle_table" >
					<colgroup>
   			<col style="width:10%; ">
   			<col style="width:30%;">
   			<col style="width:20%; ">
   			<col style="width:20%; ">
   			<col style="width:20%; ">
   			</colgroup>
   				<thead >
					<tr >
	  					<th scope="cols">번호</th>
        			    <th scope="cols">제목</th>
         			    <th scope="cols">작성자</th>
						<th scope="cols">작성일</th>
						<th scope="cols">조회수</th>
					</tr>
				</thead>
			<tbody id="middle_bbs"></tbody>
				</table>
 </div>
   		
   	
   		
   

   <div class="first_bottom">
   		<div class="first_bottom_information"><b>휴진현황</b>
   		<input type="button" value="더보기" class="more_Btn" 
				   id="bottom_moreBtn" tab="rest_apply*휴진현황*rest_apply" style="cursor:pointer"/></div>
				    

   		<table  class="first_bottom_table" >
  
					<colgroup>
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<thead >
					<tr>
						<th>직원 번호</th>
        			    <th>성 명</th>
         			    <th>직 책</th>
						<th>진료과</th>
						<th>휴진 날짜</th>
						<th>휴진 사유</th>
					</tr>
					</thead>
			<tbody id="bottom_rest_apply"></tbody>
				</table>

	</div>
</div>

</body>
</html>