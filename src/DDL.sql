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
