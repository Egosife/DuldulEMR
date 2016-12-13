<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/EMR/rest_apply.css"><!-- 레이아웃 -->
<title>휴진 현황</title>
<script type="text/javascript">
$(document).ready(function(){
	my_rest_List();
	
	$("#insertBtn").on("click",function(){ /* 글쓰기 버튼을 누르면 */
		Open_Tab(this); // 탭을 오픈한다
	}); //insertBtn end
	
	$("#pagingArea").on("click","span",function(){ //페이징을 클릭하면
		$("input[name='page']").val($(this).attr("name"));
		my_rest_List();
	}); //pagingArea end
	
	$("#tv").on("click","tr",function(){ //글을 클릭하면
		Open_Tab(this); //탭을 오픈한다
	}); //tb end
});//ready end
function my_rest_List(){
	var params = $("#RestApplyForm").serialize();
	
	$.ajax({
		type : "post",
		url : "my_rest_List",
		dataType : "json",
		data : params,
		success : function(result){
			var html="";
			for(var i=0; i<result.list.length; i++){
				html += "<tr name='"+result.list[i].SERIAL_NUM+"' value='"+result.list[i].SERIAL_NUM+"' tab='rest?TURN="+result.list[i].SERIAL_NUM+"*윤희상*rest'>";
				html += "<td>"+result.list[i].SERIAL_NUM+"</td>"; //날짜
				html += "<td>"+result.list[i].START_DATE||' ~ '||END_DATE+"</td>"; //일차
				html += "<td>"+result.list[i].R_REASON+"</td>"; //날짜
				html += "<td>"+result.list[i].R_CHECK+"</td>"; //내용
				html += "</tr>";
			}
			$("#tv").html(html); //내용 데이터 가져오기
			
			//페이징 처리 단계
			html="";
			html += "<span name='1'> 처음  </span>";
			
			if($("input[name='page']").val()==1){
				html += "<span name='1'> 이전 </span>"; 
			}else{
				html += "<span name='"+($("input[name='page']").val()-1)+"'> 이전  </span>";
			}
			
			for(var i=result.pb.startPcount; i<=result.pb.endPcount; i++){
				if(i==$("input[name='page']").val()){
					html += "<span name='"+ i +"'><b>"+ i +"</b></span>";
				}else{
					html += "<span name='"+ i +"'>"+ i +"</span>";
				}
			}
			if($("input[name='page']").val()==result.pb.maxPcount){
				html += "<span name='"+result.pb.maxPcount+"'> 다음 </span>";
			}else{
				html += "<span name='"+($("input[name='page']").val() * 1 + 1)+"'> 다음 </span>";
			}
			html +="<span name='"+result.pb.maxPcount+"'> 마지막 </span>";
			$("#pagingArea").html(html);
		},
		error : function(result){
			alert("error!!");
		}
	}); //ajax 끝
} 
</script>
</head>
<body>
<form action="" id="RestApplyForm" method="post">
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
<div class="rest_apply_main">
	<div class="rest_apply_top">
		<div class="rest_apply_request"><b>나의 신청 현황 및 기록</b></div>
		<div class="rest_apply_top_table">
			<div class="rest_apply_lay_table">
				<table border="1" class="rest_apply_set_table">
					<colgroup>
						<col style="width: 15%;">
						<col style="width: 25%;">
						<col style="width: 50%;">
						<col style="width: 10%;">
					</colgroup>
					<tr>
						<td>휴진 신청일</td>
						<td>휴진 기간</td>
						<td>휴진 신청 사유</td>
						<td>승인 여부</td>
					</tr>
					<tbody id="tv"></tbody>
				</table>
			</div><hr/>
		</div>
		<div class="rest_apply_btn_lay">
			<div class="rest_apply_btn_btn">
				<input type="button" value="신청" class="rest_apply_btn_btn_civa" id="insertBtn" tab='rest*휴진신청*rest'>
			</div>
		</div>
		<div class="rest_apply_top_pag">
			<div class="rest_apply_paging" id="pagingArea"></div>
		</div><hr/>
	</div>
	<div class="rest_apply_bottom">
		<div class="rest_apply_rest"><b>휴진 현황</b></div>
		<div class="rest_apply_text">
			<div class="rest_apply_rrr">
				<div class="rest_apply_ilsi">일 시
					<input type="text" readonly class="rest_apply_box">
				</div>
				<div class="rest_apply_ilsi">진료과
						<select name="keyField" class="rest_apply_drop">
		         			<option value="title">선 택</option>
		         			<option value="title">진료과0</option>
		         			<option value="title">진료과1</option>
		         			<option value="title">진료과2</option>
		         		</select>
				</div>
				<div class="rest_apply_ilsi">직 책
						<select name="keyField" class="rest_apply_drop">
		         			<option value="title">선 택</option>
		         			<option value="title">직책0</option>
		         			<option value="title">직책1</option>
		         			<option value="title">직책2</option>
		         		</select>
				<input type="button" value="검색" class="rest_apply_btn_btn_siva">
				</div>
			</div>
		</div>
		<div class="rest_apply_btm_table">
			<div class="rest_apply_btm_t">
				<table border="1" class="rest_apply_set_table">
					<colgroup>
						<col style="width: 10%;">
						<col style="width: 5%;">
						<col style="width: 10%;">
						<col style="width: 10%;">
						<col style="width: 15%;">
						<col style="width: 50%;">
					</colgroup>
					<tr>
						<td>직원 번호</td>
						<td>성 명</td>
						<td>직 책</td>
						<td>진료과</td>
						<td>휴진 날짜</td>
						<td>휴진 사유</td>
					</tr>
				</table>			
			</div>
		</div>
		<div class="rest_apply_btm_pag">
			<div class="rest_apply_bt_paging">1 2 3 4 5</div>
		</div>
	</div>
</div>
</body>
</html>