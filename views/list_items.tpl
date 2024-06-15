<!DOCTYPE html>
<title>Items</title>
% include('menu.tpl')
<h1>Items</h1>
<h3>This is the base-level of the model</h3>
<table>
<tr>
	<td>ID</td>
	<td>Name</td>
	<td>Type</td>
	<td>Manufacturer/ServicedBy</td>
	<td>Location</td>
	<td>Actions</td>
</tr>
% for item in items:
<tr>
	<td>{{item.id}}</td>
	<td>{{item.item_name}}</td>
	<td>{{item.item_type}}</td>
	<td>{{item.manuf_name}}</td>
	<td>{{item.location}}</td>
	<td>
		<a href="/edit_item/{{item.id}}">Edit</a>
		<a href="/delete_item/{{item.id}}">Delete</a>
	</td>
</tr>
% end
</table>
