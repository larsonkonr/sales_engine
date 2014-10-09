require "csv"
require_relative '../classes/invoice_item'

class InvoiceItemParser
  def create_invoice_items(repository, filename = "../../data")

    CSV.open("#{filename}/invoice_items.csv", headers: true, header_converters: :symbol).map do |row|
      InvoiceItem.new(row, repository)
    end
  end
end
