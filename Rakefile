require_relative "./install/lib/dataset_mapper"
require_relative "./install/tasks/datasets"
require_relative "./install/tasks/import_database"
require_relative "./install/tasks/setup_database"
require_relative "./install/tasks/clobber"

DATASETS = ["csu", "cars", "bakery", "students", "marathon", "airlines", "wine", "inn"]

datasets *DATASETS

desc "Build the Cal Poly CS-365 datasets"
task :default => "mysql:import"

directory "install/datasets"

desc "Download the CSVs required to build the tables"
task "download_datasets" => ["install/datasets"].concat(DATASETS.map { |d| "install/datasets/#{d}" })

desc "Create the databases and tables"
task "mysql:setup"       => "mysql:setup:all"

desc "Import CSV data into the tables"
task "mysql:import"      => "mysql:import:all"

desc "Destroy the databases"
task "mysql:clobber"     => "mysql:clobber:all"

desc "Destroy the databases & re-build them"
task "mysql:rebuild"     => "mysql:rebuild:all"

namespace :mysql do
  namespace :setup do
    DATASETS.each do |dataset|
      setup_database dataset => :download_datasets do
        sh "mysql -u root < install/setup/#{dataset}-setup.sql"
      end
    end

    task :all => DATASETS
  end

  namespace :import do
    DATASETS.each do |dataset|
      import_database dataset => "mysql:setup:#{dataset}" do
        sh "ruby ./install/import/#{dataset.upcase}-insert.rake"
      end
    end

    task :all => DATASETS
  end

  namespace :clobber do
    DATASETS.each do |dataset|
      clobber dataset
    end

    task :all => DATASETS
  end

  namespace :rebuild do
    DATASETS.each do |dataset|
      task dataset => ["mysql:clobber:#{dataset}", "mysql:import:#{dataset}"]
    end

    task :all => DATASETS
  end
end
