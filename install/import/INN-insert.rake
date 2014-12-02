#!/usr/bin/env ruby

require "rake"

sh "./install/mysql-import --fields '{id: String, name: String, beds: Integer, bed_type: String, max_occupancy: Integer, base_price: Integer, decor: String}' --file ./install/datasets/inn/rooms.csv --database 'inn' --table 'rooms'"

sh "./install/mysql-import --fields '{code: Integer, room_id: String, check_in: Date, check_out: Date, rate: Float, last_name: Name, first_name: Name, adults: Integer, children: Integer}' --file ./install/datasets/inn/reservations.csv --database 'inn' --table 'reservations'"
