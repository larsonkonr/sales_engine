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
    customers.select { |customer| customer.first_name == first_name}
  end

  def find_by_last_name(last_name)
    customers.select { |customer| customer.last_name == last_name }
  end

  def find_by_id(id)
    customers.select { |customer| customer.id == id }
  end

  def find_by_created_at(created_at)
    customers.select {|customer| customer.created_at == created_at}
  end

  def find_by_updated_at(updated_at)
    customers.select {|customer| customer.updated_at == updated_at}
  end

end
