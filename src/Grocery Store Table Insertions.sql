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

-- Insert values into order history(assumes order history is the history of client orders)
INSERT INTO order_history(history_id, account_number, order_number)
VALUES('08224', '1', '51570')

INSERT INTO order_history(history_id, account_number, order_number)
VALUES('07839 ', '10', '92626')

INSERT INTO order_history(history_id, account_number, order_number)
VALUES('83624 ', '10', '45873')

INSERT INTO order_history(history_id, account_number, order_number)
VALUES('97028 ', '20', '43656')

INSERT INTO order_history(history_id, account_number, order_number)
VALUES('31614 ', '30', '99496')

INSERT INTO order_history(history_id, account_number, order_number)
VALUES('44748 ', '40', '45121')

-- Insert values into warehouse(Does not allow duplicate warehouse_num)
INSERT INTO warehouse(warehouse_num, product_id, quantity)
VALUES('461', '1', '10249')

INSERT INTO warehouse(warehouse_num, product_id, quantity)
VALUES('773 ', '2', '87938 ')

INSERT INTO warehouse(warehouse_num, product_id, quantity)
VALUES('179  ', '3', '16290 ')

INSERT INTO warehouse(warehouse_num, product_id, quantity)
VALUES('613 ', '4', '30405 ')

INSERT INTO warehouse(warehouse_num, product_id, quantity)
VALUES('285  ', '5', '80961 ')

-- Insert values into supplier
INSERT INTO supplier(supplier_id, name, product_id)
VALUES('6568', 'Lucero INC.', '1')

INSERT INTO supplier(supplier_id, name, product_id)
VALUES('4470', 'Balwinder LLC.', '2')

INSERT INTO supplier(supplier_id, name, product_id)
VALUES('4541', 'Caron INC.', '3')

INSERT INTO supplier(supplier_id, name, product_id)
VALUES('2876', 'Parminder INC.', '4')

INSERT INTO supplier(supplier_id, name, product_id)
VALUES('0559', 'Udo LLC.', '5')

-- Insert values into truck driver
INSERT INTO truck_driver(truck_id, name, product_id, quantity)
VALUES('040', 'Rani Chizoba', '1', '3609')

INSERT INTO truck_driver(truck_id, name, product_id, quantity)
VALUES('722', 'Pip Vinh', '1', '8141')

INSERT INTO truck_driver(truck_id, name, product_id, quantity)
VALUES('381', 'Shi Mu', '1', '0776')

INSERT INTO truck_driver(truck_id, name, product_id, quantity)
VALUES('207', 'Kerry Lakshmi', '1', '4810')

INSERT INTO truck_driver(truck_id, name, product_id, quantity)
VALUES('273', 'Bilge İlkay', '1', '2933')

-- Insert values into store
INSERT INTO store(store_id, location)
VALUES('643', 'San Antonio')

INSERT INTO store(store_id, location)
VALUES('435 ', 'Vidor')

INSERT INTO store(store_id, location)
VALUES('369', 'Birmingham')

-- Insert into aisle
INSERT INTO aisle(aisle_num, catagory, shelf_num)
VALUES('1', 'pasta', '5')

INSERT INTO aisle(aisle_num, catagory, shelf_num)
VALUES('2', 'Condiments', '2')

INSERT INTO aisle(aisle_num, catagory, shelf_num)
VALUES('3', 'Condiments', '1')

INSERT INTO aisle(aisle_num, catagory, shelf_num)
VALUES('4', 'Condiments', '6')

INSERT INTO aisle(aisle_num, catagory, shelf_num)
VALUES('5', 'Health', '3')

-- Insert values into shelf
INSERT INTO shelf(shelf_id, catagory, product_id)
VALUES('1', 'pasta', '1')

INSERT INTO shelf(shelf_id, catagory, product_id)
VALUES('2', 'Condiments', '2')

INSERT INTO shelf(shelf_id, catagory, product_id)
VALUES('3', 'Health', '3')

INSERT INTO shelf(shelf_id, catagory, product_id)
VALUES('4', 'Condiments', '4')

INSERT INTO shelf(shelf_id, catagory, product_id)
VALUES('5', 'Condiments', '5')

-- Insert values into manager
INSERT INTO manager(manager_id, name, phoneNumber)
VALUES('1', 'Coraline Dileep', '210-200-6964')

INSERT INTO manager(manager_id, name, phoneNumber)
VALUES('2', 'Bernhard Zeltzin', '940-444-2844')

INSERT INTO manager(manager_id, name, phoneNumber)
VALUES('3', 'Nikita Swapna', '713-897-1178')

-- Insert into employee
INSERT INTO employee(employee_id, name, phoneNumber)
VALUES('10', 'Antiope Kieron', '713-981-0726')

INSERT INTO employee(employee_id, name, phoneNumber)
VALUES('15', 'Shad Clem', '432-245-6094')

INSERT INTO employee(employee_id, name, phoneNumber)
VALUES('20', 'Murphy Sage', '432-332-3837')

INSERT INTO employee(employee_id, name, phoneNumber)
VALUES('25', 'Rolph Bennie', '432-459-5683')

INSERT INTO employee(employee_id, name, phoneNumber)
VALUES('30', 'Jep Kelan', '469-327-9762')

INSERT INTO employee(employee_id, name, phoneNumber)
VALUES('35', 'Marty Albert', '817-429-0691')

-- Insert into delivery driver
INSERT INTO delivery_driver(driver_id, name, phoneNumber)
VALUES('100', 'Jackson Lew', '830-998-4541')

INSERT INTO delivery_driver(driver_id, name, phoneNumber)
VALUES('120', 'Tel Peter', '903-997-4605')

INSERT INTO delivery_driver(driver_id, name, phoneNumber)
VALUES('140', 'Karsyn Eldon', '972-404-7494')

-- Insert into company
INSERT INTO company(company_id, name, location)
VALUES('1', 'Shopstand', 'Dallas')

INSERT INTO company(company_id, name, location)
VALUES('2', 'Constore', 'San Antonio')

INSERT INTO company(company_id, name, location)
VALUES('3', 'hstore', 'Houston')



