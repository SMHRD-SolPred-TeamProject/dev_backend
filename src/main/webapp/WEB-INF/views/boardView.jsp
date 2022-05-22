<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: smhrd
  Date: 2022-05-10
  Time: 오전 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

<!-- Main start -->

<div id="main" class="ScoreDream400">

    <br />

    <br /><br />
    <div class="container" id="board-view">
        <h1>Customer Service</h1>
        <p style="text-align: center">도움이 필요하신가요?</p>
        <br>

        <!-- Write Main -->
        <!-- Main -->
        <div class="board-btn-group" role="group" aria-label="Basic outlined example">
            <button type="button" class="btn btn-primary" onClick="location.href='boardList'">전체목록</button>
            <!-- 이 수정 삭제 버튼은 관리자나 글쓴 사람한테만 보여야 할 것 같아요 -->
            <c:if test="${vo.mem_id == sessionScope.member.mem_id}">
                <button type="button" class="btn btn-outline-primary" onclick="location.href='boardUpdateForm?seq=${vo.qna_seq}'">수정</button>
                <button type="button" class="btn btn-outline-primary" onclick="location.href='boardDelete?seq=${vo.qna_seq}'">삭제</button>
            </c:if>
        </div>

        <br>
        <br>
        <br>
        <br>

        <%-- 글 부분 start --%>
        <header class="major">
            <h4 style="text-align: left">제목 : <c:out value="${vo.qna_title}" /></h4>
            <br>
            <h6 style="text-align: left; margin-bottom: 1%" class="content-writer ScoreDream500">작성자 : <c:out value="${vo.mem_id}" /></h6>
        </header>
        <hr style="margin-top: 0" />
        <p id="main-content">
            <c:out value='${fn:replace(vo.qna_content, replaceChar, "<br/>")}' escapeXml="false"/>
        </p>
        <hr/>
        </section>
        <%-- 글 부분 end --%>

        <section class="main accent2">
            <header class="major" style="text-align: left">
                <br>
                <h4>답글</h4>
                <c:if test="${sessionScope.member.mem_type == 'N'}">
                    <p id="main-content">답글은 관리자 고유권한입니다.</p>
                </c:if>
            </header>


            <%-- 댓글 start --%>
            <table id="list">
                <c:forEach var="list" items="${list}">
                    <tr>
                        <td><c:out value='${fn:replace(list.reply_content, replaceChar, "<br/>")}' escapeXml="false"/></td>
                        <td>${list.reply_date}</td>
                    </tr>
                </c:forEach>
            </table>

            <form method="post" id="frm" class="combined" style="width: auto">
                <input type="hidden" name="reply_id" value="${sessionScope.member.mem_id}">
                <input type="hidden" name="qna_seq" value="${vo.qna_seq}">
                <c:choose>
                    <c:when test="${sessionScope.member.mem_type.equals('Y')}">
                        <div class="form-floating mt-3">
                            <textarea id="reply_content" class="form-control" name="reply_content" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px"></textarea>
                            <label for="floatingTextarea2">Comments</label>
                        </div>
                        <br>
                        <button id="register" type="button" class="btn btn-write btn-outline-primary" onclick="replyInsert()">등록</button>
                    </c:when>
                    <c:otherwise>
                        <div class="form-floating" style="display: none">
                            <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" style="height: 200px"></textarea>
                            <label for="floatingTextarea2">Comments</label>
                        </div>
                        <button id="register" type="submit" class="btn btn-write btn-outline-primary" onclick="" style="display: none">등록</button>
                    </c:otherwise>
                </c:choose>
            </form>
            <%-- 댓글 end --%>
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

<!-- 비동기 자바스크립트 -->
<script>
    $(function (){
        loadReply();
    });

    //url 자르는 함수
    function getURLParams(url) {
        var result = {};
        url.replace(/[?&]{1}([^=&#]+)=([^&#]*)/g, function(s, k, v) { result[k] = decodeURIComponent(v); });
        return result;
    }
    //uri 파라미터 변수
    let seq_uri = getURLParams(location.search)['seq'];


    //댓글 불러오기
    function loadReply(){
        $.ajax({
            url : "reply?seq="+seq_uri,
            type : "get",
            dataType : "json",
            success : replyView,
            error : function(){
                alert("error")
            }
        });
    }

    //댓글 작성하기 함수
    function replyInsert(){
        const data = $("#frm").serialize();

        $.ajax({
            url : "boardReply",
            type : "post",
            data : data,
            success : loadReply,
            error : function(){
                alert("error")
            }
        });

        // 댓글 등록 후 댓글창 비우기
        $("#reply_content").val("");

    }

    // 비동기방식으로 댓글 불러와서 출력
    function replyView(data){
        let result = "";
        $.each(data,(index,vo)=>{
            result += "<tr class='reply"+'${vo.qna_seq}'+"'><td id='content"+vo.reply_seq+"' class='pt-3'>";
            result += data[index]['reply_content'].replace(/\n/g, '<br/>');
            result += "</td></tr>";
            result += "<tr class='reply"+'${vo.qna_seq}'+"'><td>";
            result += data[index]['reply_date'];
            result += "</td>";
            if(${sessionScope.member.mem_id eq vo.mem_id}){
                result += "<td style='padding-left: 10px'>";
                result += "<button id='btnE"+vo.reply_seq+"' class='btn btn-outline-primary btn-sm' type='button' onclick='replyUpdate("+vo.reply_seq+")'>수정</button>";
                result += "<button id='btnD"+vo.reply_seq+"' class='btn btn-outline-primary btn-sm' type='button' onclick='replyDelete("+vo.reply_seq+")' style='margin-left:3px'>삭제</button>";
                result += "</td>";
            }
            result += "</tr>";
        });
        $("#list").html(result);
    }


    // 댓글 삭제
    function replyDelete(reply_seq){
        $.ajax({
            url : "replyDelete",
            type : "get",
            data : {"reply_seq":reply_seq},
            success : loadReply,
            error : function(){
                alert("error");
            }
        });
    }

    // 댓글 수정 형태로 변경
    function replyUpdate(reply_seq){
        // 기본 댓글 내용을 변수에 담기
        let content = $("#content"+reply_seq).text();

        $("#btnE"+reply_seq).css("display","none");
        $("#btnD"+reply_seq).css("display","none");

        $("#content"+reply_seq).html("<input id='editInput"+reply_seq+"' class='form-control' name='reply_content' type='text' value='"+content+"'>" +
            "<button class='btn btn-outline-primary btn-sm' type='button' onclick='replyUpdate1("+reply_seq+")'>등록</button>" +
            "<button class='btn btn-outline-primary btn-sm' type='button' style='margin: 3px' onclick='loadReply()'>취소</button>");
    }

    // 댓글 수정 기능
    function replyUpdate1(reply_seq){
        let reply_content = $("#editInput"+reply_seq).val();
        console.log(reply_content);
        $.ajax({
            url : "replyUpdate",
            type : "post",
            data : {"reply_seq":reply_seq, "reply_content":reply_content},
            success : loadReply,
            error : function(){
                alert("error");
            }
        });
    }





</script>

</body>

</html>