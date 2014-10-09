require "csv"
require_relative '../classes/item'

class ItemParser
  def create_items(repository, filename = "../../data/item.csv")
    if filename == "/Users/kalahmac/Turing/sales_engine_spec_harness/csvs"
      filename += "/items.csv"
    end

    CSV.open(filename, headers: true, header_converters: :symbol).map do |row|
      Item.new(row, repository)
    end
  end
end
