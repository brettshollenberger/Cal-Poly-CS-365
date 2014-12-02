require "mysql2"

class MysqlTable
  attr_accessor :database_name, :table_name

  def initialize(database_name, table_name)
    @database_name = database_name
    @table_name    = table_name
  end

  def count
    client.query("select count(*) from #{table_name}").first.values.first
  end

  def delete_all
    client.query("delete from #{table_name}")
  end

private
  def client
    Mysql2::Client.new(:host => "localhost", :username => "root", :database => database_name)
  end
end

