import datetime
from peewee import (Model, CharField, IntegerField, DateTimeField,
                    SqliteDatabase, DateField, DecimalField, SQL, SqliteDatabase, JOIN, fn )

db = SqliteDatabase("inventory.db")


class BaseModel(Model):
    class Meta:
        database = db


class Item(BaseModel):
    item_name = CharField(null=False)
    item_type = CharField(null=True)
    manuf_name = CharField(null=False)
    location = CharField(null=True)

    class Meta:
        indexes = ((("item_name", "manuf_name"), True),)


class Stock(BaseModel):
    stock_name = CharField(null=False)
    stock_batch = CharField(null=False)
    mfg_date = DateField(null=True)
    purchase_date = DateField(null=True)
    expiry_date = DateField(null=True)
    units_total = IntegerField(null=True)
    units_available = IntegerField(null=True)
    unit_cost_price = DecimalField(max_digits=10, decimal_places=2, null=True)
    unit_sale_price = DecimalField(max_digits=10, decimal_places=2, null=True)
    opt_id = CharField(null=True)
    created_date = DateField(null=True)
    last_update_date = DateField(null=True)
    sales_status = CharField(null=True)

    class Meta:
        indexes = ((("stock_name", "stock_batch"), True),)

    def save(self, *args, **kwargs):
        if not self.created_date:
            self.created_date = datetime.date.today()
            self.last_update_date = datetime.date.today()
        return super().save(*args, **kwargs)


class Order(BaseModel):
    order_no = IntegerField(null=True)
    order_for = CharField(null=True)
    order_date = DateTimeField()
    order_status = CharField(null=True)
    order_cost = DecimalField(max_digits=10, decimal_places=2, null=True)
    completed_date = DateTimeField(null=True)

    @classmethod
    def get_next_order_no(cls):
        last_order = cls.select().order_by(cls.order_no.desc()).first()
        if last_order:
            return last_order.order_no + 1
        else:
            return 99999


    def save(self, *args, **kwargs):
        if not self.order_no:
            self.order_no = self.get_next_order_no()
        if not self.order_date:
            self.order_date = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        return super(Order, self).save(*args, **kwargs)


class OrderDetails(BaseModel):
    order_no = IntegerField(null=True)
    od_item = CharField(null=True)
    od_dname = CharField(null=True)
    od_units = IntegerField(null=True)
    od_price = DecimalField(max_digits=10, decimal_places=2, null=True)
    od_discount = DecimalField(max_digits=10, decimal_places=2, null=True)
    od_priceafterdiscount = DecimalField(max_digits=10, decimal_places=2, null=True)

