<%@page import="DTO.RecordsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DAO.RecordsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/css/diaryWrite.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/diaryWrite.js"></script>

<div class='container Dwrite'>
	<form class='form-horizontal frm_Dwrite'>
		<div class='Dwrite_header'>
			<div class='form-group row Dwrite_headerPadding'>
				<div class='col'>
					<div class='col Dwrite_time' id='Dwrite_time'></div>
				</div>
				<div class='col'>
					<div class='row-2'>
						<p class='header text-right Dwrite_headerPadding'>맑음</p>
						<p class='header text-right'>컨디션</p>
					</div>	
				</div>
			</div>
		</div>
		<div class='row_Dwrite_title'>
			<div class='form-group row'>
				<div class='col'>
					<h4>
						<input class='form-control Dwrite_txt_title' id='Dwrite_txt_title' type='text' placeholder="제목"/>
					</h4>
				</div>
			</div>
		</div>
		<div class='row_Dwrite_content'>
			<div class='form-group row'>
				<div class='col'>
					<textarea id="summernote" class='form-control Dwrite_txt_txtarea'></textarea>
				</div>
			</div>
		</div>
		<div class='form-group row'>
			<div class='col Dwrite_btn'>
				<input class='btn btn-default' type='reset' value='취소' />
				<input class='btn btn-default' id='Dwrite_okbtn' type='button' value='작성' />
			</div>
		</div>
	</form>
</div>