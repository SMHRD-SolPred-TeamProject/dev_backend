let realTimeGerateDom = document.getElementById("realtimeAOD");
let realTimeTotalAOD = document.getElementById("integratedAOD");

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


          // fetch('http://192.168.0.8:9090/solarpred/api/getTemp_weather')
          //     .then(res => res.json())
          //     .then(res => {
          //       date_time.innerText = res['temp_weather']['0']['date_time'];
          //     });


          var x = new Date().getTime(); // current time
          cosnole.log("x =  " + x);
          let y = Math.random() * 600;

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
            y: Math.random() * 600,
          });
        }
        console.log(typeof(time));
        console.log(time);
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
          let y = Math.random() * 3000;

          // 10초 단위로 바꿈!
          realTimeTotalAOD.innerText = y;
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
            y: Math.random() * 3000,
          });
        }
        return data;
      })(),
    },
  ],
});

// solution.html
// 이거는 솔루션페이지!

// solution페이지의 실시간누적발전량
let sol_realTimeTotalAOD = document.getElementById("integratedAOD2");

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
          let y = Math.random() * 3000;

          // 10초 단위로 바꿈!
          sol_realTimeTotalAOD.innerText = y;
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
            y: Math.random() * 3000,
          });
        }
        return data;
      })(),
    },
  ],
});
