<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
 <style>
    #chart-container {
        width: 700px;
        height: 500px;
        margin: auto;
    }
</style>
</head>
<body>
  <h2 style="text-align:center;">Daily Expenses with Items</h2>
    <div id="chart-container">
        <canvas id="itemChart"></canvas>
    </div>
    <h3 style="text-align:center;">Pie Chart</h3>
<div style="width: 50%; margin: auto;">
    <canvas id="pieChart" width="400" height="400"></canvas>
</div>

  <script>
fetch('/item-date-chart-data') // adjust userid here
    .then(res => res.json())
    .then(data => {
        console.log('Data fetched:', data);  // Debug print
        
        const labels = data.map(d => d.date + ' - ' + d.title);
        const amounts = data.map(d => d.amount);
        const titles = data.map(d => d.title);

        const ctx = document.getElementById('itemChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Amount Spent',
                    data: amounts,
                    backgroundColor: 'rgba(75, 192, 192, 0.6)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                },
                {
                    label: 'Planned Budget', // ⬅️ second label
                    data: amounts,
                    type: 'line', // ⬅️ make this a line
                    borderColor: 'rgba(255, 99, 132, 1)',
                    backgroundColor: 'transparent',
                    borderWidth: 2,
                    pointRadius: 4,
                    tension: 0.4
                }
                ]
            },
            options: {
                responsive: true,
                plugins: {
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return '₹' + context.raw;
                            }
                        }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        min: 0,          // set minimum value
                        max: 10000,
                        ticks: {
                            stepSize: 100,  // control step
                            callback: function(value) {
                                return '₹' + value;  // format label
                            }
                        },
                        title: {
                            display: true,
                            text: 'Amount (₹)'
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Date - Item'
                        }
                    }
                }
            }
        });
        
        new Chart(document.getElementById('pieChart'), {
            type: 'pie',
            data: {
              labels: titles,
              datasets: [{
                data: amounts,
                backgroundColor: ['#ff6384', '#36a2eb', '#ffce56', '#4bc0c0', '#9966ff', '#ff9f40']
              }]
            }
          });
    })
    .catch(err => console.error('Fetch error:', err));
</script>

</body>
</html>