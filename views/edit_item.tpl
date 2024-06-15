<!DOCTYPE html>
% include('menu.tpl')
<body>
<h1>Edit Item</h1>
<form method="post">
<table>
<tr>
	<td><label for="item_name">Item's Name</label></td>
	<td><input type="text" id="item_name" name="item_name" value="{{item.item_name}}"></td>
</tr>
<tr>
	<td><label for="item_type">Item's Type</label></td>
	<td><input type="text" id="item_type" name="item_type" value="{{item.item_type}}"></td>
</tr>
<tr>
	<td><label for="manuf_name">Manuf By or Serviced By</label></td>
	<td><input type="text" id="manuf_name" name="manuf_name" value="{{item.manuf_name}}"></td>
</tr>
<tr>
	<td><label for="location">Item's Location</label></td>
	<td><input type="text" id="location" name="location" value="{{item.location}}"></td>
</tr>
</table>
<br>
<input type="submit" value="Save">
</form>
</body>