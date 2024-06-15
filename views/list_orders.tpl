<!DOCTYPE html>
% include('menu.tpl')
<html>
<head>
    <title>Order List</title>
</head>
<body>
<h1>Order List</h1>

<table>
<tr>
	<th>Order Number</th>
	<th>Order's For</th>
	<th>Order's Created Date</th>
	<th>Order's Cost</th>
	<th>Order's Status</th>
	<th>Order's Completed Date</th>
</tr>
% for order in orders:
<tr>
	<td><a href="/order/{{order.order_no}}">{{order.order_no}}</a></td>
	<td>{{order.order_for}}</td>
	<td>{{order.order_date}}</td>
	<td>{{order.order_cost}}</td>
	<td>{{order.order_status}}</td>
	<td>{{order.completed_date}}</td>
</tr>	
% end

</table>	
</body>
</html>







