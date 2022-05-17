<%--
  Created by IntelliJ IDEA.
  User: smhrd
  Date: 2022-05-17
  Time: 오후 6:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="apple-touch-icon" sizes="76x76" href="./dashboard/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="./dashboard/assets/img/logo.png">
    <title>
        Solcaster Dashboard
    </title>
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
    <!-- Nucleo Icons -->
    <link href="./dashboard/assets/css/nucleo-icons.css" rel="stylesheet" />
    <link href="./dashboard/assets/css/nucleo-svg.css" rel="stylesheet" />
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
    <!-- CSS Files -->
    <link id="pagestyle" href="./dashboard/assets/css/material-dashboard.css?vc=3.0.0" rel="stylesheet" />

    <!-- 실시간발전량 css -->
    <link href="./dashboard/assets/css/cw.css" rel="stylesheet">

    <!-- ScoreDream 폰트 -->
    <link href="./dashboard/assets/css/font.css" rel="stylesheet" />
</head>

<body class="g-sidenav-show  bg-gray-200">
<!-- 사이드바 start -->
<aside
        class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark"
        id="sidenav-main">
    <div class="sidenav-header">
        <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
           aria-hidden="true" id="iconSidenav"></i>
        <a class="navbar-brand m-0" href="todayDashboard" target="_blank">
            <img src="./dashboard/assets/img/solcaster logo.png" class="navbar-brand-img h-100" alt="main_logo">
            <span class="ms-1 font-weight-bold text-white ScoreDream500">Solcaster Dashboard</span>
        </a>
    </div>
    <hr class="horizontal light mt-0 mb-2">
    <div class="collapse navbar-collapse  w-auto  max-height-vh-100" id="sidenav-collapse-main">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link text-white" href="todayDashboard">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons opacity-10">multiline_chart</i>
                    </div>
                    <span class="nav-link-text ms-1">Today dashboard</span>
                </a>
            </li>


            <li class="nav-item">
                <a class="nav-link text-white" href="predictDashboard">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons opacity-10">add_to_queue</i>
                    </div>
                    <span class="nav-link-text ms-1">+1 Hours dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white" href="solution">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons opacity-10">done_all</i>
                    </div>
                    <span class="nav-link-text ms-1">solution</span>
                </a>
            </li>

            <hr>
            <li class="nav-item mt-3">
                <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">Account pages</h6>
            </li>

            <li class="nav-item">
                <a class="nav-link text-white " href="dashboardLogOut">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons opacity-10">login</i>
                    </div>
                    <span class="nav-link-text ms-1">Logout</span>
                </a>
            </li>

        </ul>
    </div>

</aside>
<!-- 사이드바 end -->

