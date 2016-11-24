<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/Daily/Daily.css"> --><!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.11.0.js"></script>
<title>업무 일지 글쓰기</title>
 <style type="text/css">
.main{
	width: 100%;
	height: 900px;
	background-color: black;
}
.top{
	width: 100%;
	height: 15%;
	background-color: orange;
}
.daily{
	width: 80%;
	height: 20%;
	font-size: 15pt;
	margin: 0 auto;
	background-color: yellow;
}
.cal_btn{
	width: 70%;
	text-align: center;
	margin: 0 auto;
	background-color: lime;
}
#cal_text{
	width: 100%;
	height: 30px;
}
.middle{
	width: 100%;
	height: 60%;
	background-color: aqua;
}
.mid_text{
	width: 70%;
	height: 100%;
	margin: 0 auto;
	background-color: orange;
}
#text_size{
	width: 100%;
	height: 99%;   
	text-align: center;
}
.bottom{
	width: 100%;
	height: 25%;
	background-color: red;
}
.bottom_top{
	width: 100%;
	height: 50%;
	margin: 0 auto;
	background-color: gray;
}
.btn{
	display: inline-block;
	width: 5%;
	height: 30%;
	margin-left: 95%;
	text-align: center;
	background-color: lime;
}
.bottom_bt{
	width: 100%;
	height: 50%;
	background-color: aqua;
}
.paging{
	width: 20%;
	height: 25%;
	text-align: center;
	margin: 0 auto;
	background-color: olive;
}
</style>
</head>
<body>
<div class="main">
   <div class="top">
      <div class="daily"><b>업무 일지</b></div>
      <div class="cal_btn">
         <input type="text" placeholder="날짜를 선택하세요" id="cal_text">
      </div>
   </div><hr>
   <div class="middle">
      <div class="mid_text">
         <input type="text" placeholder="내용을 입력하세요" id="text_size">
      </div>
   </div><hr/>
   <div class="bottom">
      <div class="bottom_top">
         <div class="btn">글쓰기</div>
      </div>
      <div class="bottom_bt">
         <div class="paging">이전 1 2 3 4 5 다음</div>
      </div>
   </div>
</div>
</body>
</html>