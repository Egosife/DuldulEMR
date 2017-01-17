function makePopup(title, contents) {
	var html = "";
	html += "<div class=\"bg_div\"></div>                                         ";
	html += "<div class=\"popup_div\">                                            ";
	html += "	<div class=\"popup_title\">                                       ";
	html += "		<div class=\"popup_title_text\">" + title + "</div>           ";
	html += "	</div>                                                            ";
	html += "	<div class=\"popup_contents\">                                    ";
	html += "		<div class=\"popup_text\">" + contents + "</div>              ";
	html += "		<div class=\"popup_btn\">                                     ";
	html += "			<input type=\"button\" class=\"btn_ok\" value=\"닫기\"/>   ";
	html += "		</div>                                                        ";
	html += "	</div>                                                            ";
	html += "</div>                                                               ";
	
	$("body").prepend(html);
	
	$(".btn_ok").focus();
	
	$(".bg_div").hide();
	$(".popup_div").hide();
	
	$(".bg_div").fadeIn();
	$(".popup_div").fadeIn();
	
	
	$(".btn_ok").off("click");
	$(".btn_ok").on("click", function(){
		closePopup();
	});
	
	$(".bg_div").off("click");
	$(".bg_div").on("click", function(){
		closePopup();
	});
}

function closePopup() {
	$(".bg_div").fadeOut(function(){
		$(".bg_div").remove();
	});
	
	$(".popup_div").fadeOut(function(){
		$(".popup_div").remove();
	});
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
/* 2016-20-21 이관우 개발(추가, 수정) */

function Es_makePopup2(title, contents) {
	var html = "";
	html += "<div class=\"Es_bg_div\"></div>";
	html += "<div class=\"Es_popup_div\">";
		html += "<div class=\"Es_popup_title\">";
			html += "<div class=\"Es_popup_title_text\">" + title + "</div>";
		html += "</div>";
		html += "<div class=\"Es_popup_contents\">";
			html += "<div class=\"Es_popup_text\">" + contents + "</div>";
			html += "<div class=\"Es_popup_btn\">";
				html += "<input type=\"button\" class=\"Es_btn_ok\" value=\"확인\" style=\"border-right: 1px solid #ccc;\"/>";
				html += "<input type=\"button\" class=\"Es_btn_close\" value=\"닫기\"/>";
			html += "</div>";
		html += "</div>";
	html += "</div>";
	
	$("body").prepend(html);
	
	$(".Es_btn_close").focus();
	
	$(".Es_bg_div").hide();
	$(".Es_popup_div").hide();
	
	$(".Es_bg_div").fadeIn();
	$(".Es_popup_div").fadeIn();
	
	$(".Es_btn_close").off("click");
	$(".Es_btn_close").on("click", function(){
		Es_closePopup2();
	});
	
	$(".Es_bg_div").off("click");
	$(".Es_bg_div").on("click", function(){
		Es_closePopup2();
	});
}

function Es_closePopup2() {
	$(".Es_bg_div").fadeOut(function(){
		$(".Es_bg_div").remove();
	});
	
	$(".Es_popup_div").fadeOut(function(){
		$(".Es_popup_div").remove();
	});
}