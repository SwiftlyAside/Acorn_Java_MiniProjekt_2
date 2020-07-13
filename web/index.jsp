<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String open = request.getParameter("open");
    if (open == null) open = "";
    String jsClass = open;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>index</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Material icons -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css"/>
    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <link href="https://fonts.googleapis.com/css2?family=Julius+Sans+One&display=swap" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/css/mdb.min.css" rel="stylesheet">
    <!-- JQuery -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>

    <!-- DatePicker -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.standalone.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

    <!-- moment core JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/moment@2.27.0/moment.min.js"></script>

    <!-- stopWatch -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timecircles/1.5.3/TimeCircles.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/timecircles/1.5.3/TimeCircles.min.js"></script>

    <!-- FullCalendar core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.1.0/main.min.css">

    <!-- include summernote css/js -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

    <script src="${pageContext.request.contextPath}/js/index.js"></script>
    <link href="${pageContext.request.contextPath}/css/style.min.css" rel="stylesheet">
</head>
<body class="light-green lighten-5">
<!--Main Navigation-->
<header>
    <!-- Sidebar -->
    <div class="sidebar-fixed position-fixed">
        <a class="logo-wrapper justify-content-center light-green-text" href="?"
           style="font-family: 'Julius Sans One', sans-serif; font-size: 36pt">Diary</a>

        <div class="list-group list-group-flush">
            <form class="list-group-item d-flex justify-content-center">
                <!-- Default input -->
                <input id="searchText" aria-label="Search" class="form-control" placeholder="Search" type="search">
                <button class="btn btn-primary btn-sm my-0 p btn-light-green" id="searchButton" type="button">
                    <i class="fas fa-search"></i>
                </button>
            </form>
            <a class="list-group-item list-group-item-action waves-effect" href="?open=login">
                <i class="fas fa-sign-in-alt mr-3"></i>로그인</a>
            <a class="list-group-item list-group-item-action waves-effect" href="?open=diary">
                <i class="fas fa-book mr-3"></i>다이어리</a>
            <a class="list-group-item list-group-item-action waves-effect" href="?open=explorer">
                <i class="fab fa-wpexplorer mr-3"></i>탐색기</a>
            <a class="list-group-item list-group-item-action waves-effect"
               href="?open=calendar">
                <i class="far fa-calendar mr-3"></i>달력</a>
            <a class="list-group-item list-group-item-action waves-effect" id="readerAnchor" data-toggle="modal" data-target=".bd-example-modal-xl" href="#">
                <i class="fas fa-book-reader mr-3"></i>모아보기</a>
            <div class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-xl modal-custom">
                    <div class="modal-content modal-custom-content" id="reader">
                    </div>
                </div>
            </div>
        </div>

        <div id="timeLineDiv"></div>

    </div>
    <!-- Sidebar -->
</header>
<!--Main Navigation-->

<!--Main layout-->
<main class="mx-lg-4">
    <div class="container-fluid pt-4">
        <!-- Heading -->
        <div class="card mb-4 wow fadeIn <%=jsClass%>" id="mainContainer" style="height: 88vh">
            <!--Card content-->
            <div class="card-body">
                Main Page
            </div>

        </div>
        <!-- Heading -->
    </div>
</main>
<!--Main layout-->

<!--footer-->
<footer class="page-footer font-small">
    <div class="footer-copyright text-center py-3">© 2020 Copyright: An Acorn Academy Project Team</div>
</footer>
<!--footer-->
</body>
</html>