<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur"
         navbar-scroll="true">
        <div class="container-fluid py-1 px-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                    <li class="fa fa-home breadcrumb-item text-sm"><a class="opacity-5 text-dark ScoreDream400"
                                                                      href="javascript:;">ㅤHOME</a></li>
                    <li class="breadcrumb-item text-sm text-dark active ScoreDream400" aria-current="page">Solution</li>
                </ol>
                <br>
                <h1 class="font-weight-bolder mb-0 ScoreDream500">Solution
                </h1>
                <br>
            </nav>
            <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
                <div class="ms-md-auto pe-md-3 d-flex align-items-center">
                    <div class="input-group input-group-outline">
                        <label class="form-label">Type here...</label>
                        <input type="text" class="form-control">
                    </div>
                </div>
                <ul class="navbar-nav  justify-content-end">
                    <li class="nav-item d-flex align-items-center">
                        <a href="dashboardLogOut" class="nav-link text-body font-weight-bold px-0">
                            <i class="fa fa-sign-out me-sm-1"></i>
                            <span class="d-sm-inline d-none">Logout</span>
                        </a>
                    </li>
                    <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
                        <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                            <div class="sidenav-toggler-inner">
                                <i class="sidenav-toggler-line"></i>
                                <i class="sidenav-toggler-line"></i>
                                <i class="sidenav-toggler-line"></i>
                            </div>
                        </a>
                    </li>

                    <li class="nav-item dropdown pe-2 d-flex align-items-center">

                        <ul class="dropdown-menu  dropdown-menu-end  px-2 py-3 me-sm-n4" aria-labelledby="dropdownMenuButton">
                            <li class="mb-2">
                                <a class="dropdown-item border-radius-md" href="javascript:;">
                                    <div class="d-flex py-1">
                                        <div class="my-auto">
                                            <img src="./dashboard/assets/img/team-2.jpg" class="avatar avatar-sm  me-3 ">
                                        </div>
                                        <div class="d-flex flex-column justify-content-center">
                                            <h6 class="text-sm font-weight-normal mb-1">
                                                <span class="font-weight-bold">New message</span> from Laur
                                            </h6>
                                            <p class="text-xs text-secondary mb-0">
                                                <i class="fa fa-clock me-1"></i>
                                                13 minutes ago
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li class="mb-2">
                                <a class="dropdown-item border-radius-md" href="javascript:;">
                                    <div class="d-flex py-1">
                                        <div class="my-auto">
                                            <img src="./dashboard/assets/img/small-logos/logo-spotify.svg"
                                                 class="avatar avatar-sm bg-gradient-dark  me-3 ">
                                        </div>
                                        <div class="d-flex flex-column justify-content-center">
                                            <h6 class="text-sm font-weight-normal mb-1">
                                                <span class="font-weight-bold">New album</span> by Travis Scott
                                            </h6>
                                            <p class="text-xs text-secondary mb-0">
                                                <i class="fa fa-clock me-1"></i>
                                                1 day
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item border-radius-md" href="javascript:;">
                                    <div class="d-flex py-1">
                                        <div class="avatar avatar-sm bg-gradient-secondary  me-3  my-auto">
                                            <svg width="12px" height="12px" viewBox="0 0 43 36" version="1.1"
                                                 xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                                <title>credit-card</title>
                                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                    <g transform="translate(-2169.000000, -745.000000)" fill="#FFFFFF" fill-rule="nonzero">
                                                        <g transform="translate(1716.000000, 291.000000)">
                                                            <g transform="translate(453.000000, 454.000000)">
                                                                <path class="color-background"
                                                                      d="M43,10.7482083 L43,3.58333333 C43,1.60354167 41.3964583,0 39.4166667,0 L3.58333333,0 C1.60354167,0 0,1.60354167 0,3.58333333 L0,10.7482083 L43,10.7482083 Z"
                                                                      opacity="0.593633743"></path>
                                                                <path class="color-background"
                                                                      d="M0,16.125 L0,32.25 C0,34.2297917 1.60354167,35.8333333 3.58333333,35.8333333 L39.4166667,35.8333333 C41.3964583,35.8333333 43,34.2297917 43,32.25 L43,16.125 L0,16.125 Z M19.7083333,26.875 L7.16666667,26.875 L7.16666667,23.2916667 L19.7083333,23.2916667 L19.7083333,26.875 Z M35.8333333,26.875 L28.6666667,26.875 L28.6666667,23.2916667 L35.8333333,23.2916667 L35.8333333,26.875 Z">
                                                                </path>
                                                            </g>
                                                        </g>
                                                    </g>
                                                </g>
                                            </svg>
                                        </div>
                                        <div class="d-flex flex-column justify-content-center">
                                            <h6 class="text-sm font-weight-normal mb-1">
                                                Payment successfully completed
                                            </h6>
                                            <p class="text-xs text-secondary mb-0">
                                                <i class="fa fa-clock me-1"></i>
                                                2 days
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->
    <div class="container-fluid py-4">
        <div class="row">
            <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                <div class="card card-c">
                    <div class="card-header p-3 pt-2">
                        <div
                                class="icon icon-lg icon-shape bg-gradient-success shadow-success text-center border-radius-xl mt-n4 position-absolute">
                            <i class="material-icons opacity-10">battery_charging_full</i>
                        </div>
                        <div class="text-end pt-1">
                            <h5 class="text-m mb-0 text-capitalize ScoreDream500">실시간 누적발전량</h5>
                            <h3 id="integratedAOD2" class="mb-0 ScoreDream500 inline">0</h3><span
                                class="text-secondary text-m font-weight-bolder">ㅤKW</span>
                        </div>
                    </div>
                    <hr class="dark horizontal my-0">
                    <div class="card-footer p-3 ScoreDream400">
                        <p class="mb-0 text-sm ScoreDream400"><span
                                class="text-secondary text-md font-weight-bolder ScoreDream400">솔캐스터
                </span>가 응용솔루션을
                            제안해드립니다</p>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="row mt-4 AOD">
        <div class="col-lg-4 col-md-6 mt-4 mb-4">
            <div class="card z-index-2 solution-card width80 marginbottom80">
                <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2 bg-transparent">
                    <div class="bg-gradient-success shadow-success border-radius-lg py-3 pe-1">
                        <!-- 여기를! if문에 넣고 돌리면 될 듯! (여기서부터)-->
                        <img src="./dashboard/assets/img/solution/ing.png" class="solution-img">


                        <div class="text_box">
                            <br>
                            <span class="text ScoreDream400 font-white"></span><span class="blink ScoreDream400 font-white">|</span>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <h5 class="mb-0 ScoreDream500"> <i class="material-icons text-m my-auto me-1">autorenew</i>ㅤ모아진 전력을 이렇게
                        활용해보세요 ⚡</h5>
                </div>
            </div>

            <!-- card end -->
        </div>
    </div>


