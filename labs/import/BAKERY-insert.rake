#!/usr/bin/env ruby

require "rake"

sh "./mysql-import --fields '{id: String, flavor: String, food: String, price: Float}' --file ./datasets/bakery/goods.csv --database 'datasets_bakery' --table 'goods'"

sh "./mysql-import --fields '{id: Integer, last_name: String, first_name: String}' --file ./datasets/bakery/customers.csv --database 'datasets_bakery' --table 'customers'"

sh "./mysql-import --fields '{id: Integer, date: Date, customer_id: Integer}' --file ./datasets/bakery/receipts.csv --database 'datasets_bakery' --table 'receipts'"

sh "./mysql-import --fields '{receipt_id: Integer, ordinal: Integer, good_id: String}' --file ./datasets/bakery/items.csv --database 'datasets_bakery' --table 'receipt_items'"
