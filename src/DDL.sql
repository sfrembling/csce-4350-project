create table user_account (
account_number numeric(5,0) not null,
name varchar(30),
primary key (account_number)
);

create table Login_Information (
username varchar(30),
password varchar(30),
account_number numeric(5,0) not null,
primary key (username),
foreign key (account_number) references user_account(account_number)
);

create table Address (
address_id numeric(5,0),
state varchar(30),
city varchar(30),
street varchar(50),
zip_code numeric(5,0),
account_number numeric(5,0) not null,
primary key (address_id),
foreign key (account_number) references user_account(account_number) on delete cascade
);

create table Payment_Method (
payment_id numeric (5,0),
name varchar(30),
type varchar(20),
information varchar(50),
account_number numeric(5,0) not null,
primary key (payment_id),
foreign key (account_number) references user_account(account_number) on delete cascade
);

create table Product (
  Product_ID			varchar(8),
  name varchar(30),
  Quantity	numeric(10,0),
  Shelf_ID	varchar(8),
  primary key (product_ID)
);

create table customer_order (
order_number numeric(5,0) not null,
Product_ID			varchar(8),
order_date varchar(30),
account_number numeric(5,0) not null,
primary key (order_number),
foreign key (account_number) references user_account(account_number) on delete cascade,
foreign key (product_ID) references product(product_ID) on delete cascade
);

create table delivery_method (
  delivery_id numeric(5,0),
  type varchar(30),
  order_number numeric(5,0) not null,
  primary key (delivery_id),
  foreign key (order_number) references customer_order(order_number) on delete cascade
);

create table order_history(
  history_id numeric(5,0),
  account_number numeric(5,0) not null,
  order_number numeric(5,0) not null,
  primary key(history_id),
  foreign key (account_number) references user_account(account_number) on delete cascade,
  foreign key (order_number) references customer_order(order_number)
);

create table Warehouse
    (Warehouse_num		numeric(25,0),
    Product_ID			varchar(8),
    Quantity			numeric(10,0),
	primary key (Warehouse_num),
    foreign key (Product_ID) references Product (Product_ID)
    	on delete cascade,
    foreign key (Quantity) references Product (Quantity)
    	on delete cascade
    );

	create table Supplier
    (Supplier_ID		varchar(8),
    Name				varchar(20) not null,
    Product_ID			varchar(8),
    primary key (Supplier_ID),
    foreign key (Product_ID) references Warehouse (Product_ID)
    	on delete cascade
    );

    create table truck_driver
	(Truck_ID		varchar(8),
    Name			varchar(20) not null,
    Product_ID		varchar(8),
    quantity		numeric(10,0),
    primary key (Truck_ID),
    foreign key (Product_ID) references Supplier (Product_ID)
		on delete cascade
    );

    create table Store
    (Store_ID			varchar(8),
    Location			varchar(50),
    primary key (Store_ID)
    );

    create table Aisle
    (Aisle_num			numeric(2,0),
    Catagory			varchar(20),
    shelf_num			numeric(4,0),
    primary key (Aisle_num)
    );

    create table shelf
    (Shelf_ID			varchar(8),
    Catagory			Varchar(20),
    Product_ID			varchar(8),
    primary key (shelf_ID),
    foreign key (product_ID) references product (Product_ID)
    );

    create table Manager
    (Manager_ID 		varchar(8),
    Name				varchar(20) not null,
    PhoneNumber			varchar(12),
    primary key (Manager_ID)
    );

    create table Employee
    (Employee_ID		varchar(8),
    Name				varchar(20) not null,
    PhoneNumber			varchar(12),
    primary key (Employee_ID)
    );

    create table Delivery_Driver
    (Driver_ID			varchar(8),
    Name				varchar(20) not null,
    PhoneNumber			varchar(12),
    primary key (Driver_ID)
    );

    create table Company
    (Company_ID			varchar(8),
    Name				varchar(20) not null,
    Location			varchar(50),
    primary key (Company_ID)
    );
