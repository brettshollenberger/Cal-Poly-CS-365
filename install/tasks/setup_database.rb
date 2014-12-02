def setup_database(*args, &block)
  name = DatasetMapper.dataset_name(args.first.keys.first)

  task args.first do
    begin
      verbose(false) do
        sh "echo 'use #{name};' | mysql -u root 2> /dev/null"
      end
    rescue => e
      block.call
    end
  end
end
