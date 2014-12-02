#!/usr/bin/env ruby

require "rake"

sh "./mysql-import --fields '{id: Integer, name: String, location: String, county: String, year: Integer}' --file ./datasets/csu/Campuses.csv --database 'datasets_csu' --table 'campuses'"

sh "./mysql-import --fields '{campus_id: Integer, year: Integer, fee: Integer}' --file ./datasets/csu/csu-fees.csv --database 'datasets_csu' --table 'campus_fees'"

sh "./mysql-import --fields '{year: Integer, campus_id: Integer, count: Integer}' --file ./datasets/csu/degrees.csv --database 'datasets_csu' --table 'degrees'"

sh "./mysql-import --fields '{id: Integer, name: String}' --file ./datasets/csu/disciplines.csv --database 'datasets_csu' --table 'disciplines'"

sh "./mysql-import --fields '{campus_id: Integer, discipline_id: Integer, year: Integer, undergraduate: Integer, graduate: Integer}' --file ./datasets/csu/discipline-enrollments.csv --database 'datasets_csu' --table 'discipline_enrollments'"

sh "./mysql-import --fields '{campus_id: Integer, year: Integer, total: Integer, fte: Integer}' --file ./datasets/csu/enrollments.csv --database 'datasets_csu' --table 'enrollments'"

sh "./mysql-import --fields '{campus_id: Integer, year: Integer, faculty: Float}' --file ./datasets/csu/faculty.csv --database 'datasets_csu' --table 'faculty'"
