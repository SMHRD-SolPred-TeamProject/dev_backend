let realTimeGerateDom = document.getElementById("realtimeAOD");
let integratedAOD = document.getElementById("integratedAOD");

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
        return data;
      })(),
    },
  ],
});

// 차트2번
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
          integratedAOD.innerText = y;
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
