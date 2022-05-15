<%--
  Created by IntelliJ IDEA.
  User: smhrd
  Date: 2022-05-15
  Time: 오후 1:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>dashboard login</title>
<%--    <link rel="stylesheet" href="/assets/css/dashboard.css" />--%>
<%--    <link rel="stylesheet" href="/assets/css/font.css" />--%>
<%--    <link rel="icon" type="image/png" href="../assets/img/logo.png">--%>
    <link rel="stylesheet" href="./dashboard/assets/css/dashboard.css" />
    <link rel="stylesheet" href="./dashboard/assets/css/font.css" />
    <link rel="icon" type="image/png" href="./dashboard/assets/img/logo.png">
</head>

<body>

<div class="wrap">
    <div class="form-wrap">
        <div class="button-wrap">
            <div id="btn"></div>
            <button type="button" class="togglebtn ScoreDream400">LOG IN</button>
        </div>
        <div class="social-icons">
            <img src="./dashboard/assets/img/dashboard/apple.png" alt="apple" />
            <img src="./dashboard/assets/img/dashboard/tw.png" alt="twitter" />
            <img src="./dashboard/assets/img/dashboard/gl.png" alt="google" />
        </div>

        <form id="login" action="dashboardLogin" method="post" class="input-group">
            <input type="text" name="mem_id" class="input-field ScoreDream400" placeholder="User Id" required />
            <input type="password" name="mem_pw" class="input-field ScoreDream400" placeholder="Enter Password" required />
            <input type="checkbox" class="checkbox" /><span class="ScoreDream400">Remember Me</span>
            <button class="submit ScoreDream400">Login</button>
        </form>

    </div>
</div>

<script>

    window.onload = () => {
        if(${member.mem_purchase eq "N"}){
            alert("구매하지 않았습니다.");
        }
    }

</script>

</body>
</html>