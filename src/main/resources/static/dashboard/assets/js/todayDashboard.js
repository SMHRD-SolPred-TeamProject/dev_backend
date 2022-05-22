let realTimeGerateDom = document.getElementById("realtimeAOD");
let realTimeTotalAOD = document.getElementById("integratedAOD");
let y = 0;
let y2 = 0;

// solution페이지의 실시간누적발전량
let sol_realTimeTotalAOD = document.getElementById("integratedAOD2");

// 10초마다 발전량 api 요청 후 y값 대입
setInterval(function (){
  fetch('http://59.0.236.34:9090/api/currentGetAOD')
  // fetch('http://192.168.0.8:9090/api/currentGetAOD')
      .then(res => res.json())
      .then(res => {
        y = res['r_aod'][0]['r_aod'];
        y2 += res['r_aod'][0]['r_aod']/1000;
      });
},10000);

let aod = [];
let aod2 = [];
fetch('http://59.0.236.34:9090/api/getAOD')
// fetch('http://192.168.0.8:9090/api/getAOD')
    .then(res => res.json())
    .then(res => {
      for (let x = 0; x <= 19; x += 1) {
        aod[x] = res['r_aod'][19-x]['r_aod'];
        aod2[x] = res['r_aod'][x]['r_aod_total'];
      }
      // 누적값에 이전에 보여진 20개의 값 더해주기
      y2 = Math.round((aod2[19] * 10) / 10);

      // 페이지 로딩 시 실시간 발전량 변경
      realTimeGerateDom.innerText = aod[19];

      // 페이지 로딩 시 실시간 누적발전량  변경
      realTimeTotalAOD.innerText = y2;

      // solution 페이지 실시간 누적발전량 바꿈!
      // sol_realTimeTotalAOD.innerText = y2;

    })
    .then(res => {

      // 차트 1번 (실시간발전량)
      Highcharts.chart("container", {
        chart: {
          type: "spline",
          animation: Highcharts.svg, // don't animate in old IE
          marginRight: 5,
          events: {
            load: function () {
              // set up the updating of the chart each second
              var series = this.series[0];

              setInterval(function () {
                var x = new Date().getTime(); // current time
                // let y = Math.random() * 600;

                // 10초 단위로 바꿈!
                realTimeGerateDom.innerText = y;
                series.addPoint([x, y], true, true);
              }, 10000);
            },
          },
        },

        time: {
          useUTC: false,
        },
        title: {
          text: "",
        },

        accessibility: {
          announceNewData: {
            enabled: true,
            minAnnounceInterval: 15000,
            announcementFormatter: function (allSeries, newSeries, newPoint) {
              if (newPoint) {
                return "New point added. Value: " + newPoint.y;
              }
              return false;
            },
          },
        },

        xAxis: {
          type: "datetime",
          tickPixelInterval: 150,
        },

        yAxis: {
          title: {
            text: "실시간 발전량",
          },
          plotLines: [
            {
              value: 0,
              width: 1,
              color: "#808080",
            },
          ],
        },

        tooltip: {
          headerFormat: "<b>{series.name}</b><br/>",
          pointFormat: "{point.x:%Y-%m-%d %H:%M:%S}<br/>{point.y:.2f}",
        },

        legend: {
          enabled: false,
        },

        exporting: {
          enabled: false,
        },

        series: [
          {
            name: "real-time AOD",
            data: (function () {
              // generate an array of random data
              var data = [],
                  time = new Date().getTime(),
                  i;

              for (i = -19; i <= 0; i += 1) {
                data.push({
                  x: time + i * 10000,
                  // y: aod[19-(19+i)],
                  y: aod[19+i],
                });
              }
              // console.log("JSON.stringify(data) = "+JSON.stringify(data));
              return data;
            })(),
          },
        ],
      });


      // 차트 2번 (실시간 누적발전량)
      Highcharts.chart("container2", {
        chart: {
          type: "area",
          animation: Highcharts.svg, // don't animate in old IE
          marginRight: 5,
          events: {
            load: function () {
              // set up the updating of the chart each second
              var series = this.series[0];
              setInterval(function () {
                var x = new Date().getTime(); // current time
                //let y2 = Math.random() * 3000;

                // Today dashboard 페이지 실시간 누적발전량 10초 단위로 바꿈!
                realTimeTotalAOD.innerText = y2.toFixed(2);

                series.addPoint([x, y2], true, true);
              }, 10000);
            },
          },
        },

        time: {
          useUTC: false,
        },
        title: {
          text: "",
        },

        accessibility: {
          announceNewData: {
            enabled: true,
            minAnnounceInterval: 15000,
            announcementFormatter: function (allSeries, newSeries, newPoint) {
              if (newPoint) {
                return "New point added. Value: " + newPoint.y;
              }
              return false;
            },
          },
        },

        xAxis: {
          type: "datetime",
          tickPixelInterval: 150,
        },

        yAxis: {
          title: {
            text: "실시간 발전량",
          },
          floor: aod2[0]-30,
          ceiling: aod2[0]+30,
          //min , max +30 정도
          startOnTick: false,
          plotLines: [
            {
              value: 1000,
              width: 1,
              color: "#808080",
            },
          ],
        },

        tooltip: {
          headerFormat: "<b>{series.name}</b><br/>",
          pointFormat: "{point.x:%Y-%m-%d %H:%M:%S}<br/>{point.y:.2f}",
        },

        legend: {
          enabled: false,
        },

        exporting: {
          enabled: false,
        },

        series: [
          {
            name: "real-time AOD",
            data: (function () {
              // generate an array of random data
              var data = [],
                time = new Date().getTime(),
                i;

              for (i = -19; i <= 0; i += 1) {
                //console.log(`aod2[${19-(19+i)}] = ${aod2[19-(19+i)]}`);
                data.push({
                  x: time + i * 10000,
                  // y: aod2[19-(19+i)],
                  y: aod2[19+i],
                });
              }
              // console.log("JSON.stringify(data) = "+JSON.stringify(data));
              return data;
            })(),
          },
        ],
      });



    });//end then
