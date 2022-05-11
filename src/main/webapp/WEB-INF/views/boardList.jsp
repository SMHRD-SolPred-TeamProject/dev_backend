<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: smhrd
  Date: 2022-05-07
  Time: 오후 4:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- 문자열 자르는 함수 사용 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>☀ SolCaster - Solar Power Monitoring System</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/style.css" />
    <meta content="" name="keywords" />
    <meta content="" name="description" />

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap"
            rel="stylesheet"
    />

    <!-- Icon Font Stylesheet -->
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
            rel="stylesheet"
    />
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
            rel="stylesheet"
    />

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet" />
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet" />

    <!-- ScoreDream 폰트 -->
    <link
            href="css/font.css"
            rel="stylesheet"
    />
</head>
<body>
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
            href="index.html"
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
                <c:when test="${sessionScope.member == null}">
                    <a href="goLoginForm" class="nav-item nav-link">LOGIN</a>
                </c:when>
                <c:otherwise>
                    <c:if test="${sessionScope.member.getMem_type() eq 'Y'}">
                        <a href="goManage" class="nav-item nav-link">MANAGE</a>
                    </c:if>
                    <a href="goLogOut" class="nav-item nav-link">LOGOUT</a>
                </c:otherwise>
            </c:choose>
            <a href="about.html" class="nav-item nav-link">About</a>
            <a href="/solarpred/boardList" class="nav-item nav-link">Service</a>
            <div class="nav-item dropdown">
                <a
                        href="#"
                        class="nav-link dropdown-toggle"
                        data-bs-toggle="dropdown"
                >Solution</a
                >
                <div class="dropdown-menu bg-light m-0">
                    <a href="smartEnergy.html" class="dropdown-item">Smart Energy</a>
                    <a href="smartFarm.html" class="dropdown-item">Smart Farm</a>
                    <a href="smartStation.html" class="dropdown-item">Smart Station</a>
                </div>
            </div>
            <a
                    href="index.html"
                    class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block"
                    id="btn-home"
            >HOME<i class="fa fa-arrow-right ms-3"></i
            ></a>
        </div>
</nav>
<!-- Navbar End -->
<div id="main">

    <br />

    <br /><br />
    <div class="container ScoreDream400" id="board-list">
        <h1>Customer Service</h1>
        <p>도움이 필요하신가요?</p>
        <br>
        <div class="search-window">
            <form action="">
                <div class="search-wrap">
                    <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                    <button type="submit" class="btn btn-primary">검색</button>
                </div>
            </form>
        </div>
        <br><br>
        <ul class="nav justify-content-end">
            <li class="nav-item">
                <button class="nav-link active" type="button" onclick="loadBoardList()" style="outline: 0;border: 0;background: none;">전체보기</button>
            </li>
            <li class="nav-item">
                <button class="nav-link active" type="button" onclick="loadCategoryList('구매문의')" style="outline: 0;border: 0;background: none;">구매문의</button>
            </li>
            <li class="nav-item">
                <button class="nav-link active" type="button" onclick="loadCategoryList('기술문의')" style="outline: 0;border: 0;background: none;">기술문의</button>
            </li>
            <li class="nav-item">
                <button class="nav-link active" type="button" onclick="loadCategoryList('AS문의')" style="outline: 0;border: 0;background: none;">AS문의</button>
            </li>

        </ul>

        <%-- 게시판 start --%>
        <form action="/solarpred/boardList" method="get">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>작성일</th>
                    <th>조회</th>
                </tr>
                </thead>
                <tbody id="tbodyBoardList">
                <c:forEach var="list" items="${list}" >
                    <tr>
                        <td>${list.qna_seq}</td>
                        <td><a href="/solarpred/boardView?seq=${list.qna_seq}"><b>[${list.qna_cat}]</b> ${list.qna_title}</a></td>
                        <td>${list.mem_id}</td>
                        <td>
                                ${fn:substring(list.qna_date,0,10)}
                        </td>
                        <td>${list.qna_cnt}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
        <%-- 게시판 end --%>

        <button type="button" class="btn btn-write btn-outline-primary"  onClick="location.href='/solarpred/boardWrite'">글작성</button>
        <br><br>

        <%-- 게시판하단 페이징 버튼 start --%>
        <nav aria-label="Page navigation example">
            <ul class="pagination btn-movepage justify-content-center">

                <%-- 이전 버튼 --%>
                <c:if test="${paging.prev}">
                    <li class="page-item">
                        <a class="page-link" href="<c:url value="/boardList?page=${paging.startPage-1}"/>" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>

                </c:if>

                <%-- 페이지 숫자 --%>
                <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
                    <li class="page-item"><a class="page-link" href="<c:url value="/boardList?page=${num}"/>">${num}</a></li>
                </c:forEach>

                <%-- 다음 버튼 --%>
                <c:if test="${paging.next && paging.endPage>0}">
                    <li class="page-item">
                        <a class="page-link" href="<c:url value="/boardList?page=${paging.endPage+1}"/>" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>

            </ul>
        </nav>
        <%-- 게시판하단 페이징 버튼 end --%>

    </div>
</div>

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
                <a class="btn btn-link" href="index.html">HOME</a>
                <a class="btn btn-link" href="about.html">About Us</a>
                <c:choose>
                    <c:when test="${sessionScope.member == null}">
                        <a class="btn btn-link" href="goLoginForm">Login</a>
                    </c:when>
                    <c:otherwise>
                        <a class="btn btn-link" href="goLogOut">Logout</a>
                    </c:otherwise>
                </c:choose>
                <a class="btn btn-link" href="service.html">Our Services</a>
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
                        href="index.html"
                >
                    <img src="./img/logo.png" class="footer-logo" />
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Footer End -->
<!-- Back to Top -->
<a
        href="#"
        class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"
><i class="bi bi-arrow-up"></i
></a>

<script src="./Document_files/jquery.min.js.다운로드"></script>
<script
        type="text/javascript"
        src="./Document_files/bootstrap.js.다운로드"
></script>

</script>
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

<%-- 비동기 --%>
<script>

    // 전체 게시글 불러오기
    function loadBoardList(){
        $.ajax({
            url : "/solarpred/loadBoardList",
            type : "get",
            dataType : "json",
            success : loadList,
            error : function(){
                alert("error")
            }
        });
    }

    // 선택된 카테고리 게시글 불러오기
    function loadCategoryList(qna_cat){
        $.ajax({
            url : "/solarpred/category?category="+qna_cat,
            type : "get",
            dataType : "json",
            success : loadList,
            error : function(){
                alert("error")
            }
        });
    }

    // 게시글 출력
    function loadList(data){
        let result = "";

        $.each(data,(index,vo)=>{
            console.log("vo.qna_seq : " + vo.qna_seq);
            result += "<tr>";

            result += "<td>";
            result += vo.qna_seq;
            result += "</td>";

            result += "<td>";
            result += '<a href="/solarpred/boardView?seq='+vo.qna_seq+'"><b>['+vo.qna_cat+']</b> '+vo.qna_title+'</a>';
            result += "</td>";

            result += "<td>";
            result += vo.mem_id;
            result += "</td>";

            result += "<td>";
            result += vo.qna_date;
            result += "</td>";

            result += "<td>";
            result += vo.qna_cnt;
            result += "</td>";

            result += "</tr>";
        });

        $("#tbodyBoardList").html(result);
    }

</script>
</body>
</html>

