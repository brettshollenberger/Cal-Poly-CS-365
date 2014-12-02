#!/usr/bin/env ruby

require "rake"

sh "./mysql-import --fields '{id: Integer, name: String, abbreviation: String, country: String}' --file ./datasets/airlines/airlines.csv --database 'datasets_airlines' --table 'airlines'"

sh "./mysql-import --fields '{city: String, code: String, name: String, country: String, country_abbreviation: String}' --file ./datasets/airlines/airports100.csv --database 'datasets_airlines' --table 'airports'"
