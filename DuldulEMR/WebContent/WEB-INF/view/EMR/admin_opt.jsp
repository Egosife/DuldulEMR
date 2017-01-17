<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 2016-11-28 이동건 제작 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/opt/admin_opt.css"><!-- 레이아웃 -->
<script type="text/javascript" src="resources/script/opt/admin_opt.js"></script> <!-- 자바 스크립트 -->
<title>Admin Option</title>
</head>

<body>
<input type="hidden" name="admin_opt_hosclick" id="admin_opt_hosclick">
<input type="hidden" name="admin_search_hos" id="admin_search_hos_hidden">
<div class="admin_opt_main">
<!-- 상단 -->
	<div class="admin_opt_top">
		<div class="admin_opt_maintitle">관리자 옵션</div>
		<div class="admin_opt_title">병원과 계정정보</div>
		<div class="admin_opt_tablediv">
			<div style="text-align: right;">
			<span id="admin_hos_searchinfo">병원정보를 입력하여 검색 할 수 있습니다.</span>
				<span>
				<input type="text" id="admin_search_hos" ><!-- <input type="button" id="admin_search_hosbtn" value="검색"> -->
				</span>
			</div>
			<table class="admin_opt_table">
			<colgroup>
				<col style="width: 10%">
				<col style="width: 20%">
				<col style="width: 15%">
				<col style="width: 40%">
				<col style="width: 15%">
			</colgroup>
				<thead>
					<tr>
						<th>병원코드</th>
						<th>병원이름</th>
						<th>연락처</th>
						<th>주소</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody id="admin_opt_hospital_tb"></tbody>
			</table>
		</div>
		<div class="admin_opt_tablediv">
			<table class="admin_opt_table">
				<div>좌측 병원명을 클릭하면 정보를 출력합니다.</div>
			<colgroup>
				<col style="width: 12%">
				<col style="width: 10%">
				<col style="width: 15%">
				<col style="width: 15%">
				<col style="width: 10%">
				<col style="width: 10%">
				<col style="width: 10%">
				<col style="width: 8%">
				<col style="width: 10%">
			</colgroup>
				<thead>
					<tr>
						<th>계정등급</th>
						<th>직원번호</th>
						<th>이름</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>직책</th>
						<th>진료과</th>
						<th>성별</th>
						<th>활성화</th>
					</tr>
				</thead>
				<tbody id="admin_opt_emp_tb"></tbody>
			</table>
		</div>
	</div>
<!-- 중단 -->
	<div class="admin_opt_mid">
		<div class="admin_opt_title">병원편집</div>
		<div class="admin_opt_midcontentupd">
			<form class="admin_form" action="#" method="post" id="adminopt_hos_update">
				<div class="admin_hos_updatediv">
					위 병원정보를 클릭하면 수정 할 수 있습니다.
					<hr>
					병원코드<input type="text" id="admin_opt_hoscod_updname" name="admin_opt_hoscod" readonly="readonly">
					병원이름<input type="text" id="admin_opt_hos_updname" name="admin_opt_hosname">
					<!-- <input type="button" value="병원검색" id="admin_opt_updasarch"> -->
					주소<input type="text" id="admin_opt_upd_addr" readonly="readonly" name="admin_opt_hosaddr"><input type="button" value="주소검색" id="amdin_update_addr_search">
					연락처<input type="text" size="3" maxlength="3" id="upd_phone1">-<input type="text" size="3" maxlength="4" id="upd_phone2">-<input type="text" size="3" maxlength="4" id="upd_phone3">
					<input type="hidden" id="admin_upd_phone" name="admin_upd_phone">
					<input type="button" value="수정" id="admin_opt_updhos">
				</div>
				<div style="color: red; display: none;" id="alerthoscode">병원 코드는 수정이 불가 합니다.</div>
			</form>
		</div>
		<div class="admin_opt_title">병원등록</div>
		<div class="admin_opt_midcontentregi">
			<form class="admin_form" action="#" method="post" id="adminopt_hos_register">
			모든 항목은 필수 입력입니다.
			<hr>
			병원이름<input type="text" name="cre_hodname" id="cre_hodname">
			<!-- <input type="button" value="중복검사" id="admin_opt_insertchck"> -->
			주소<input type="text" id="admin_insert_addr_text" readonly="readonly" name="cre_hodaddr"><input type="button" value="주소검색" id="amdin_insert_addr_search">
			연락처<input type="text" size="3" maxlength="3" id="cre_phone1">-<input type="text" size="3" maxlength="4" id="cre_phone2">-<input type="text" size="3" maxlength="4" id="cre_phone3">
			<input type="hidden" id="admin_cre_phone" name="cre_phone">
			<input type="button" value="등록" id="admin_opt_creathos">
			</form>
		</div>
	</div>
