#!/usr/bin/env ruby

require "rake"

sh "./install/mysql-import --fields '{id: String, flavor: String, food: String, price: Float}' --file ./install/datasets/bakery/goods.csv --database 'bakery' --table 'goods'"

sh "./install/mysql-import --fields '{id: Integer, last_name: String, first_name: String}' --file ./install/datasets/bakery/customers.csv --database 'bakery' --table 'customers'"

sh "./install/mysql-import --fields '{id: Integer, date: Date, customer_id: Integer}' --file ./install/datasets/bakery/receipts.csv --database 'bakery' --table 'receipts'"

sh "./install/mysql-import --fields '{receipt_id: Integer, ordinal: Integer, good_id: String}' --file ./install/datasets/bakery/items.csv --database 'bakery' --table 'receipt_items'"
