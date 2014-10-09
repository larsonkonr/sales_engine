require "csv"
require_relative '../classes/merchant'

class MerchantParser
  def create_merchants(repository, filename = "../../data/merchant.csv")
    if filename == "/Users/kalahmac/Turing/sales_engine_spec_harness/csvs"
      filename += "/merchants.csv"
    end

    CSV.open(filename, headers: true, header_converters: :symbol).map do |row|
      Merchant.new(row, repository)
    end
  end
end
