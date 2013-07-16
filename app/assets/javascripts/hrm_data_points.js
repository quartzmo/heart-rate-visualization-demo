$(function () {

  var $chartContainer = $('#hrm-data-points-chart');

  if ($chartContainer.length == 0) return;

  var points = $chartContainer.data('hrm-data-points');
  var pointsIndex = 20; // Preload 20 points to establish x scale for animation.
  var initialPoints = points.slice(0, pointsIndex - 1);

  var animatePoints = function () {

    var series = this.series[0];
    var interval = 1000; // todo: Correctly time new points based on actual data.  //Math.abs((new Date(point[0]).getTime() - new Date(prevPoint[0]).getTime()));
    setInterval(function () {
      var prevPoint = points[pointsIndex - 1];
      var point = points[pointsIndex];
      pointsIndex++;
      if (!point) return false; // todo: End cleanly
      series.addPoint(point, true, true);
    }, interval);

  };

  $chartContainer.highcharts({
    chart: {
      type: 'spline',
      animation: Highcharts.svg, // don't animate in old IE
      marginRight: 10,
      events: {
        load: animatePoints
      }
    },
    title: {
      text: 'Heart Rate Monitor Session'
    },
    subtitle: {
      text: 'Time intervals in this animation are not real.'
    },
    xAxis: {
      type: 'datetime',
      title: {
        text: null
      },
      minTickInterval: 10
    },
    yAxis: {
      title: {
        text: 'BPM'
      },
      min: 0
    },

    tooltip: {
      shared: true
    },
    legend: {
      enabled: false
    },

    series: [
      {
        name: 'Heart Rate',
        data: initialPoints
      }
    ]
  });
});