</main>
<div class="fixed-plugin">
    <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
        <i class="material-icons py-2">settings</i>
    </a>
    <div class="card shadow-lg">
        <div class="card-header pb-0 pt-3">
            <div class="float-start">
                <h5 class="mt-3 mb-0">Dashboard Options</h5>
                <p class="ScoreDream300">대시보드 옵션을 변경할 수 있습니다.</p>
            </div>
            <div class="float-end mt-4">
                <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
                    <i class="material-icons">clear</i>
                </button>
            </div>
            <!-- End Toggle Button -->
        </div>
        <hr class="horizontal dark my-1">
        <div class="card-body pt-sm-3 pt-0">
            <!-- Sidebar Backgrounds -->

            <!-- Sidenav Type -->
            <div class="mt-3">
                <h6 class="mb-0">Sidenav Type</h6>
                <p class="text-sm">Choose between 2 different sidenav types.</p>
            </div>
            <div class="d-flex">
                <button class="btn bg-gradient-dark px-3 mb-2 active" data-class="bg-gradient-dark"
                        onclick="sidebarType(this)">Dark</button>
                <button class="btn bg-gradient-dark px-3 mb-2 ms-2" data-class="bg-transparent"
                        onclick="sidebarType(this)">Transparent</button>
                <button class="btn bg-gradient-dark px-3 mb-2 ms-2" data-class="bg-white"
                        onclick="sidebarType(this)">White</button>
            </div>
            <p class="text-sm d-xl-none d-block mt-2">You can change the sidenav type just on desktop view.</p>
            <!-- Navbar Fixed -->
            <div class="mt-3 d-flex">
                <h6 class="mb-0">Navbar Fixed</h6>
                <div class="form-check form-switch ps-0 ms-auto my-auto">
                    <input class="form-check-input mt-1 ms-auto" type="checkbox" id="navbarFixed" onclick="navbarFixed(this)">
                </div>
            </div>
            <hr class="horizontal dark my-3">
            <div class="mt-2 d-flex">
                <h6 class="mb-0">Light / Dark</h6>
                <div class="form-check form-switch ps-0 ms-auto my-auto">
                    <input class="form-check-input mt-1 ms-auto" type="checkbox" id="dark-version" onclick="darkMode(this)">
                </div>
            </div>
            <hr class="horizontal dark my-sm-4">
            <a class="btn btn-outline-dark w-100" href="">View documentation</a>

        </div>
    </div>
