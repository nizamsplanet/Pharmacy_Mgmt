<!DOCTYPE html>
<title>Add Item</title>
% include('menu.tpl')
<h1>Add Item</h1>
<h3>You are adding items which can be later added to stock</h3>		
<table>
<form action="/add_item" method="post">
	<tr><td>Item Name</td><td><input type="text" name="item_name" required></td></tr>
	<tr><td>Item Type</td><td><input type="text" name="item_type" required></td></tr>
	<tr><td>Manuf By or Serviced By</td><td><input type="text" name="manuf_name" required></td></tr>
	<tr><td>Location</td><td><input type="text" name="location"></td></tr>
	<tr><td colspan="2"><input type="submit" value="Add Item"></td></tr>
</form>
</table>
