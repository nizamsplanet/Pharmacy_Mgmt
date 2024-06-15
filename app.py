import datetime
from bottle import (Bottle, run, template, request,
                    redirect, )
from model import *

app = Bottle()


@app.route("/")
def index():
    stock_count = Stock.select().count()
    item_count = Item.select().count()
    order_count = Order.select().count()
    expiry_count = Stock.select().where(Stock.expiry_date < datetime.datetime.now()).count()
    low_stock_count = Stock.select().where(Stock.units_available < (Stock.units_total * 0.10)).count()
    return template("index", stock_count=stock_count, item_count=item_count, order_count=order_count, expiry_count=expiry_count, low_stock_count=low_stock_count)


@app.route("/items")
def list_items():
    items = Item.select()
    return template("list_items", items=items)


@app.route("/add_item", method=["GET", "POST"])
def add_item():
    if request.method == "POST":
        item_name = request.forms.get("item_name")
        item_type = request.forms.get("item_type")
        manuf_name = request.forms.get("manuf_name")
        location = request.forms.get("location")
        Item.create(
            item_name=item_name,
            item_type=item_type,
            manuf_name=manuf_name,
            location=location,
        )
        return redirect("/items")
    return template("add_item")


@app.route("/edit_item/<item_id:int>", method=["GET", "POST"])
def edit_item(item_id):
    item = Item.get_or_none(Item.id == item_id)
    if request.method == "POST":
        item.item_name = request.forms.get("item_name")
        item.item_type = request.forms.get("item_type")
        item.manuf_name = request.forms.get("manuf_name")
        item.location = request.forms.get("location")
        item.save()
        return redirect("/items")
    return template("edit_item", item=item)


@app.route("/delete_item/<item_id:int>")
def delete_item(item_id):
    item = Item.get_or_none(Item.id == item_id)
    if item:
        item.delete_instance()
    return redirect("/items")


@app.route("/stocks")
def list_stocks():
    stocks = Stock.select()
    return template("list_stocks", stocks=stocks)


@app.route("/add_stock", method=["GET", "POST"])
def add_stock():
    items = Item.select()
    if request.method == "POST":
        stock_name = request.forms.get("stock_name")
        stock_batch = request.forms.get("stock_batch")
        mfg_date = request.forms.get("mfg_date")
        purchase_date = request.forms.get("purchase_date")
        expiry_date = request.forms.get("expiry_date")
        units_total = request.forms.get("units_total")
        units_available = request.forms.get("units_available")
        unit_cost_price = request.forms.get("unit_cost_price")
        unit_sale_price = request.forms.get("unit_sale_price")
        opt_id = request.forms.get("opt_id")
        Stock.create(
            stock_name=stock_name,
            stock_batch=stock_batch,
            mfg_date=mfg_date,
            purchase_date=purchase_date,
            expiry_date=expiry_date,
            units_total=units_total,
            units_available=units_available,
            unit_cost_price=unit_cost_price,
            unit_sale_price=unit_sale_price,
            opt_id=opt_id,
        )
        return redirect("/stocks")
    return template("add_stock", items=items)


@app.route("/edit_stock/<stock_id:int>", method=["GET", "POST"])
def edit_stock(stock_id):
    try:
        stock = Stock.get(Stock.id == stock_id)
    except DoesNotExist:
        return "Stock not found"

    if request.method == "POST":
        stock.stock_name = request.forms.get("stock_name")
        stock.stock_batch = request.forms.get("stock_batch")
        stock.mfg_date = request.forms.get("mfg_date")
        stock.purchase_date = request.forms.get("purchase_date")
        stock.expiry_date = request.forms.get("expiry_date")
        stock.units_total = int(request.forms.get("units_total"))
        stock.units_available = int(request.forms.get("units_available"))
        stock.unit_cost_price = float(request.forms.get("unit_cost_price"))
        stock.unit_sale_price = float(request.forms.get("unit_sale_price"))
        stock.opt_id = request.forms.get("opt_id")
        stock.save()
        return redirect("/stocks")
    return template("edit_stock", stock=stock)


@app.route("/delete_stock/<stock_id:int>")
def delete_stock(stock_id):
    stock = Stock.get_or_none(Stock.id == stock_id)
    if stock:
        stock.delete_instance()
        return redirect("/stocks")
    return redirect("/stocks")


@app.route("/orders")
def list_orders():
    orders = Order.select().order_by(Order.order_date.desc())
    return template("list_orders", orders=orders)

@app.route("/order/<order_no:int>", method=["GET"])
def list_order(order_no):
    orderdetails = OrderDetails.select().where(OrderDetails.order_no == order_no)
    orders = Order.select().where(Order.order_no == order_no)
    return template(
        "list_orderdetails",
        orderdetails=orderdetails,orders=orders
    )
    

@app.route("/add_orderdetail", method=["GET", "POST"])
def add_orderdetail():
    items = Item.select()
    stocks = Stock.select()
                    
    if request.method == "POST":
        order_for = request.forms.get("order_for")
        od_items = request.forms.getall("od_item")
        od_dnames = request.forms.getall("od_dname")
        od_units = request.forms.getall("od_units")
        od_prices = request.forms.getall("od_price")
        od_discounts = request.forms.getall("od_discount")

        # Create a new order
        new_order = Order.create(
            order_for=order_for,
            order_date=datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
            order_status='Pending'
        )
        order_no = new_order.order_no
        total_cost=0
        
        # Insert all order details with the same order_no
        for od_item, od_dname, od_unit, od_price, od_discount  in zip(od_items, od_dnames, od_units, od_prices, od_discounts):
            price = float(od_price) if od_price else 0
            discount = float(od_discount) if od_discount else 0
            units = int(od_unit)
            item_total = (units * price ) - discount
            total_cost += item_total
            new_order.order_cost = total_cost
            new_order.save()

            OrderDetails.create(
                order_no=order_no,
                od_item=od_item,
                od_dname=od_dname,
                od_units=int(od_unit),
                od_price=float(od_price) if od_price else 0,
                od_discount=float(od_discount) if od_discount else 0,
                od_priceafterdiscount=float(item_total)
                )
            
  
        return redirect("/orders")
    return template("add_orderdetail",stocks=stocks,items=items)

@app.route("/complete_order/<order_no:int>", method=["POST"])
def complete_order(order_no):
    try:
        order = Order.get(Order.order_no == order_no)
        order.complete_order()
        return f"Order {order_no} completed successfully."
    except Order.DoesNotExist:
        return f"Order {order_no} does not exist."

@app.route("/about",method=["GET"])
def about():
    return template("about")


db.connect()
db.create_tables([Stock, Item, Order, OrderDetails ])

if __name__ == "__main__":
    run(app, host="localhost", port=8080, reloader=True)
