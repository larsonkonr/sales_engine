require "csv"
require_relative '../classes/item'

class ItemParser
  def create_items(repository, filename = "../../data")

    CSV.open("#{filename}/items.csv",
        headers: true, header_converters: :symbol).map do |row|
      Item.new(row, repository)
    end
  end
end
