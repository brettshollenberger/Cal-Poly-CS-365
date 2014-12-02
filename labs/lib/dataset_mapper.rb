require "active_support/hash_with_indifferent_access"
require_relative "./mysql_table"

DATASET_MAP = {
  :csu => "datasets_csu",
  :cars => "datasets_cars",
  :bakery => "datasets_bakery",
  :students => "datasets_students",
  :marathon => "datasets_marathon",
  :airlines => "datasets_airlines",
  :wine => "datasets_wines",
  :inn => "datasets_inn"
}

DATASET_TABLES = {
  :airlines => ["airlines", "airports"],
  :bakery => ["goods", "customers", "receipts", "receipt_items"],
  :cars => ["continents", "countries", "makers", "models", "car_names", "cars"],
  :csu => ["campuses", "campus_fees", "degrees", "disciplines", "discipline_enrollments", "enrollments", "faculty"],
  :inn => ["rooms", "reservations"],
  :marathon => ["runners"],
  :students => ["teachers", "students"],
  :wine => ["appelations", "grapes", "wines"]
}

class DatasetMapper
  def self.dataset_name(dataset)
    HashWithIndifferentAccess.new(DATASET_MAP)[dataset]
  end

  def self.dataset_tables(dataset)
    HashWithIndifferentAccess.new(DATASET_TABLES)[dataset].map do |table_name|
      MysqlTable.new(dataset_name(dataset), table_name)
    end
  end
end
