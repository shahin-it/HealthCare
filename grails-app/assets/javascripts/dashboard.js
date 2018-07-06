$(function () {
    var MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    var chartColors = {
        red: 'rgb(255, 99, 132)',
        orange: 'rgb(255, 159, 64)',
        yellow: 'rgb(255, 205, 86)',
        green: 'rgb(75, 192, 192)',
        blue: 'rgb(54, 162, 235)',
        purple: 'rgb(153, 102, 255)',
        grey: 'rgb(201, 203, 207)'
    }
    var color = Chart.helpers.color;

    var reportCtx = $("#sell-by-month-chart");
    var reportRawData = reportCtx.data("data");

    new Chart(reportCtx[0].getContext('2d'), {
        type: 'bar',
        data: {
            labels: reportRawData.map(function (data) {
                return data[0];
            }),
            datasets: [{
                label: 'Total Report',
                backgroundColor: color(chartColors.blue).alpha(0.5).rgbString(),
                borderColor: chartColors.blue,
                borderWidth: 1,
                data: reportRawData.map(function (data) {
                    return data[1];
                })
            }]
        },
        options: {
            responsive: true,
            legend: {
                position: 'top',
            },
            title: {
                display: true,
                text: 'Report Sell Count'
            },
            scales: {"yAxes": [{ticks: {beginAtZero: true}}]}
        }
    });


    var orderStatusCtx = $("#order-status-chart");
    var statusRawData = orderStatusCtx.data("data");

    new Chart(orderStatusCtx[0].getContext('2d'), {
        type: 'doughnut',
        data: {
            datasets: [{
                data: statusRawData.map(function (data) {
                    return data[1];
                }),
                backgroundColor: [
                    chartColors.green,
                    chartColors.orange,
                    chartColors.yellow,
                    chartColors.grey,
                    chartColors.purple,
                    chartColors.red
                ],
                label: 'Order Status Count'
            }],
            labels: statusRawData.map(function (data) {
                return data[0];
            })
        },
        options: {
            responsive: true,
            legend: {
                position: 'top',
            },
            title: {
                display: true,
                text: 'Order Status Count'
            },
            animation: {
                animateScale: true,
                animateRotate: true
            }
        }
    })
})