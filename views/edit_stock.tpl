<!DOCTYPE html>
% include('menu.tpl')

<h1>Edit Stock</h1>
<form method="post">
<table>
<tr>
	<td><label for="stock_name">stock's name</label></td>
	<td><input type="text" id="stock_name" name="stock_name" value="{{stock.stock_name}}"></td>
</tr>

<tr>
	<td><label for="stock_batch">stock's batch</label></td>
	<td><input type="text" id="stock_batch" name="stock_batch" value="{{stock.stock_batch}}"></td>
</tr>

<tr>
	<td><label for="mfg_date">manufactured on</label></td>
	<td><input type="date" id="mfg_date" name="mfg_date" value="{{stock.mfg_date}}"></td>
</tr>

<tr>
	<td><label for="purchase_date">purchased on</label></td>
	<td><input type="date" id="purchase_date" name="purchase_date" value="{{stock.purchase_date}}"></td>
</tr>

<tr>
	<td><label for="expiry_date">expires on</label></td>
	<td><input type="date" id="expiry_date" name="expiry_date" value="{{stock.expiry_date}}"></td>
</tr>

<tr>
	<td><label for="units_total">units when ordered</label></td>
	<td><input type="number" id="units_total" name="units_total" value="{{stock.units_total}}"></td>
</tr>

<tr>
	<td><label for="units_available">units available now</label></td>
	<td><input type="number" id="units_available" name="units_available" value="{{stock.units_available}}"></td>
</tr>

<tr>
	<td><label for="unit_cost_price">per unit's cost price</label></td>
	<td><input type="number" step="0.01" id="unit_cost_price" name="unit_cost_price" value="{{stock.unit_cost_price}}"></td>
</tr>

<tr>
	<td><label for="unit_sale_price">per unit's selling price</label></td>
	<td><input type="number" step="0.01" id="unit_sale_price" name="unit_sale_price" value="{{stock.unit_sale_price}}"></td>
</tr>			

<tr>
	<td><label for="opt_id">Addl. Details/Supplier</label></td>
	<td><input type="text" id="opt_id" name="opt_id" value="{{stock.opt_id}}"></td>
</tr>			

</table>
<br>
<input type="submit" value="Save">
</form>

