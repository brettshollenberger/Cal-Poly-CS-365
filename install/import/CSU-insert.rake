#!/usr/bin/env ruby

require "rake"

sh "./install/mysql-import --fields '{id: Integer, name: String, location: String, county: String, year: Integer}' --file ./install/datasets/csu/Campuses.csv --database 'datasets_csu' --table 'campuses'"

sh "./install/mysql-import --fields '{campus_id: Integer, year: Integer, fee: Integer}' --file ./install/datasets/csu/csu-fees.csv --database 'datasets_csu' --table 'campus_fees'"

sh "./install/mysql-import --fields '{year: Integer, campus_id: Integer, count: Integer}' --file ./install/datasets/csu/degrees.csv --database 'datasets_csu' --table 'degrees'"

sh "./install/mysql-import --fields '{id: Integer, name: String}' --file ./install/datasets/csu/disciplines.csv --database 'datasets_csu' --table 'disciplines'"

sh "./install/mysql-import --fields '{campus_id: Integer, discipline_id: Integer, year: Integer, undergraduate: Integer, graduate: Integer}' --file ./install/datasets/csu/discipline-enrollments.csv --database 'datasets_csu' --table 'discipline_enrollments'"

sh "./install/mysql-import --fields '{campus_id: Integer, year: Integer, total: Integer, fte: Integer}' --file ./install/datasets/csu/enrollments.csv --database 'datasets_csu' --table 'enrollments'"

sh "./install/mysql-import --fields '{campus_id: Integer, year: Integer, faculty: Float}' --file ./install/datasets/csu/faculty.csv --database 'datasets_csu' --table 'faculty'"
