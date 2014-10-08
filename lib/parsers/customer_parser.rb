require "csv"
require_relative '../classes/customer'

class CustomerParser
  def create_customers(repository, filename = "../../data/customer.csv")
    CSV.open(filename, headers: true, header_converters: :symbol).map do |row|
      Customer.new(row, repository)
    end
  end
end
