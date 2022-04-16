create table login_information (
username varchar(30),
password varchar(30),
primary key (username),
foreign key (account_number) references account(account_number)
)

create table account (
account_number numeric not null auto_increment,
name varchar(30),
primary key (account_number),
foreign key (username) references login_information(username)
foreign key (order_number) references order(order_number)
)

create table address (
state varchar(30),
city varchar(30),
street varchar(50),
zip_code numeric,
primary key (account_number) references account(account_number) on delete cascade
)

create table payment_method (
name varchar(30),
type varchar(20),
information varchar(50),
primary key (account_number) references account(account_number) on delete cascade
)

create table order (
order_number numeric not null auto_increment,
products varchar(100),
order_date varchar(30),
primary key (order_number),
foreign key (account_number) references account(account_number) on delete cascade
foreign key (product_ID) references product(product_ID) on delete cascade
)

create table delivery_method (
  type varchar(30),
  primary key (order_number) references order(order_number) on delete cascade
)

create table order_history(
  primary key (account_number) references account(account_number) on delete cascade
  foreign key (order_number) references order(order_number)
)
