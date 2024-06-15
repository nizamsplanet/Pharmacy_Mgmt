<!DOCTYPE html>
<title>Stocks</title>
% include('menu.tpl')
<h1>Stocks</h1>
<h3>This is one level up from Items model</h3>
<button onclick="exportTableToCSV()">Export CSV</button>

<table id="exportTable">
	<tr class="export-row">
		<th>stock's ID</th>
		<th class="export-data">stock's name</th>
		<th class="export-data">stock's batch</th>
		<th class="export-data">manufactured on</th>
		<th class="export-data">purchased on</th>
		<th class="export-data">expires on</th>
		<th class="export-data">units when ordered</th>
		<th class="export-data">units available now</th>
		<th class="export-data">per unit's cost price</th>
		<th class="export-data">per unit's selling price</th>
		<th class="export-data">Addl. Details(if any)</th>
		<th>Actions</th>
		<th class="hidden">created_date</th>			
		<th class="hidden">last_update_date</th>			
	</tr>
	% for stock in stocks:
	<tr class="export-row">
		<td>{{stock.id}}</td>
		<td class="export-data">{{stock.stock_name}}</td>
		<td class="export-data">{{stock.stock_batch}}</td>
		<td class="export-data">{{stock.mfg_date}}</td>
		<td class="export-data">{{stock.purchase_date}}</td>
		<td class="export-data">{{stock.expiry_date}}</td>
		<td class="export-data">{{stock.units_total}}</td>
		<td class="export-data">{{stock.units_available}}</td>
		<td class="export-data">{{stock.unit_cost_price}}</td>
		<td class="export-data">{{stock.unit_sale_price}}</td>
		<td class="export-data">{{stock.opt_id}}</td>
		<td>
			<a href="/edit_stock/{{stock.id}}">Edit</a>
			<a href="/delete_stock/{{stock.id}}">Delete</a>
		</td>
		<td class="hidden">{{stock.created_date}}</td>			
		<td class="hidden">{{stock.last_update_date}}</td>
	</tr>
	% end
</table>