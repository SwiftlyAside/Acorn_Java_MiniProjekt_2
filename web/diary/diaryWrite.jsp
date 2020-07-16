<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<link href="${pageContext.request.contextPath}/css/diaryWrite.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/diaryWrite.js"></script>

<div class='container Dwrite'>
    <form class='form-horizontal frm_Dwrite' id='frm_Dwrite'
          action='${pageContext.request.contextPath}/index.jsp?open=diary'>
        <div class='Dwrite_header'>
            <div class='form-group row Dwrite_headerPadding'>
                <div class='col-8 Dwrite_nonPadding'>
                    <div class='col Dwrite_nonPadding Dwrite_time' id='Dwrite_time'></div>
                </div>
                <div class='col-2'></div>
                <div class='col-2'>
                    <p class='header text-center Dwrite_weather'>맑음</p>
                </div>
            </div>
        </div>
        <div class='row_Dwrite_title'>
            <div class='form-group row'>
                <div class='col'>
                    <h4>
                        <input class='form-control Dwrite_txt_title' id='Dwrite_txt_title' type='text' name='title'
                               placeholder="제목"/>
                    </h4>
                </div>
            </div>
        </div>
        <div class='row_Dwrite_content'>
            <div class='form-group row'>
                <div class='col'>
                    <textarea id="summernote" name='content' class='form-control Dwrite_txt_txtarea'></textarea>
                </div>
            </div>
        </div>
        <div class='form-group row'>
            <div class='col Dwrite_btn'>
                <input class='btn btn-default' type='reset' value='취소'/>
                <input class='btn btn-default' id='Dwrite_okbtn' type='button' value='작성'/>
            </div>
        </div>
    </form>
</div>