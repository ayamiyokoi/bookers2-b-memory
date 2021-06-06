# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.draw_graph = ->
    ctx = document.getElementById("myChart").getContext('2d')
    myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ["6日前", "5日前", "4日前", "3日前", "2日前", "1日前", "今日"],
            datasets: [{
                label: '投稿した本の数',
                data: [2, 9, 3, 5, 2, 3, 3],
                backgroundColor: 'blue',
                borderColor: 'blue',
                borderWidth: 2
                fill: false
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true

                    }
                }]
            }
        }
    })