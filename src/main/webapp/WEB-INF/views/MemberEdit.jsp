<%--
  Created by IntelliJ IDEA.
  User: smhrd
  Date: 2022-05-13
  Time: 오후 2:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Solcaster Member info modify page</title>

    <link rel="icon" type="image/png" href="/img/pagelogo.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap"
            rel="stylesheet" />
    <link rel="stylesheet" href="./css/login_join.css" />

    <!-- ScoreDream 폰트 -->
    <link rel="stylesheet" href="css/font.css" />
</head>

<body>
<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12">
            <a href="/solarpred/">
                <img src="./img/logo.png" class="logo" />
            </a>
            <!-- 폼에 method, action 채워야 함! -->
            <form class="validation-form ScoreDream400" style="align-items: center" novalidate>
                <div class="col-md-8 mb-3 margin_center">
                    <label for="name">이름</label>
                    <input type="text" class="form-control" name="mem_name" id="mem_name" required maxlength="30/" disabled />

                </div>
                <div class="col-md-8 mb-3 margin_center">
                    <label for="id">아이디</label>
                    <input type="text" class="form-control" name="mem_id" id="id" required maxlength="30" disabled />
                    <div class="invalid-feedback">아이디를 입력해주세요.</div>
                </div>
                <div class="col-md-8 mb-3 margin_center">
                    <label for="pw">비밀번호</label>
                    <input type="password" class="form-control" name="mem_pw" id="pw" required maxlength="30" />
                </div>

                <div class="col-md-8 mb-3 margin_center">
                    <label for="pwcheck">비밀번호 확인</label>
                    <input type="password" class="form-control" name="pwcheck" id="pwcheck" required maxlength="30" />
                    <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
                </div>
                <div class="col-md-8 mb-3 margin_center">
                    <label for="tel">연락처</label>
                    <input type="text" class="form-control" name="mem_phone" id="tel"
                           onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required maxlength="11" />
                    <div class="invalid-feedback">연락처를 입력해주세요.</div>
                </div>

                <div class="col-md-8 mb-3 margin_center">
                    <label for="address">주소</label>
                    <input type="text" class="form-control , col-3" id="sample6_postcode" placeholder="우편번호"
                           style="margin-bottom: 10px" readonly />
                    <input type="text" class="form-control , col-12" id="sample6_address" placeholder="주소" readonly
                           style="margin-bottom: 10px" />
                    <input type="text" class="form-control , col-12" id="sample6_detailAddress" placeholder="상세주소"
                           style="margin-bottom: 10px" />
                    <div class="addr__container">
                        <input type="button" class="daumBtn , btn btn-warning" value="우편번호 찾기" onclick="openDaumPostCode()" />
                    </div>
                </div>

                <div class="mb-4" style=" text-align: center;">
                    <button class="modify modifyBtn, btn btn-warning btn-lg" type="submit" style="margin: 0 auto">
                        정보수정
                    </button>
                    <button class="reset resetBtn, btn btn-warning btn-lg" type="submit" style="margin: 0 auto">
                        다시작성
                    </button>
                </div>
            </form>
        </div>
    </div>
    <footer class="my-3 text-center text-small"></footer>
</div>
<script src="assets/js/modify.js"></script>
<script>
    window.addEventListener(
        "load",
        () => {
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
<script>
    function openDaumPostCode() {
        new daum.Postcode({
            oncomplete: function (data) {
                var addr = "";
                var extraAddr = "";
                if (data.userSelectedType === "R") {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }
                if (data.userSelectedType === "R") {
                    if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== "" && data.apartment === "Y") {
                        extraAddr +=
                            extraAddr !== ""
                                ? ", " + data.buildingName
                                : data.buildingName;
                    }
                    if (extraAddr !== "") {
                        extraAddr = " (" + extraAddr + ")";
                    }
                    document.getElementById("sample6_detailAddress").value =
                        extraAddr;
                } else {
                    document.getElementById("sample6_detailAddress").value = "";
                }
                document.getElementById("sample6_postcode").value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            },
        }).open();
    }
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>

</html>
