#!/usr/bin/env ruby

require "rake"

sh "./install/mysql-import --fields '{id: Integer, name: String}' --file ./install/datasets/cars/continents.csv --database 'datasets_cars' --table 'continents'"

sh "./install/mysql-import --fields '{id: Integer, name: String, continent_id: Integer}' --file ./install/datasets/cars/countries.csv --database 'datasets_cars' --table 'countries'"

sh "./install/mysql-import --fields '{id: Integer, short_name: String, full_name: String, country_id: -> (c) { c.to_i == 0 ? NULL : c.to_i }}' --file ./install/datasets/cars/car-makers.csv --database 'datasets_cars' --table 'makers'"

sh "./install/mysql-import --fields '{id: Integer, maker: Integer, model: String}' --file ./install/datasets/cars/model-list.csv --database 'datasets_cars' --table 'models'"

sh "./install/mysql-import --fields '{id: Integer, model: String, make: String}' --file ./install/datasets/cars/car-names.csv --database 'datasets_cars' --table 'car_names'"

sh "./install/mysql-import --fields '{id: Integer, mpg: Integer, cylinders: Integer, engine_displacement: Integer, horsepower: Integer, weight: Integer, acceleration_time: Float, year: Integer}' --file ./install/datasets/cars/cars-data.csv --database 'datasets_cars' --table 'cars'"
