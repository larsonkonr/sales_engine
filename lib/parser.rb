require "csv"
require './lib/customer'

class Parser
  def self.load_file(filepath = "../data/")
    contents = CSV.open(filepath, headers: true, header_converters: :symbol)
  end

  def self.load_customers(filepath)
    [Customer.new]
  end
end
