<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .dashboard {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 50px;
        }
        .stats {
            display: flex;
            justify-content: space-around;
            width: 80%;
            margin-bottom: 20px;
        }
        .stat {
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    % include('menu.tpl')
    <div class="dashboard">
        <h1>Dashboard</h1>
        <div class="stats">
            <div class="stat">
                <h2>Stock Count</h2>
                <p>{{ stock_count }}</p>
            </div>
            <div class="stat">
                <h2>Item Count</h2>
                <p>{{ item_count }}</p>
            </div>
            <div class="stat">
                <h2>Order Count</h2>
                <p>{{ order_count }}</p>
            </div>
            <div class="stat">
                <h2>Expired Stock Count</h2>
                <p>{{ expiry_count }}</p>
            </div>
            <div class="stat">
                <h2>Low Stock Count</h2>
                <p>{{ low_stock_count }}</p>
            </div>
        </div>
    </div>
</body>
</html>
