<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<link href="${pageContext.request.contextPath}/css/memoWrite.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/memoWrite.js"></script>

<div class='container Rwrite'>
    <form class='form-horizontal frm_Rwrite' id='frm_Rwrite'>
        <div class='row_Rwrite_title'>
            <div class='form-group row'>
                <div class='col'>
                    <h4>
                        <input class='form-control Rwrite_txt_title' id='Rwrite_txt_title' type='text' name='title'
                               placeholder="제목"/>
                    </h4>
                </div>
            </div>
        </div>
        <div class='row_Rwrite_content'>
            <div class='form-group row'>
                <div class='col'>
                    <textarea id="summernote" name='content' class='form-control Rwrite_txt_txtarea'></textarea>
                </div>
            </div>
        </div>
        <div class='form-group row'>
            <div class='col Rwrite_btn'>
                <input class='btn btn-default' type='reset' value='취소'/>
                <input class='btn btn-default' id='Rwrite_okbtn' type='button' value='작성'/>
            </div>
        </div>
    </form>
</div>