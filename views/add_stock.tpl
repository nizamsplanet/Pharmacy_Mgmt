<!DOCTYPE html>
<title>Add Stock</title>
% include('menu.tpl')
<h1>Add Stock</h1>
<h3>You are adding items to stock.</h3>
<table>
<form action="/add_stock" method="post">
	<tr><td>Stock Name</td><td>
	<select name="stock_name">
		% for item in items:
			<option value="{{ item.item_name }} - {{ item.manuf_name }}">{{ item.item_name }}**{{ item.manuf_name }}</option>
		% end
	</select>	
	<tr><td>Stock Batch</td><td><input type="text" name="stock_batch" required></td></tr>
	<tr><td>Manufacturing Date</td><td><input type="date" name="mfg_date"></td></tr>
	<tr><td>Purchase Date</td><td><input type="date" name="purchase_date"></td></tr>
	<tr><td>Expiry Date</td><td><input type="date" name="expiry_date"></td></tr>
	<tr><td>Total Units</td><td><input type="number" name="units_total"></td></tr>
	<tr><td>Available Units</td><td><input type="number" name="units_available" required></td></tr>
	<tr><td>Unit Cost Price</td><td><input type="number" step="0.01" name="unit_cost_price"></td></tr>
	<tr><td>Unit Sale Price</td><td><input type="number" step="0.01" name="unit_sale_price" required></td></tr>
	<tr><td>Addl. Dtl/Supplier</td><td><input type="text" name="opt_id"></td></tr>
	<tr><td colspan="2"><input type="submit" value="Add Stock">
</form>
</table>	

