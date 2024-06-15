<!DOCTYPE html>
% include('menu.tpl')
<html>
<head>
<title>Add Order Detail</title>
</head>

<body>
<h1>Add Order Detail</h1>
<h2>Order</h2>

<form action="/add_orderdetail" method="post">
	<table 	style="table-layout:fixed;">
		<tr>
		<td><label for="order_for">Order For</label></td>
		<td><input type="text" id="order_for" name="order_for" required></td>
		</tr>
	</table>

	<h2>Order Item Details</h2>

	<table 	style="table-layout:fixed;">
		<tr>
		<th colspan=2><label for="od_item">Item</label></th>
		<th><label for="od_dname">Description</label></th>
		<th><label for="od_units">Units</label></th>
		<th><label for="od_price">Price</label></th>
		<th><label for="od_discount">Discount</label></th>
		</tr>
	</table>

	<table 	style="table-layout:fixed;">
	<div id="order-items">
		<div class="order-item">
	
		</div>
	</div>
	</table>

	<table 	style="table-layout:fixed;">
	<tr>
		<td>
		<button type="button" onclick="addItem_OrderDetail()">Add another Item</button>
		</td>
	</tr>	
	<tr>
		<td>
		<input type="submit" value="Submit Order, "></td>
		</td>
	</tr>	
</table>		

</form>
</body>
<script>

function onPageLoad() {
	// Your JavaScript code here
	console.log("Page loaded");
	addItem_OrderDetail();
	// Add any additional logic you want to run when the page loads
}

window.onload = onPageLoad;
		
function addItem_OrderDetail() {
	const orderItems = document.getElementById('order-items');
	const newItem = document.createElement('div');
	newItem.classList.add('order-item');
	newItem.innerHTML = `
		<tr><td colspan="2">
		<select name="od_item">
			% for stock in stocks:
								<option value="{{stock.stock_name}} *bn({{stock.stock_batch}}) *au({{stock.units_available}}) *rs({{stock.unit_sale_price}}) *ex({{stock.expiry_date}})">{{stock.stock_name}} *bn({{stock.stock_batch}}) *au({{stock.units_available}}) *rs({{stock.unit_sale_price}}) *ex({{stock.expiry_date}})</option>
			% end
		</select></td>
		<td><input type="text" id="od_dname" name="od_dname" required></td>
		<td><input type="number" id="od_units" name="od_units" required></td>
		<td><input type="number" id="od_price" name="od_price" step="0.01" required></td>
		<td><input type="number" id="od_discount" name="od_discount" step="0.01"></td>
		</tr>

	`;
	orderItems.appendChild(newItem);
}

</script>
</html>
