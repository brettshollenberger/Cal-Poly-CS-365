#!/usr/bin/env ruby

require "rake"

sh "./install/mysql-import --fields '{last_name: Name, first_name: Name, classroom: Integer}' --file ./install/datasets/students/teachers.csv --database 'datasets_students' --table 'teachers'"

sh "./install/mysql-import --fields '{last_name: Name, first_name: Name, grade: Integer, classroom: Integer}' --file ./install/datasets/students/list.csv --database 'datasets_students' --table 'students'"
