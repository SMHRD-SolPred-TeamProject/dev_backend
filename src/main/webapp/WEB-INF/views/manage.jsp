<%--
  Created by IntelliJ IDEA.
  User: smhrd
  Date: 2022-05-06
  Time: 오후 3:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 문자열 자르는 함수 사용 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta charset="utf-8">
    <title>☀ SolCaster - Solar Power Monitoring System</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="./img/pagelogo.png" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">--%>

    <!-- ScoreDream 폰트 -->
    <link href="css/font.css" rel="stylesheet" />

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<%--    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>--%>


    <style>
        html{
            /*overflow: hidden;*/
        }

        body {
            color: #566787;
            font-family: "Open Sans", sans-serif;
            background: #f5f5f5;
        }
        .table-responsive {
            margin: 30px 0;
        }
        .table-wrapper {
            min-width: 1000px;
            background: #fff;
            padding: 20px 25px;
            border-radius: 3px;
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }
        .table-title {
            padding-bottom: 15px;
            background: #fddaa7;
            color: #fff;
            padding: 16px 30px;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }
        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }
        .table-title .btn {
            color: #566787;
            float: right;
            font-size: 13px;
            background: #fff;
            border: none;
            min-width: 50px;
            border-radius: 2px;
            border: none;
            outline: none !important;
            margin-left: 10px;
        }
        .table-title .btn:hover, .table-title .btn:focus {
            color: #566787;
            background: #f2f2f2;
        }
        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }
        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }
        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }
        table.table tr th:first-child {
            width: 60px;
        }
        table.table tr th:last-child {
            width: 100px;
        }
        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }
        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }
        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }
        table.table td:last-child i {
            opacity: 0.9;
            font-size: 22px;
            margin: 0 5px;
        }
        table.table td a {
            font-weight: bold;
            color: #566787;
            display: inline-block;
            text-decoration: none;
        }
        table.table td a:hover {
            color: #fddaa7;
        }
        table.table td a.settings {
            color: #fddaa7;
        }
        table.table td a.delete {
            color: #F44336;
        }
        table.table td i {
            font-size: 19px;
        }
        table.table .avatar {
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }
        .status {
            font-size: 30px;
            margin: 2px 2px 0 0;
            display: inline-block;
            vertical-align: middle;
            line-height: 10px;
        }
        .text-success {
            color: #10c469;
        }
        .text-warning {
            color: #FFC107;
        }
        .text-danger {
            color: #ff5b5b;
        }
        .pagination {
            float: right;
            margin: 0 0 5px;
        }
        .pagination li a {
            border: none;
            font-size: 13px;
            min-width: 30px;
            min-height: 30px;
            color: #999;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 2px !important;
            text-align: center;
            padding: 0 6px;
        }
        .pagination li a:hover {
            color: #666;
        }
        .pagination li.active a, .pagination li.active a.page-link {
            background: #fddaa7;
        }
        .pagination li.active a:hover {
            background: #0397d6;
        }
        .pagination li.disabled i {
            color: #ccc;
        }
        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }
        .hint-text {
            float: left;
            margin-top: 10px;
            font-size: 13px;
        }

         #update {
             font-weight: bold;
             color: #10c469;
             display: inline-block;
             text-decoration: none;
         }

         .update_hover {
             cursor: pointer;
         }
    </style>


    <script>
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</head>

<body>
<!-- Spinner Start -->
<div id="spinner"
     class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-border text-primary" style="width: 3rem; height: 3rem" role="status">
        <span class="sr-only">Loading...</span>
    </div>
</div>
<!-- Spinner End -->


<!-- Topbar Start -->
<div class="container-fluid bg-dark p-0">
    <div class="row gx-0 d-none d-lg-flex">
        <div class="col-lg-7 px-5 text-start">
            <div class="h-100 d-inline-flex align-items-center me-4">
                <small class="fa fa-map-marker-alt text-primary me-2"></small>
                <small>Yesul-gil 31-15, Gwangju, KOREA</small>
            </div>
            <div class="h-100 d-inline-flex align-items-center">
                <small class="far fa-clock text-primary me-2"></small>
                <small>Mon - Fri : 09.00 AM - 18.00 PM</small>
            </div>
        </div>
        <div class="col-lg-5 px-5 text-end">
            <div class="h-100 d-inline-flex align-items-center me-4">
                <small class="fa fa-phone-alt text-primary me-2"></small>
                <small>+10 1234 5678</small>
            </div>
            <div class="h-100 d-inline-flex align-items-center mx-n2">
                <a
                        class="btn btn-square btn-link rounded-0 border-0 border-end border-secondary"
                        href=""
                ><i class="fab fa-facebook-f"></i
                ></a>
                <a
                        class="btn btn-square btn-link rounded-0 border-0 border-end border-secondary"
                        href=""
                ><i class="fab fa-twitter"></i
                ></a>
                <a
                        class="btn btn-square btn-link rounded-0 border-0 border-end border-secondary"
                        href=""
                ><i class="fab fa-linkedin-in"></i
                ></a>
                <a class="btn btn-square btn-link rounded-0" href=""
                ><i class="fab fa-instagram"></i
                ></a>
            </div>
        </div>
    </div>
