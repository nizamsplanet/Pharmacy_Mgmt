<!DOCTYPE html>
<html>
<head>
    <title>Order Details</title>
    <style>
        /* General styles */
        @media screen {
            .print-hide {
                display: table-cell; /* Show on screen */
            }
            .menu {
                display: block; /* Show menu on screen */
            }
            .print-button {
                display: block; /* Show print button on screen */
                margin-top: 20px; /* Adjust margin as needed */
            }
        }

        /* Print-specific styles */
        @media print {
            .print-hide {
                display: none; /* Hide on print */
            }
            .menu {
                display: none; /* Hide menu on print */
            }
            .print-button {
                display: none; /* Hide print button on print */
            }

            @page {
                size: A4;
                margin: 20mm;
            }
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                page-break-inside: auto;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: left;
				word-break: break-word;
				overflow-wrap: break-word; 
				white-space: normal; 
            }
            th {
                background-color: #f2f2f2;
            }
            tr {
                page-break-inside: avoid;
                page-break-after: auto;
            }
            thead {
                display: table-header-group;
            }
            tfoot {
                display: table-footer-group;
            }
        }
    </style>
</head>
<body>
    <div class="menu">
        % include('menu.tpl')
    </div>
<br><br>
	<h4>Order No: {{ orderdetails[0].order_no }} For: {{ orders[0].order_for }}</h4>

    <button class="print-button" onclick="window.print()">Print Order</button>
<br><br>
<hr>
    <table style="table-layout: fixed;">
        <thead>
            <tr>
                <th class="print-hide">Item's Name</th>
                <th>Description</th>
                <th>Qty</th>
                <th class="print-hide">Price per Unit</th>               
                <th class="print-hide">Cost &#8377;</th>
                <th class="print-hide">Disc. Per Item &#8377;</th>
                <th>Price &#8377;</th>
                <th class="print-hide">Running Total &#8377;</th>
            </tr>
        </thead>
        <tbody>
        % running_total = 0
        % total_price = 0 
        % total_discount = 0
        % total_price_after_discount = 0

        % for orderdetail in orderdetails:
            % running_total += orderdetail.od_priceafterdiscount
            % total_price += orderdetail.od_price * orderdetail.od_units
            % total_discount += orderdetail.od_discount
            % total_price_after_discount += orderdetail.od_priceafterdiscount
            <tr>
                <td class="print-hide">{{ orderdetail.od_item }}</td>
                <td>{{ orderdetail.od_dname }}</td>
                <td>{{ orderdetail.od_units }}</td>
                <td class="print-hide">{{ orderdetail.od_price }}</td>
                <td class="print-hide">{{ orderdetail.od_price * orderdetail.od_units }}</td>               
                <td class="print-hide">{{ orderdetail.od_discount }}</td>
                <td>{{ orderdetail.od_priceafterdiscount }}</td>
                <td class="print-hide">{{ running_total }}</td>
            </tr>
        % end
        </tbody>
        <tfoot>
            <tr>
                <th class="print-hide" colspan="4">Total &#8377;</th>
                <th class="print-hide">&#8377; {{ total_price }}</th>
                <th class="print-hide">&#8377; {{ total_discount }}</th>
                <th class="print-hide">&#8377; {{ total_price_after_discount }}</th>
                <th class="print-hide">&#8377; {{ running_total }}</th>               
            </tr>
        </tfoot>
    </table><hr>


    <div class="timestamp">
		<h4>Total: &#8377; {{ running_total }}</h4>
        <br>Issued : <span id="print-timestamp"></span>
		<br>Issued By: XYZ Hospitals, Madurai 16
    </div>

    <script>
        // JavaScript to insert current timestamp into the printed document
        window.onload = function() {
            var now = new Date();
            var timestampElement = document.getElementById('print-timestamp');
            timestampElement.textContent = now.toLocaleString();
        };
    </script>
</body>
</html>
