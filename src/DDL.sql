create table Login_Information (
username varchar(30),
password varchar(30),
primary key (username),
foreign key (account_number) references account(account_number)
)

create table Account (
account_number numeric not null auto_increment,
name varchar(30),
primary key (account_number),
foreign key (username) references login_information(username),
foreign key (order_number) references order(order_number)
)

create table Address (
state varchar(30),
city varchar(30),
street varchar(50),
zip_code numeric(5,0),
primary key (account_number) references account(account_number) on delete cascade
)

create table Payment_Method (
name varchar(30),
type varchar(20),
information varchar(50),
primary key (account_number) references account(account_number) on delete cascade
)

create table Product (
  product_ID numeric(5,0) not null,
  name varchar(30),
  quantity numeric(10,0),
  primary key (product_ID),
  foreign key (shelf_ID) references shelf(shelf_ID)
)

create table order (
order_number numeric not null auto_increment,
product_ID numeric(5,0) not null,
order_date varchar(30),
primary key (order_number),
foreign key (account_number) references account(account_number) on delete cascade,
foreign key (product_ID) references product(product_ID) on delete cascade
)

create table delivery_method (
  type varchar(30),
  primary key (order_number) references order(order_number) on delete cascade
)

create table order_history(
  primary key (account_number) references account(account_number) on delete cascade,
  foreign key (order_number) references order(order_number)
)

create table Warehouse
    (Warehouse_num		numeric(25,0),
    Product_ID			varchar(8),
    Quantity			numeric(10,0),
	primary key (Warehouse_num),
    foreign key (Product_ID, Quantity) references Product (Product_ID, Quantity)
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