<!-- 하단 -->
	<div class="admin_opt_bot">
		<div class="admin_opt_title">계정 등록</div>
		<div class="admin_opt_botcontent">
			<form class="admin_form" action="#" method="post" id="adminopt_acc_register">
			<input type="hidden" name="admin_searchresult_hos" id="admin_searchresult_hos">
			<input type="hidden" name="admin_accphonenum" id="admin_accphonenum">
				<table class="admin_opt_creatacc_table">
					<tr>
						<td>*병원 선택</td>
						<td><input type="text" disabled="disabled" id="regiacchostext"></td>
						<td><input type="button" value="검색" id="admin_acc_serachhos"></td>
						<td colspan="3" style="color: red;">' * ' 모양이 있는 부분은 필수 입력 부분입니다.</td>
					</tr>
					<tr>
						<td>
							*계정번호
						</td>
						<td>
							<input type="text" class="id_chk_class" name="admin_regi_id" id="admin_regi_id">
						</td>
						<td>
							<!-- <input type="button" value="중복검사" id="admin_regi_id_chk"> -->
						</td>
						<td>
							*비밀번호
						</td>
						<td>
							<input type="password" name="admin_regi_pass" id="admin_regi_pass1">
						</td>
						<td>
							*비밀번호확인
						</td>
						<td>
							<input type="password" id="admin_regi_pass2">
						</td>
						<td>
							생년월일
						</td>
						<td>
							<input type="text" name="admin_regi_btday" readonly="readonly" id="admin_regi_btday">
						</td>
					</tr>
					<tr>
						<td>
							*이름
						</td>
						<td>
							<input type="text" name="admin_regi_name">
						</td>
						<td></td>
						<td>
							*연락처
						</td>
						<td>
							<input type="text" size="3" maxlength="3" id="reg_phone1">-<input type="text" size="3" maxlength="4" id="reg_phone2">-<input type="text" size="3" maxlength="4" id="reg_phone3">
						</td>
						<td>
							이메일
						</td>
						<td>
							<input type="text" name="admin_regi_email" id="admin_regi_email">
						</td>
						<td>
							주소
						</td>
						<td>
							<input type="text" name="admin_regi_addr" id="admin_regi_addr" readonly="readonly"><input type="button" id="admin_regi_addrbtn" value="검색">
						</td>
					</tr>
					<tr>
						<td>
							성별
						</td>
						<td>
							<select name="admin_regi_sex">
								<option value="-1" selected="selected">선택</option>
								<option value="0">여성</option>
								<option value="1">남성</option>
							</select>
						</td>
						<td></td>
						<td>
							*직책
						</td>
						<td>
							<select name="adm_pos_sel" id="adm_pos_sel"></select>
						</td>
						<td>
							*진료과
						</td>
						<td>
							<select name="adm_off_sel" id="adm_off_sel"></select>
						</td>
						<td>
							*등급
						</td>
						<td>
							<select name="adm_lev_sel" id="adm_lev_sel"></select>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="admin_opt_buttons">
			<input type="button" value="다시쓰기" id="RegiAccCrear">
			<input type="button" value="등록" disabled="disabled" id="admin_create_acc_commit">
		</div>
	</div>
</div>
</body>
</html>