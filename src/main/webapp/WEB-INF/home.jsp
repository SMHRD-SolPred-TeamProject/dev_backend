<%--
  Created by IntelliJ IDEA.
  User: smhrd
  Date: 2022-05-03
  Time: 오전 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
테스트
<button onclick="loadListMyBatis()">멤버 리스트 가져오기(마이바티스)</button>
<script>
    function loadListMyBatis(){
        $.ajax({
            url : "/solcaster/findAll",
            type : "get",
            dataType : "json",
            success : function (data){
                console.log(data);
            },
            error : function (){
                alert("error");
            },
        });
    }
</script>

</body>
</html>
