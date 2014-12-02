#!/usr/bin/env ruby

require "rake"

sh './install/mysql-import --fields "{id: Integer, name: String, county: -> (c) { c == \"N/A\" ? NULL : \"\'#{c}\'\" }, state: String, area: -> (a) { a == \"N/A\" ? NULL : \"\'#{a}\'\" }, isAVA: -> (b) { b == \"Yes\" }}" --file ./install/datasets/wine/appellations.csv --database="datasets_wines" --table="appelations"'

sh './install/mysql-import --fields "{id: Integer, name: String, color: String}" --file ./install/datasets/wine/grapes.csv --database="datasets_wines" --table="grapes"'

sh './install/mysql-import --fields "{id: Integer, grape: String, winery: String, appelation: String, state: Ignore, name: String, year: Integer, price: Integer, score: Integer, cases: Integer}" --file ./install/datasets/wine/wine.csv --database="datasets_wines" --table="wines"'
