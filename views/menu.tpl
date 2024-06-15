<!DOCTYPE html>
<html lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
  border-radius: 5px 25px 10px
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}


body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 10px;
	background-color: #f4f4f4;
}


table {
    width: 100%;
	border-collapse: collapse;
	margin: 15px 0;
	font-size: 16px;
	text-align: left;
}

th, td {
	padding: 12px 15px;
	word-break: break-word;
	overflow-wrap: break-word; 
	white-space: normal;
}

thead tr {
	background-color: #333;
	color: #ffffff;
	text-align: left;
	font-weight: bold;
}

tbody tr:nth-child(odd) {
	background-color: #f2f2f2;
	border-radius: 5px;
}

tbody tr:nth-child(even) {
	background-color: #cccccc;
	border-radius: 5px;
}

tbody tr:hover {
	background-color: #e0e0e0;
	
}

tbody tr:nth-child(odd):hover {
	background-color: #d1d1d1;
	
}

tbody tr:nth-child(even):hover {
	background-color: #bfbfbf;
}


input {
    padding: 8px;
    margin-top: 5px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
	font-family: Arial, sans-serif;	
	background-color: #f4f4f4;  
}

input:focus {
	background-color: lightblue;
}

select {
	font-family: Arial, sans-serif;  
	padding: 3px;
}


.odd-row {
	background-color: #f9f9f9;
}

.even-row {
	background-color: #ffffff;
}

.hidden {
visibility:hidden;
}



</style>


<script>
	function exportTableToCSV() {
		var csv = [];
		var rows = document.querySelectorAll("table#exportTable tr.export-row");
		const timestamp = new Date().toISOString().replace(/[-:.]/g, "").replace("T", "_").split("Z")[0];
		const filename = `filtered_stock_${timestamp}.csv`;

		for (var i = 0; i < rows.length; i++) {
			var row = [];
			var cols = rows[i].querySelectorAll(".export-header, .export-data");

			for (var j = 0; j < cols.length; j++) {
				var cellText = cols[j].innerText.replace(/"/g, '""'); // Replace double quotes with two double quotes
				row.push('"' + cellText + '"');
			}

			csv.push(row.join(","));        
		}

		const blob = new Blob([csv.join("\n")], { type: 'text/csv' });
		const url = window.URL.createObjectURL(blob);

		// Open the blob in a new window
		const newWindow = window.open();
		newWindow.document.write('<html><head><title>CSV Preview</title></head><body>');
		newWindow.document.write('<a download="' + filename + '" href="' + url + '">Download CSV</a><br><br>');
		newWindow.document.write('<pre>' + csv.join("\n") + '</pre>');
		newWindow.document.write('</body></html>');
		newWindow.document.close();
	}
</script>
</head>

<body>
<ul>
	<li><a href="/">Home</a></li>
	<li><a href="/items">Items</a></li>
	<li><a href="/add_item">Add Item</a></li>
	<li><a href="/stocks">Stocks</a></li>
	<li><a href="/add_stock">Add Stock</a></li>
	<li><a href="/orders">Orders</a></li>
	<li><a href="/add_orderdetail">Add Order</a></li>
	<li><a href="/about">About</a></li>
</ul>
</body>
</html>



