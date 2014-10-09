require_relative '../classes/customer'
require_relative '../parsers/customer_parser'

class CustomerRepository

  attr_reader :customers, :sales_engine

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def initialize(sales_engine, filepath)
    @customers = CustomerParser.new.create_customers(self, filepath)
    @sales_engine = sales_engine
  end

  def find_by_first_name(first_name)
    customers.find { |customer| customer.first_name == first_name}
  end

  def find_by_last_name(last_name)
    customers.find { |customer| customer.last_name == last_name }
  end

  def find_by_id(id)
    customers.find { |customer| customer.id == id.to_s }
  end

  def find_by_created_at(created_at)
    customers.find {|customer| customer.created_at == created_at}
  end

  def find_by_updated_at(updated_at)
    customers.find {|customer| customer.updated_at == updated_at}
  end

  def find_all_by_first_name(first_name)
    customers.select { |customer| customer.first_name == first_name}
  end

  def random
    customers.sample
  end
end
