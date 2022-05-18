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
    <link rel="stylesheet" href="./dashboard/assets/css/dashboardLogin.css" />
    <link rel="stylesheet" href="./dashboard/assets/css/font.css" />
    <link rel="icon" type="image/png" href="./dashboard/assets/img/logo.png">
</head>

<body>

<div class="wrap">
    <div class="form-wrap">
        <div class="button-wrap">
            <div id="btn"></div>
        </div>

        <div class="social-icons">
            <img src="./dashboard/assets/img/solLogo.png" alt="logo" style="margin-top: -80px;">
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
            alert("구매 후 이용해주시기 바랍니다!");
        }else if (${member.mem_purchase eq "F"}){
            alert("비밀번호가 올바르지 않습니다!");
        }
    }

</script>

</body>
</html>