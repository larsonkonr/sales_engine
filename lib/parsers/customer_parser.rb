require "csv"
require_relative '../classes/customer'

class CustomerParser
  def create_customers(repository, filename = "../../data/customers.csv")
    if filename == "/Users/kalahmac/Turing/sales_engine_spec_harness/csvs"
      filename += "/customers.csv"
    end

    CSV.open(filename, headers: true, header_converters: :symbol).map do |row|
      Customer.new(row, repository)
    end
  end
end
