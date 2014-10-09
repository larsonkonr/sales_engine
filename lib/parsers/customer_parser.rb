require "csv"
require_relative '../classes/customer'

class CustomerParser
  def create_customers(repository, filename = "../../data")

    CSV.open("#{filename}/customers.csv", headers: true, header_converters: :symbol).map do |row|
      Customer.new(row, repository)
    end
  end
end
