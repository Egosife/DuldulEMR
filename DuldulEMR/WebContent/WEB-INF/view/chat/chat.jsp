<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채팅</title>
<style type="text/css">
	.settingArea{
		display: inline-block;
		width: 400px;
		margin-top: 10px;
		margin-bottom: 10px;
		text-align: right;
	}
	.chatContents {
		display: inline-block;
		width: 400px;
		height: 400px;
		border-top: 1px solid;
		border-left: 1px solid;
		border-bottom: 1px solid;
		border-right: 1px solid;
		border-color: gray;
		word-break:break-all;
		overflow-y:auto;
		padding: 3px 3px 3px 3px;
	}
	.chat_ot {
		border-top: 1px dotted;
		border-left: 1px dotted;
		border-bottom: 1px dotted;
		border-right: 1px dotted;
		border-color: orange;
		word-break:break-all;
		margin-bottom: 10px;
		padding: 10px 10px 10px 10px;
	}
	.chat_us {
		border-top: 1px dotted;
		border-left: 1px dotted;
		border-bottom: 1px dotted;
		border-right: 1px dotted;
		border-color: blue;
		word-break:break-all;
		margin-bottom: 10px;
		padding: 10px 10px 10px 10px;
	}
	.chat_ot_nick {
		color: orange;
		font-weight: bold;
	}
	.chat_us_nick {
		color: blue;
		font-weight: bold;
	}
</style>

<!-- jQuery Script -->
<script type="text/javascript" 
		src="resources/script/jquery/jquery-1.11.0.min.js"></script>
<script type="text/javascript" 
		src="resources/script/jquery/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" 
		src="resources/script/jquery/jquery.form.js"></script>

<script type="text/javascript">
var refreshInterval = null;

$(document).ready(function() {
	refreshInterval = setInterval(read,1000);
	
	$("#insertBtn").on("click", function(){
		if($.trim($("#message").val()) == null) {
			alert("내용을 입력해 주세요.");
		} else {
			insert();
		}
	});
});

function enterCheck(){
	if(event.keyCode == 13){
		if($.trim($("#message").val()) == "") {
			alert("내용을 입력해 주세요.");
		} else {
			insert();
		}
		return;
	}
}

function out() {
	location.href = "outChat";
}

function scrollDown() {
	//$(".chatContents").prop({scrollTop:$(".chatContents").prop("scrollHeight")});
	
	$(".chatContents").animate({
		scrollTop: $(".chatContents").prop("scrollHeight") 
	}, 'slow', function () {});
}

function insert() {
	$("#contents").val($("#message").val());
	
	var params =  $("#insertForm").serialize();
	
	$.ajax({
		type : "post",
		url : "<c:url value='/insertChat'/>",
		dataType : "json",
		data : params,
		success : function(result) {
			$("#contents").val("");
			$("#message").val("");
		},
		error : function(result) {
			alert(result.errorMessage);
			$("#contents").val("");
			$("#message").val("");
		}
	});
}

function read() {
	clearInterval(refreshInterval);
	
	var params =  $("#readForm").serialize();
	
	$.ajax({
		type : "post",
		url : "<c:url value='/getChatList'/>",
		dataType : "json",
		data : params,
		success : function(result) {
			if(result.list.length != 0) {
				var str = "";
				for(var i = 0 ; i < result.list.length ; i++) {
					var cb = result.list[i];
					
					if(cb.nick == '${userNick}') {
						str += "<div class=\"chat_us\">";
						str += "<div class=\"chat_us_nick\">" + cb.nick + "[" + cb.writeDate + "]</div>";
						str += cb.contents;
						str += "</div>";
					} else {
						str += "<div class=\"chat_ot\">";
						str += "<div class=\"chat_ot_nick\">" + cb.nick + "[" + cb.writeDate + "]</div>";
						str += cb.contents;
						str += "</div>";
					}
				}
				
				$(".chatContents").append(str);
				$("#lastChatNo").val(result.list[result.list.length - 1].chatNo);
				
				if($("#autoScroll").is(":checked")) {
					scrollDown();
				}
				
			}
			
			refreshInterval = setInterval(read,1000);
		},
		error : function(result) {
			alert(result.errorMessage);
			
			refreshInterval = setInterval(read,1000);
		}
	});
}
</script>
</head>
<body>
	<form method="post" id="readForm">
		<input type="hidden" id="lastChatNo" name="lastChatNo" value="${maxNo}"/>
	</form>
	<div class="settingArea">
		<input type="button" id="outBtn" value="나가기" onclick="out();" />
		<input type="checkbox" id="autoScroll" checked="checked" />자동스크롤
	</div><br/>
	<div class="chatContents">
	</div><br/>
	<div class="settingArea">
		<form method="post" id="insertForm">
			<input type="hidden" name="nick" value="${userNick}"/>
			<input type="hidden" id="contents" name="contents" value="${userNick}"/>
		</form>
		<input type="text" id="message" size="50" onkeydown="enterCheck();"/>
		<input type="button" id="insertBtn" value="입력" />
	</div>
</body>
</html>