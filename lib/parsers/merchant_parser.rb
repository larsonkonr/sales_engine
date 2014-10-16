require "csv"
require_relative '../classes/merchant'

class MerchantParser
  def create_merchants(repository, filename = "../../data")
    CSV.open("#{filename}/merchants.csv",
        headers: true, header_converters: :symbol).map do |row|
      Merchant.new(row, repository)
    end
  end
end
