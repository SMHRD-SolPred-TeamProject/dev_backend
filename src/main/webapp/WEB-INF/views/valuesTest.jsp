<%--
  Created by IntelliJ IDEA.
  User: smhrd
  Date: 2022-05-14
  Time: 오후 5:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="test" style="font-size: 30px; margin: 0 auto; width: 500px; height: 500px; text-align: center; margin-top: 200px;">
    <table id="testTable" border="1">
        <tr>
            <th>/</th>
            <th>date_time</th>
            <th>temperature</th>
            <th>precipitation</th>
            <th>wind_speed</th>
            <th>humidity</th>
            <th>radiation</th>
            <th>total_cloudiness</th>
            <th>visibility</th>
            <th>ground_temp</th>
        </tr>
        <tr>
            <td></td>
            <td id="date_time"></td>
            <td id="temperature"></td>
            <td id="precipitation"></td>
            <td id="wind_speed"></td>
            <td id="humidity"></td>
            <td id="radiation"></td>
            <td id="total_cloudiness"></td>
            <td id="visibility"></td>
            <td id="ground_temp"></td>
        </tr>
    </table>
</div>
<script src="./valuesTest.js"></script>
</body>
</html>
