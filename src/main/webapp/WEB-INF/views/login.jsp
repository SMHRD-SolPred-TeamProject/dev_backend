<%--
  Created by IntelliJ IDEA.
  User: smhrd
  Date: 2022-05-04
  Time: 오전 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Solcaster login page</title>

    <link rel="icon" type="image/png" href="./img/pagelogo.png" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap"
            rel="stylesheet" />
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="stylesheet" href="./css/login_join.css" />

    <!-- ScoreDream 폰트 -->
    <link rel="stylesheet" href="css/font.css" />
    <style>
        <%-- 스크롤바 숨기기 --%>
        body{-ms-overflow-style:none; }
        body::-webkit-scrollbar { display:none; }
    </style>

</head>
<body>
<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12">
            <a href="/">
                <img src="./img/logo.png" class="logo"/>
            </a>

            <!-- 폼에 method, action 채워야 함! -->
            <form action="login" class="validation-form" style="align-items: center" novalidate method="post">
                <div class="col-md-8 mb-3 margin_center">
                    <div class="invalid-feedback">이름을 입력해주세요.</div>
                </div>

                <div class="col-md-8 mb-3 margin_center">
                    <label for="id">아이디</label>
                    <input type="text" class="form-control" name="mem_id" id="id" required maxlength="30"/>
                    <div class="invalid-feedback">아이디를 입력해주세요.</div>
                </div>

                <div class="col-md-8 mb-3 margin_center">
                    <label for="pw">비밀번호</label>
                    <input type="password" class="form-control" name="mem_pw" id="pw" required maxlength="30"/>
                    <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                </div>

                <hr class="mb-4" style="margin-top: 50px"/>

                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="aggrement" required/>
                </div>

                <div class="btn-groups">
                    <button id="btnLogin" class="login loginBtn, btn btn-warning btn-lg" type="submit">로그인</button>
                    <button class="join-l joinBtn, btn btn-warning btn-lg" type="button"
                            onClick="location.href='join'">가입하기
                    </button>
                </div>
            </form>

        </div>
    </div>
    <footer class="my-3 text-center text-small"></footer>
</div>
<script src="assets/js/join.js"></script>


<script>
    window.onload = () => {
        if(${member2.mem_id eq "null"}){
            alert("일치하는 정보가 없습니다.");
        }else if(${member2.mem_id eq "nullnull"}){
            alert("아이디 또는 비밀번호를 입력해주세요.");
        }
    }
</script>

<%--<script>--%>
<%--    window.addEventListener(--%>
<%--        "load",--%>
<%--        () => {--%>
<%--            const forms = document.getElementsByClassName("validation-form");--%>

<%--            Array.prototype.filter.call(forms, (form) => {--%>
<%--                form.addEventListener(--%>
<%--                    "submit",--%>
<%--                    function (event) {--%>
<%--                        if (form.checkValidity() === false) {--%>
<%--                            event.preventDefault();--%>
<%--                            event.stopPropagation();--%>
<%--                        }--%>

<%--                        form.classList.add("was-validated");--%>
<%--                    },--%>
<%--                    false--%>
<%--                );--%>
<%--            });--%>
<%--        },--%>
<%--        false--%>
<%--    );--%>
<%--</script>--%>

</body>
</html>
