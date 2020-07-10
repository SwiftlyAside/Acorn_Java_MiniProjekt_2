<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/week.css"/>
<div>
    <div class="row">
        <div class="col col-md-auto"></div>
        <div class="col col-md-auto"></div>
        <div class="col col-md-auto"></div>
        <div class="col col-md-auto"></div>

        <div class="col text-center font-weight-bold">일요일</div>
        <div class="col col-md-auto"></div>

        <div class="col text-center font-weight-bold">월요일</div>
        <div class="col col-md-auto"></div>

        <div class="col text-center font-weight-bold">화요일</div>
        <div class="col col-md-auto"></div>

        <div class="col text-center font-weight-bold">수요일</div>
        <div class="col col-md-auto"></div>

        <div class="col text-center font-weight-bold">목요일</div>
        <div class="col col-md-auto"></div>

        <div class="col text-center font-weight-bold">금요일</div>
        <div class="col col-md-auto"></div>

        <div class="col text-center font-weight-bold">토요일</div>
        <div class="col col-md-auto"></div>

    </div>

    <div class="row">
        <div class="col col-md-auto"></div>
        <div class="col col-md-auto"></div>
        <div class="col col-md-auto"></div>
        <div class="col col-md-auto"></div>

        <div class="col text-center">1</div>
        <div class="col col-md-auto"></div>

        <div class="col text-center">2</div>
        <div class="col col-md-auto"></div>

        <div class="col text-center">3</div>
        <div class="col col-md-auto"></div>

        <div class="col text-center">4</div>
        <div class="col col-md-auto"></div>

        <div class="col text-center">5</div>
        <div class="col col-md-auto"></div>

        <div class="col text-center">6</div>
        <div class="col col-md-auto"></div>

        <div class="col text-center">7</div>
        <div class="col col-md-auto"></div>

    </div>

    <div class="row">

        <div class="col col-md-auto"></div>
        <div class="col col-md-auto"></div>
        <div class="col col-md-auto"></div>
        <div class="col col-md-auto"></div>

        <div class="col">종일 일정 줄</div>
        <div class="col col-md-auto"></div>

        <div class="col"></div>
        <div class="col col-md-auto"></div>

        <div class="col"></div>
        <div class="col col-md-auto"></div>

        <div class="col"></div>
        <div class="col col-md-auto"></div>

        <div class="col"></div>
        <div class="col col-md-auto"></div>

        <div class="col"></div>
        <div class="col col-md-auto"></div>

        <div class="col"></div>
        <div class="col col-md-auto"></div>
    </div>
    <div class="overflow-auto" style="max-height: 552px">
        <div class="row">
            <div>
                <div class="text-right p-3">
                    <span>오전 1시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 2시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 3시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 4시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 5시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 6시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 7시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 8시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 9시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 10시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 11시</span>
                </div>
                <div class="text-right p-3">
                    <span>오전 12시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 1시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 2시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 3시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 4시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 5시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 6시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 7시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 8시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 9시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 10시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 11시</span>
                </div>
                <div class="text-right p-3">
                    <span>오후 12시</span>
                </div>
            </div>
            <div class="row">
                <div id="blankDiv" class="col"></div>
                <div id="blankDiv2" class="col"></div>
            </div>
            <div id="dayBlockDiv" class="col">
                <div id="1" class="row">
                    <div class="col">
                        <div class="row">
                            <%-- 독립적인 div가 되려면 id부여 후 관리해야함..--%>
                            <div class="col task">타이틀은 id로 컨트롤</div>
                            <div class="col task">타이틀이 길어지면 어떡하죠?</div>
                        </div>
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                    <div class="col">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--    <script src="${pageContext.request.contextPath}/js/week.js"></script>--%>