</div>
<!--   Core JS Files   -->
<script src="./dashboard/assets/js/core/popper.min.js"></script>
<script src="./dashboard/assets/js/core/bootstrap.min.js"></script>
<script src="./dashboard/assets/js/todayDashboard.js"></script>
<script src="./dashboard/assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="./dashboard/assets/js/plugins/smooth-scrollbar.min.js"></script>
<script src="./dashboard/assets/js/plugins/chartjs.min.js"></script>

<!-- chart -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>


<script>
    // solarEnergy = 실시간 누적발전량
    // content = 출력문구
    var solarEnergy = 0;
    // var content = "ㅤ태양광패널이 열심히 전력을 생산하고 있습니다.ㅤ";
    var content = "ㅤㅤ";
    const text = document.querySelector(".text");

    // 한 자씩 타이핑하듯이 문구 나오게 하는 코드 start
    let i = 0;

    function typing() {
        if (i < content.length) {
            let txt = content.charAt(i);
            text.innerHTML += txt;
            i++;
        }
    }
    setInterval(typing, 100);
    // end

    if (solarEnergy <= 3) {
        solutionImg = "./dashboard/assets/img/solution/ing.png";
        content = "ㅤ태양광패널이 열심히 전력을 생산하고 있습니다.ㅤ";
    } else if (solarEnergy <= 6) {
        document.querySelector(".solution-img").src = "./dashboard/assets/img/solution/1_1280x835.jpg"
        content = "ㅤ따끈따끈 전기밥솥을 5시간 사용할 수 있는 전력량이 생산됐어요ㅤ";
    } else if (solarEnergy <= 9) {
        document.querySelector(".solution-img").src = "./dashboard/assets/img/solution/2_1280x835.jpg"
        content = "ㅤ우리집을 남극으로!🐧 에어컨을 5시간 사용할 수 있는 전력량이 생산됐어요ㅤ";
    } else if (solarEnergy <= 12) {
        document.querySelector(".solution-img").src = "./dashboard/assets/img/solution/3_1280x835.jpg"
        content = "ㅤ뽀득뽀득 식기세척기를 5시간 사용할 수 있는 전력량이 생산됐어요ㅤ";
    } else if (solarEnergy <= 15) {
        document.querySelector(".solution-img").src = "./dashboard/assets/img/solution/4_1280x835.jpg"
        content = "ㅤ편리한 인덕션을 5시간 사용할 수 있는 전력량이 생산됐어요ㅤ";
    } else if (solarEnergy >= 77 && solarEnergy <= 100) {
        document.querySelector(".solution-img").src = "./dashboard/assets/img/solution/5_1280.jpg"
        content = "ㅤ1인 가구가 한 달간 사용할 수 있는 전력량이 생산됐어요ㅤ";
    } else if (solarEnergy >= 100 && solarEnergy <= 150) {
        document.querySelector(".solution-img").src = "./dashboard/assets/img/solution/6_1280.png"
        content = "ㅤ전기차를 완충할 수 있는 전력량이 생산됐어요ㅤ";
    } else if (solarEnergy >= 150 && solarEnergy <= 300) {
        document.querySelector(".solution-img").src = "./dashboard/assets/img/solution/7_1280.jpg"
        content = "ㅤ2인 가구의 한 달 전력량이 생산됐어요ㅤ";
    } else if (solarEnergy >= 300 && solarEnergy <= 900) {
        document.querySelector(".solution-img").src = "./dashboard/assets/img/solution/8_1280.jpg"
        content = "ㅤ4인 가구의 한 달 전력량이 생산됐어요ㅤ";
    } else if (solarEnergy >= 900) {
        document.querySelector(".solution-img").src = "./dashboard/assets/img/solution/8_1280.jpg"
        content = "ㅤ4인 가구의 세 달 전력량이 생산됐어요ㅤ";
    }

</script>
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script src="./dashboard/assets/js/material-dashboard.min.js?v=3.0.0"></script>
</body>

</html>