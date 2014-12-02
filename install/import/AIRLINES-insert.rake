#!/usr/bin/env ruby

require "rake"

sh "./install/mysql-import --fields '{id: Integer, name: String, abbreviation: String, country: String}' --file ./install/datasets/airlines/airlines.csv --database 'datasets_airlines' --table 'airlines'"

sh "./install/mysql-import --fields '{city: String, code: String, name: String, country: String, country_abbreviation: String}' --file ./install/datasets/airlines/airports100.csv --database 'datasets_airlines' --table 'airports'"
