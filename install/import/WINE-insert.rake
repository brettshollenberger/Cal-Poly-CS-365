#!/usr/bin/env ruby

require "rake"

sh './mysql-import --fields "{id: Integer, name: String, county: -> (c) { c == \"N/A\" ? NULL : \"\'#{c}\'\" }, state: String, area: -> (a) { a == \"N/A\" ? NULL : \"\'#{a}\'\" }, isAVA: -> (b) { b == \"Yes\" }}" --file ./datasets/wine/appellations.csv --database="datasets_wines" --table="appelations"'

sh './mysql-import --fields "{id: Integer, name: String, color: String}" --file ./datasets/wine/grapes.csv --database="datasets_wines" --table="grapes"'

sh './mysql-import --fields "{id: Integer, grape: String, winery: String, appelation: String, state: Ignore, name: String, year: Integer, price: Integer, score: Integer, cases: Integer}" --file ./datasets/wine/wine.csv --database="datasets_wines" --table="wines"'
