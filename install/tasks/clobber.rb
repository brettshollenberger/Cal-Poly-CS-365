def clobber(name, &block)
  task name do
    begin
      sh "echo 'DROP DATABASE #{DatasetMapper.dataset_name(name)};' | mysql -u root 2> /dev/null"
    rescue => e
    end
  end
end
