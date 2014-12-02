def import_database(*args, &block)
  dataset = args.first.keys.first
  name    = DatasetMapper.dataset_name(dataset)
  tables  = DatasetMapper.dataset_tables(dataset)

  task args.first do
    unless tables.all? { |table| table.count > 0 }
      tables.each(&:delete_all)

      block.call
    end
  end
end
