<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal" style="height: 70%">
	<input type='text' id='sample6_postcode' class="frm-chk" placeholder='우편번호'>
	<input type='button' onclick='sample6_execDaumPostcode()' value='우편번호 찾기'><br>
	<input type='text' id='sample6_address' class="frm-chk" placeholder='주소'><br>
	<input type='text' id='sample6_detailAddress' class="frm-chk" placeholder='상세주소'>
	<input type='text' id='sample6_extraAddress' class="frm-chk" placeholder='참고항목'>
	<input type='text' id='sample6_name' class="frm-chk" placeholder='받는사람 이름'>
	<input type='text' id='sample6_phonecall' class="frm-chk" placeholder='받는사람 전화번호'>
	<br><br>
	<input type="hidden" readonly="readonly" class="frm-chk" value="${member.id}">
	<button id="addressInsert">우편번호 등록</button>
</div>