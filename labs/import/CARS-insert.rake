#!/usr/bin/env ruby

require "rake"

sh "./mysql-import --fields '{id: Integer, name: String}' --file ./datasets/cars/continents.csv --database 'datasets_cars' --table 'continents'"

sh "./mysql-import --fields '{id: Integer, name: String, continent_id: Integer}' --file ./datasets/cars/countries.csv --database 'datasets_cars' --table 'countries'"

sh "./mysql-import --fields '{id: Integer, short_name: String, full_name: String, country_id: -> (c) { c.to_i == 0 ? NULL : c.to_i }}' --file ./datasets/cars/car-makers.csv --database 'datasets_cars' --table 'makers'"

sh "./mysql-import --fields '{id: Integer, maker: Integer, model: String}' --file ./datasets/cars/model-list.csv --database 'datasets_cars' --table 'models'"

sh "./mysql-import --fields '{id: Integer, model: String, make: String}' --file ./datasets/cars/car-names.csv --database 'datasets_cars' --table 'car_names'"

sh "./mysql-import --fields '{id: Integer, mpg: Integer, cylinders: Integer, engine_displacement: Integer, horsepower: Integer, weight: Integer, acceleration_time: Float, year: Integer}' --file ./datasets/cars/cars-data.csv --database 'datasets_cars' --table 'cars'"
