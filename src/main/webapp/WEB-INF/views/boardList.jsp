<%--
  Created by IntelliJ IDEA.
  User: smhrd
  Date: 2022-05-07
  Time: 오후 4:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>

<%-- 문자열 자르는 함수 사용 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- 개행 문자 설정 --%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
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
<div id="main">

    <br />

    <br /><br />
    <div class="container ScoreDream400" id="board-list">
        <h1>Customer Service</h1>
        <p>도움이 필요하신가요?</p>
        <br>
        <div class="search-window">

            <%-- 검색어 입력 폼 start --%>
            <form id="searchForm" onsubmit="loadSearchList()">
                <div class="search-wrap">
                    <input id="search" type="search" name="qna_title" placeholder="검색어를 입력해주세요.">
                    <button type="button" id="searchBtn" class="btn btn-primary">검색</button>
                </div>
            </form>
            <%-- 검색어 입력 폼 end --%>

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
                    <th width="5%">번호</th>
                    <th width="65%">제목</th>
                    <th width="10%">글쓴이</th>
                    <th width="15%">작성일</th>
                    <th width="5%">조회</th>
                </tr>
                </thead>
                <tbody id="tbodyBoardList">
                <c:forEach var="list" items="${list}" >
                    <tr>
                        <td>${list.qna_seq}</td>
                        <td><a href="/solarpred/boardView?seq=${list.qna_seq}&qna_cat=${list.qna_cat}&session_mem_id=${sessionScope.member.mem_id}"><b>[${list.qna_cat}]</b> ${list.qna_title}</a></td>
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
            <ul id="paging" class="pagination btn-movepage justify-content-center">

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
            error : function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
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

    // 검색버튼 클릭했을 때 이벤트 발생
    $("#searchBtn").on("click",function (){
        let qna_title = $("#search").val();

        // 검색어없이 검색버튼을 클릭했을 때 아래 문구 alert창 출력
        if(qna_title == ""){
            alert("검색어를 입력해주세요!");
            return false;
        }

        $("#search").val("");
        loadSearchList(qna_title);
    });

    // 검색된 게시글 불러오기
    function loadSearchList(qna_title){
        $.ajax({
            url : "/solarpred/boardSearch?qna_title="+qna_title,
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
        let pagingResult = "";
        let data2 = data;

        // for (const x in data) {
        //     console.log(data[x]);
        // }

        // 페이징 데이터 변수
        let pagingData = data.pop();
        // console.log(pagingData['test'])
        // console.log(data)
        let valId = '<c:out value="${sessionScope.member.mem_id}"/>';
        // 게시글 반복 출력 부분
        $.each(data,(index,vo)=>{
            // console.log("data type = " + typeof(data));
            // console.log("data type0 = " + typeof(data[0]));
            // console.log("data =" +data);
            // console.log("index = " + index);
            // console.log("vo = " + vo);
            // console.log("vo = " + vo.qna_title);
            //console.log("Object.keys(data) = " + Object.keys(data));
            result += "<tr>";

            result += "<td>";
            result += vo.qna_seq;
            result += "</td>";

            result += "<td>";
            result += '<a href="/solarpred/boardView?seq='+vo.qna_seq+'&session_mem_id='+valId+'"><b>['+vo.qna_cat+']</b> '+vo.qna_title+'</a>';
            result += "</td>";

            result += "<td>";
            result += vo.mem_id;
            result += "</td>";

            result += "<td>";
            result += vo.qna_date.substring(0,10);
            result += "</td>";

            result += "<td>";
            result += vo.qna_cnt;
            result += "</td>";

            result += "</tr>";
        });

        //console.log(pagingData['test'].totalCount)
        //console.log(pagingData['test'].prev)



        // 하단 페이징 숫자 버튼 출력 부분
        // 이전버튼 부분
        if(pagingData['test'].prev){
            pagingResult += '<li class="page-item">';
            pagingResult += '<a class="page-link" href="<c:url value="/boardList?page=${paging2.startPage-1}"/>" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>';
            pagingResult += '</li>';
        }

        console.log("pagingData = "+ pagingData)
        console.log("pagingData['test'] = "+ pagingData['test'])
        console.log("pagingData['test'].startPage = "+ pagingData['test'].startPage)
        console.log("pagingData['test'].endPage = " + pagingData['test'].endPage)

        // 페이지 숫자 부분
        for(var num = pagingData['test'].startPage;num <= pagingData['test'].endPage;num++){
            pagingResult += '<li class="page-item">';
            pagingResult += '<a class="page-link" href="/solarpred/category2?page2='+num+'&qna_cat=구매문의">'+num+'</a>';
            <%--pagingResult += `<a class="page-link" href="<c:url value="/boardList?page=${num}"/>${num+1}</a>`;--%>
            pagingResult += '</li>';
        }

        // 다음버튼 부분
        if(pagingData['test'].next){
        <%--pagingResult += '<c:if test="${paging2.next && paging.endPage>0}">';--%>
        pagingResult += '<li class="page-item">';
        pagingResult += '<a class="page-link" href="<c:url value="/boardList?page=${paging2.endPage+1}"/>" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>';
        pagingResult += '</li>';
        <%--pagingResult += '</c:if>';--%>
        }

        // 게시글내용을 tbody태그에 추가
        $("#tbodyBoardList").html(result);
        // 페이지 처리부분을 하단 ul태그에 추가
        $("#paging").html(pagingResult);
    }

</script>
</body>
</html>

