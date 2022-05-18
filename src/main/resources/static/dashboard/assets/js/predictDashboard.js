let realTimeGerateDom = document.getElementById("realtimeAOD");
let y = 0;
let totalY = 0;
let y2 = 0;

// 10초마다 발전량 api 요청 후 y값 대입
setInterval(function (){
  fetch('http://59.0.236.34:9090/solarpred/api/preGetAOD')
  // fetch('http://192.168.0.8:9090/solarpred/api/preGetAOD')
      .then(res => res.json())
      .then(res => {
        y = res['pred_aod'][0]['pred_aod'];
        y2 += res['pred_aod'][0]['pred_aod']/1000;
      });
},10000);

let aod = [];
let aod2 = [];
fetch('http://59.0.236.34:9090/solarpred/api/getPreAOD')
// fetch('http://192.168.0.8:9090/solarpred/api/getPreAOD')
    .then(res => res.json())
    .then(res => {
      for (let x = 0; x <= 19; x += 1) {
        // aod[x] = parseInt(res['pred_aod'][x]['pred_aod']);
        aod[x] = res['pred_aod'][19-x]['pred_aod'];
        aod2[x] = res['pred_aod'][x]['pred_aod_total'];

      }
      // 누적값에 이전에 보여진 20개의 값 더해주기
      y2 = Math.round((aod2[19] * 10) / 10);

      // 상단에 실시간 예측 발전량 이전에 보여진 20개의 누적값으로 변경 출력
      realTimeGerateDom.innerText = aod[19];

    })
    .then(res => {

      // 차트 1번
      Highcharts.chart("predContainer", {
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
              return data;
            })(),
          },
        ],
      }); // 1번차트 end

      // 차트2번
      Highcharts.chart("predContainer2", {
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
                // let y = Math.random() * 3000;

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
                  y: aod2[19+i],
                  // y: aod2[19-(19+i)],
                });
              }
              return data;
            })(),
          },
        ],
      });// 2번차트 end

    });//end then