<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/month.css"/>

<div class="overflow-auto" style="max-height: 75vh">
    <div role="presentation">
        <table class="table table-sm table-bordered table-hover">
            <thead class="light-green lighten-1 black-text">
            <tr class="text-center">
                <th scope="col" style="color: orangered">일</th>
                <th scope="col">월</th>
                <th scope="col">화</th>
                <th scope="col">수</th>
                <th scope="col">목</th>
                <th scope="col">금</th>
                <th scope="col" style="color: dodgerblue">토</th>
            </tr>
            </thead>
        </table>
        <table id="monthBody" class="table table-bordered table-hover" style="margin-top: -17px">
            <tbody class="black-text text-center">
            <%--<tr style="height: 140px">
                <td class="myTd" style="width:209px; max-height: 100px; word-break: break-all; table-layout: fixed">
                    <div class="text-center">1</div>
                    <div>내용이 길어질 때 까지 확인.</div>
                </td>
                <td class="myTd" style="width:209px; max-height: 100px; word-break: break-all; table-layout: fixed">
                    <div class="text-center">1</div>
                    <div>content</div>
                </td>
                <td class="myTd" style="width:209px; max-height: 100px; word-break: break-all; table-layout: fixed">
                    <div class="text-center">1</div>
                    <div>content</div>
                </td>
                <td class="myTd" style="width:209px; max-height: 100px; word-break: break-all; table-layout: fixed">
                    <div class="text-center">1</div>
                    <div>content</div>
                </td>
                <td class="myTd" style="width:209px; max-height: 100px; word-break: break-all; table-layout: fixed">
                    <div class="text-center">1</div>
                    <div>content</div>
                </td>
                <td class="myTd" style="width:209px; max-height: 100px; word-break: break-all; table-layout: fixed">
                    <div class="text-center">1</div>
                    <div>content</div>
                </td>
                <td class="myTd" style="width:209px; max-height: 100px; word-break: break-all; table-layout: fixed">
                    <div class="text-center">1</div>
                    <div>content</div>
                </td>
            </tr>--%>
            </tbody>
        </table>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/month.js"></script>