</div>
<!-- Topbar End -->

<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
    <a
            href="/solarpred/"
            class="navbar-brand d-flex align-items-center border-end px-4 px-lg-5"
    >
        <img src="./img/logo.png" class="logo" />
    </a>
    <button
            type="button"
            class="navbar-toggler me-4"
            data-bs-toggle="collapse"
            data-bs-target="#navbarCollapse"
    >
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto p-4 p-lg-0">
            <c:choose>
                <c:when test="${sessionScope.member != null}">
                    <c:if test="${sessionScope.member.getMem_type() eq 'Y'}">
                        <a href="goManage" class="nav-item nav-link">MANAGE</a>
                    </c:if>
                    <a href="myprofile" class="nav-item nav-link">MY PROFILE</a>
                </c:when>
            </c:choose>
            <a href="about" class="nav-item nav-link">About</a>
            <a href="boardList" class="nav-item nav-link">Service</a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Solution</a>
                <div class="dropdown-menu bg-light m-0">
                    <a href="smartEnergy" class="dropdown-item">Smart Energy</a>
                    <a href="smartFarm" class="dropdown-item">Smart Farm</a>
                    <a href="smartStation" class="dropdown-item">Smart Station</a>
                </div>
            </div>
            <c:choose>
                <c:when test="${sessionScope.member == null}">
                    <a href="goLoginForm" class="nav-item nav-link">LOGIN</a>
                </c:when>
                <c:otherwise>
                    <a href="goLogOut" class="nav-item nav-link">LOGOUT</a>
                </c:otherwise>
            </c:choose>
            <a
                    href="/solarpred/"
                    class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block"
                    id="btn-home"
            >HOME<i class="fa fa-arrow-right ms-3"></i
            ></a>
        </div>
    </div>
</nav>
<!-- Navbar End -->

<!-- 회원관리 start -->
<div class="container-xl">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-5">
                        <h2>회원 <b>관리</b></h2>
                    </div>
                    <div class="col-sm-7">

                    </div>
                </div>
            </div>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>주소</th>
                    <th>연락</th>
                    <th>구매여부</th>
                    <th>가입일</th>

                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="list" items="${list}" >
                    <tr>
                        <td>${list.mem_id}</td>
                        <td class="name">${list.mem_name}</td>
                        <td>${list.mem_addr}</td>
                        <td>${list.mem_phone}</td>
                        <td>
                            <div class="form-row align-items-center">
                                <div class="col-auto my-1">
                                    <label class="mr-sm-2 sr-only" for="inlineFormCustomSelect"></label>
                                    <select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                        <c:set var="mem_purchase" value="${list.mem_purchase}" />
                                        <<c:choose>
                                            <c:when test="${mem_purchase eq 'Y'}">
                                                <option selected value="Y">구매</option>
                                                <option value="N">미구매</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="Y">구매</option>
                                                <option selected value="N">미구매</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </div>
                            </div>
                        </td>

                        <td>${fn:substring(list.mem_joindate,0,10)}</td>
                        <td>
                            <a href="goMemDelete?mem_id=${list.mem_id}" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>
                            <a onclick="getValue('${list.mem_id}')" id="update" class="update update_hover" title="Update" data-toggle="tooltip"><i class="material-icons">&#xe876;</i></a>                        </td>
