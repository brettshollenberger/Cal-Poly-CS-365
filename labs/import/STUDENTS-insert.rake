#!/usr/bin/env ruby

require "rake"

sh "./mysql-import --fields '{last_name: Name, first_name: Name, classroom: Integer}' --file ./datasets/students/teachers.csv --database 'datasets_students' --table 'teachers'"

sh "./mysql-import --fields '{last_name: Name, first_name: Name, grade: Integer, classroom: Integer}' --file ./datasets/students/list.csv --database 'datasets_students' --table 'students'"
