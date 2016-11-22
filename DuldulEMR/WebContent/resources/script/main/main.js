/**
 * 161122 이동건 - 메뉴 버튼 작동
 */

$(document).ready(function(){
		$("body").on("click",".main_menu_btn",function(){
			var idarr = this.id.split('_');
			if($("#"+idarr[0]).css('display') == 'none'){
				$("#"+idarr[0]).css('display','block');
			}else{
				$("#"+idarr[0]).css('display','none');
			}
		})//main_menu_btn click end
})//ready end
