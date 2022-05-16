const test =document.querySelector("#test");
const testTable =document.querySelector("#testTable");

const date_time =document.querySelector("#date_time");
const temperature =document.querySelector("#temperature");
const precipitation =document.querySelector("#precipitation");
const wind_speed =document.querySelector("#wind_speed");
const humidity =document.querySelector("#humidity");
const radiation =document.querySelector("#radiation");
const total_cloudiness =document.querySelector("#total_cloudiness");
const visibility =document.querySelector("#visibility");
const ground_temp =document.querySelector("#ground_temp");


setInterval(() => {


    fetch('http://192.168.0.8:9090/solarpred/api/getTemp_weather')
        .then(res => res.json())
        .then(res => {

            date_time.innerText = res['temp_weather']['0']['date_time'];
            temperature.innerText = res['temp_weather']['0']['temperature'];
            precipitation.innerText = res['temp_weather']['0']['precipitation'];
            wind_speed.innerText = res['temp_weather']['0']['wind_speed'];
            humidity.innerText = res['temp_weather']['0']['humidity'];
            radiation.innerText = res['temp_weather']['0']['radiation'];
            total_cloudiness.innerText = res['temp_weather']['0']['total_cloudiness'];
            visibility.innerText = res['temp_weather']['0']['visibility'];
            ground_temp.innerText = res['temp_weather']['0']['ground_temp'];
        });

}, 3000);