<%--
  Created by IntelliJ IDEA.
  User: smhrd
  Date: 2022-05-13
  Time: 오후 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Solcaster PW check page</title>
  <link rel="stylesheet" href="css/bootstrap.min.css" />
  <link rel="stylesheet" href="./css/login_join.css" />
  <link rel="stylesheet" href="css/style.css" />



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
  <link rel="stylesheet" href="css/font.css" />

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
</nav>
<!-- Navbar End -->



<div class="container">
  <div class="input-form-backgroud row">
    <div class="input-form col-md-12">
      <a href="/">
        <img src="./img/logo.png" class="logo" />
      </a>
      <!-- 폼에 method, action 채워야 함! -->
      <form action="checkPW" method="post" class="validation-form ScoreDream400" style="align-items: center" novalidate>
        <input name="mem_id" value="${sessionScope.member.mem_id}" type="hidden"/>
        <div class="col-md-8 mb-3 margin_center">
          <label for="pw">비밀번호</label>
          <input type="password" class="form-control" name="mem_pw" id="pw" required maxlength="30" />
          <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
        </div>

        <hr class="mb-4" style="margin-top: 50px" />

        <div class="btn-groups">
          <button class="pwcheck pweBtn, btn btn-warning btn-lg" type="submit"
                  style="font-family: Font Awesome 5 Free" >
            비밀번호 확인
          </button>

        </div>
      </form>
    </div>
  </div>
  <footer class="my-3 text-center text-small"></footer>
</div>



<script>
  window.addEventListener(
          "load",
          () => {

            if(${sessionScope.member eq null}){
              alert("로그인 후 이용해주세요");
              history.back();
            }

            const forms = document.getElementsByClassName("validation-form");

            Array.prototype.filter.call(forms, (form) => {
              form.addEventListener(
                      "submit",
                      function (event) {
                        if (form.checkValidity() === false) {
                          event.preventDefault();
                          event.stopPropagation();
                        }

                        form.classList.add("was-validated");
                      },
                      false
              );
            });
          },
          false
  );
</script>
</body>

</html>