<%--                            <a href="goPurchaseUpdate?mem_id=${list.mem_id}" id="update" class="update" title="Update" data-toggle="tooltip"><i class="material-icons">&#xe876;</i></a>                        </td>--%>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="clearfix">
                <%-- 좌측 페이지 숫자와 현재 페이지 표시 --%>
                <c:choose>
                    <c:when test="${param.page eq null}">
                        <div class="hint-text">Showing <b>1</b> out of <b>${paging.endPage}</b> entries</div>
                    </c:when>
                    <c:otherwise>
                        <div class="hint-text">Showing <b>${param.page}</b> out of <b>${paging.endPage}</b> entries</div>
                    </c:otherwise>
                </c:choose>

                <ul class="pagination">
                    <%-- 이전 버튼 --%>
                    <c:if test="${paging.prev}">
                        <li class="page-item">
                            <a class="page-link" href="#"/>" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <%-- 페이지 숫자 --%>
                    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
                        <li class="page-item"><a class="page-link" href="<c:url value="/goManage?page=${num}"/>">${num}</a></li>
                    </c:forEach>

                    <%-- 다음 버튼 --%>
                    <c:if test="${paging.next && paging.endPage>0}">
                        <li class="page-item">
                            <a class="page-link" href="#"/>" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>

                </ul>
            </div>
        </div>
    </div>
</div>
<!-- 회원관리 end -->


<!-- Footer Start -->
<div
        class="container-fluid bg-dark text-body footer mt-5 pt-5 wow fadeIn"
        data-wow-delay="0.1s"
>
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-3 col-md-6">
                <h5 class="text-white mb-4">Address</h5>
                <p class="mb-2">
                    <i class="fa fa-map-marker-alt me-3"></i>Yesul-gil 31-15, Gwangju,
                    KOREA
                </p>
                <p class="mb-2">
                    <i class="fa fa-phone-alt me-3"></i>+10 1234 5678
                </p>
                <p class="mb-2">
                    <i class="fa fa-envelope me-3"></i>chaewon6400@gmail.com
                </p>
                <div class="d-flex pt-2">
                    <a class="btn btn-square btn-outline-light btn-social" href=""
                    ><i class="fab fa-twitter"></i
                    ></a>
                    <a class="btn btn-square btn-outline-light btn-social" href=""
                    ><i class="fab fa-facebook-f"></i
                    ></a>
                    <a class="btn btn-square btn-outline-light btn-social" href=""
                    ><i class="fab fa-youtube"></i
                    ></a>
                    <a class="btn btn-square btn-outline-light btn-social" href=""
                    ><i class="fab fa-linkedin-in"></i
                    ></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 quick-links">
                <h5 class="text-white mb-4">Quick Links</h5>
                <a class="btn btn-link" href="/solarpred/">HOME</a>
                <a class="btn btn-link" href="about">About Us</a>
                <c:choose>
                    <c:when test="${sessionScope.member == null}">
                        <a class="btn btn-link" href="goLoginForm">Login</a>
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-link" href="goLogOut">Logout</a>
                    </c:otherwise>
                </c:choose>
                <a class="btn btn-link" href="service">Our Services</a>
            </div>
            <div class="col-lg-3 col-md-6">
                <h5 class="text-white mb-4">Project Gallery</h5>
                <div class="row g-2">
                    <div class="col-4">
                        <img class="img-fluid rounded" src="img/gallery-1.jpg" alt="" />
                    </div>
                    <div class="col-4">
                        <img class="img-fluid rounded" src="img/gallery-2.jpg" alt="" />
                    </div>
                    <div class="col-4">
                        <img class="img-fluid rounded" src="img/gallery-3.jpg" alt="" />
                    </div>
                    <div class="col-4">
                        <img class="img-fluid rounded" src="img/gallery-4.jpg" alt="" />
                    </div>
                    <div class="col-4">
                        <img class="img-fluid rounded" src="img/gallery-5.jpg" alt="" />
                    </div>
                    <div class="col-4">
                        <img class="img-fluid rounded" src="img/gallery-6.jpg" alt="" />
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 vertical-center">
                <a
                        href="/solarpred/"
                >
                    <img src="./img/logo.png" class="footer-logo" />
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Footer End -->


<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/wow/wow.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/counterup/counterup.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/isotope/isotope.pkgd.min.js"></script>
<script src="lib/lightbox/js/lightbox.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
<script>

    function getValue(mem_id) {
        console.log($("#inlineFormCustomSelect").val())
        let purchase_val = $("#inlineFormCustomSelect").val();
        $.ajax({
            url : "/solarpred/purchaseUpdate",
            type : "get",
            data : {"mem_id":mem_id, "mem_purchase":purchase_val},
            success : function() {
                location.reload();
            },
            error : function(){
                alert("error");
            }
        });
    }
    function test(mem_id) {
        console.log(mem_id)
    }
</script>

</body>

</html>