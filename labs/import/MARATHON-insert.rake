#!/usr/bin/env ruby

require "rake"

sh "./mysql-import --fields '{place: Integer, time: Time, pace: Time, group_place: Integer, group_name: String, age: Integer, sex: String, bib_number: Integer, first_name: Name, last_name: Name, town: String, state: String}' --file ./datasets/marathon/marathon.csv --database 'datasets_marathon' --table 'runners'"
