-- Insert values into the user account table
INSERT INTO user_account(account_number, name)
VALUES('0001', 'Bob')

INSERT INTO user_account(account_number, name)
VALUES('0010', 'John')

INSERT INTO user_account(account_number, name)
VALUES('20', 'Matthew')

INSERT INTO user_account(account_number, name)
VALUES('30', 'Heidi')

INSERT INTO user_account(account_number, name)
VALUES('40', 'Maddie')

-- Insert values into the login info table
INSERT INTO login_information(username, password, account_number)
VALUES('Bob156', 'Ba#1567', '1')

INSERT INTO login_information(username, password, account_number)
VALUES('JohnMan123', 'passwoRd', '10')

INSERT INTO login_information(username, password, account_number)
VALUES('MatthewIsAwesome158', 'mattMan123', '20')

INSERT INTO login_information(username, password, account_number)
VALUES('Heidi_567', 'HMG#878', '30')

INSERT INTO login_information(username, password, account_number)
VALUES('dswMaddie', '895437dSw', '40')

-- Insert values into address
INSERT INTO address(address_id, state, city, street, zip_code, account_number)
VALUE('1', 'TX', 'Keller', '1872 Moore Avenue', '76248', '1')

INSERT INTO address(address_id, state, city, street, zip_code, account_number)
VALUE('2', 'TX', 'Houston', '1643 Poe Road', '77032', '10')

INSERT INTO address(address_id, state, city, street, zip_code, account_number)
VALUE('3', 'TX', 'Mcallen', '1361 Jerome Avenue', '78501', '20')

INSERT INTO address(address_id, state, city, street, zip_code, account_number)
VALUE('4', 'TX', 'Dallas', '2475 Romines Mill Road', '75207', '30')

INSERT INTO address(address_id, state, city, street, zip_code, account_number)
VALUE('5', 'TX', 'San Antonio', '2171 Fidler Drive', '78219', '40')

-- Insert values into payment method (information is card #)
INSERT INTO payment_method(payment_id, name, type, information, account_number)
VALUES('1', 'Bob', 'Debit', '6731127647902690', '1')

INSERT INTO payment_method(payment_id, name, type, information, account_number)
VALUES('2', 'John', 'Debit', '8015708522230126', '10')

INSERT INTO payment_method(payment_id, name, type, information, account_number)
VALUES('3', 'Matthew', 'Debit', '5069753873675039', '20')

INSERT INTO payment_method(payment_id, name, type, information, account_number)
VALUES('4', 'Heidi', 'Debit', '7198279568075961 ', '30')

INSERT INTO payment_method(payment_id, name, type, information, account_number)
VALUES('5', 'Maddie', 'Debit', '7343726507535318 ', '40')

-- Insert values into product
INSERT INTO product(product_id, name, quantity, shelf_id)
VALUES('1', 'Spaghetti', '58', '58')

INSERT INTO product(product_id, name, quantity, shelf_id)
VALUES('2', 'Nutella', '14', '50')

INSERT INTO product(product_id, name, quantity, shelf_id)
VALUES('3', 'Peanut Butter', '38', '72')

INSERT INTO product(product_id, name, quantity, shelf_id)
VALUES('4', 'Jelly', '16', '63')

INSERT INTO product(product_id, name, quantity, shelf_id)
VALUES('5', 'Hand Sanitizer', '196', '89')

-- Insert values into customer order
INSERT INTO customer_order(order_number, product_id, order_date, account_number)
VALUES('51570', '1', '4/4/2020', '1')

INSERT INTO customer_order(order_number, product_id, order_date, account_number)
VALUES('92626 ', '2', '3/17/2020', '10')

INSERT INTO customer_order(order_number, product_id, order_date, account_number)
VALUES('45873 ', '1', '4/15/2020', '10')

INSERT INTO customer_order(order_number, product_id, order_date, account_number)
VALUES('43656 ', '4', '4/4/2020', '20')

INSERT INTO customer_order(order_number, product_id, order_date, account_number)
VALUES('99496 ', '2', '2/4/2020', '30')

INSERT INTO customer_order(order_number, product_id, order_date, account_number)
VALUES('45121 ', '1', '3/4/2020', '40')

-- Insert values into delivery method
INSERT INTO delivery_method(delivery_id, type, order_number)
VALUES('1', 'Pickup', '51570')

INSERT INTO delivery_method(delivery_id, type, order_number)
VALUES('2', 'Delivery', '92626')

INSERT INTO delivery_method(delivery_id, type, order_number)
VALUES('3', 'Delivery', '45873')

INSERT INTO delivery_method(delivery_id, type, order_number)
VALUES('4', 'Pickup', '43656')

INSERT INTO delivery_method(delivery_id, type, order_number)
VALUES('5', 'Delivery', '99496')

INSERT INTO delivery_method(delivery_id, type, order_number)
VALUES('6', 'Pickup', '45121')