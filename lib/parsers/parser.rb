# require "csv"
# require '../classes/customer'

class Parser
  def self.load_file(filepath = "../data/")
  end

  def self.load_customers(filepath)
    [Customer.new]
  end

  def create_merchants(klass, filename, filepath = "../data")
    contents = CSV.open("#{filepath}/#{filename}", headers: true, header_converters: :symbol)

  end
end
