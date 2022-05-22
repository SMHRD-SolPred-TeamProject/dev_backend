<%--
  Created by IntelliJ IDEA.
  User: smhrd
  Date: 2022-05-09
  Time: 오후 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="icon" type="image/png" href="./img/pagelogo.png" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap"
            rel="stylesheet" />

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet" />
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
    <!-- ScoreDream 폰트 -->
    <link href="css/font.css" rel="stylesheet" />

    <style>
        <%-- 스크롤바 숨기기 --%>
        body{-ms-overflow-style:none; }
        body::-webkit-scrollbar { display:none; }
    </style>

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
                <a class="btn btn-square btn-link rounded-0 border-0 border-end border-secondary" href=""><i
                        class="fab fa-facebook-f"></i></a>
                <a class="btn btn-square btn-link rounded-0 border-0 border-end border-secondary" href=""><i
                        class="fab fa-twitter"></i></a>
                <a class="btn btn-square btn-link rounded-0 border-0 border-end border-secondary" href=""><i
                        class="fab fa-linkedin-in"></i></a>
                <a class="btn btn-square btn-link rounded-0" href=""><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </div>
</div>
<!-- Topbar End -->

<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
    <a href="/" class="navbar-brand d-flex align-items-center border-end px-4 px-lg-5">
        <img src="./img/logo.png" class="logo" />
    </a>
    <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
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
            <a href="/" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block" id="btn-home">HOME<i
                    class="fa fa-arrow-right ms-3"></i></a>
        </div>
    </div>
</nav>
<!-- Navbar End -->

<div id="main" class="ScoreDream400">


    <br/>

    <br/><br/>
    <div class="container" id="board-list">
        <h1>Customer Service</h1>
        <p>도움이 필요하신가요?</p>
        <br>

        <!-- Write Main -->
        <section class="checkout spad">
            <div class="container">
                <div class="checkout__form">

                    <%-- 글쓰기 폼 start --%>
                    <form name="insertform" action="boardWriteForm" method="post">
                        <%-- <input type="hidden" name="command" value="qnaInsert">--%>
                        <input type="hidden" name="mem_id" value="${sessionScope.member.mem_id}">
                        <div class="row">
                            <div class="col-lg-12 col-md-6">
                                <br><br>
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div class="checkout__input">
                                            <h6>
                                                제목
                                                <span>
                            *
                          </span>
                                            </h6>

                                            <input data-testid="input-box" id="inquiry-subject" name="qna_title" placeholder="제목을 입력해주세요"
                                                   type="text" height="44" class="boardWrte-title" value="">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="checkout__input">
                                            <h6>
                                                카테고리
                                                <span>
                            *
                          </span>
                                            </h6>
                                            <div>
                                                <select class="form-select" aria-label="Default select example" name="qna_cat">
                                                    <option selected>문의 유형을 선택해주세요</option>
                                                    <option value="구매문의">구매문의</option>
                                                    <option value="기술문의">기술문의</option>
                                                    <option value="AS문의">AS문의</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="input-div" style="padding: 50px 0px 0px 10px;">
                                        <div class="checkout__input_2">
                                            <h6>
                                                글 내용
                                                <span>
                            *
                          </span>
                                            </h6>
                                            <div class="form-floating">
                          <textarea class="form-control" name="qna_content" placeholder="Leave a comment here" id="floatingTextarea2"
                                    style="height: 250px"></textarea>
                                                <label for="floatingTextarea2">Comments</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <button type="submit" class="btn btn-write btn-outline-primary" onClick="boardWriteForm">
                                    등록
                                </button>
                            </div>
                        </div>
                    </form>
                    <%-- 글쓰기 폼 end --%>

                </div>
            </div>
        </section>


    </div>
</div>

<!-- Footer Start -->
<div class="container-fluid bg-dark text-body footer mt-5 pt-5 wow fadeIn" data-wow-delay="0.1s">
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
                    <a class="btn btn-square btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-square btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-square btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                    <a class="btn btn-square btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 quick-links">
                <h5 class="text-white mb-4">Quick Links</h5>
                <a class="btn btn-link" href="/">HOME</a>
                <a class="btn btn-link" href="/">About Us</a>
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
                <a href="/">
                    <img src="./img/logo.png" class="footer-logo" />
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Footer End -->
<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>

<script src="./Document_files/jquery.min.js.다운로드"></script>
<script type="text/javascript" src="./Document_files/bootstrap.js.다운로드"></script>

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

<script>
    window.onload = () => {
        if(${sessionScope.member eq null}){
            alert("로그인 후 이용해주세요");
            history.back();
        }
    }
</script>

</body>

</html>