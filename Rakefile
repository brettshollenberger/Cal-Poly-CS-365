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

task "download_datasets" => ["install/datasets"].concat(DATASETS.map { |d| "install/datasets/#{d}" })

desc "Create the databases and tables"
task "mysql:setup"       => "mysql:setup:all"

desc "Import CSV data into the tables"
task "build"             => "mysql:build"
task "mysql:build"       => "mysql:build:all"

desc "Destroy the databases"
task "clobber"           => "mysql:clobber"
task "mysql:clobber"     => "mysql:clobber:all"

desc "Destroy the databases & re-build them"
task "rebuild"           => "mysql:rebuild"
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

  namespace :build do
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
      task dataset => ["mysql:clobber:#{dataset}", "mysql:build:#{dataset}"]
    end

    task :all => DATASETS
  end
end
