require "csv"
require_relative '../classes/invoice'

class InvoiceParser
  def create_invoices(repository, filename = "../..")

    CSV.open("#{filename}/invoices.csv", headers: true, header_converters: :symbol).map do |row|
      Invoice.new(row, repository)
    end
  end
end
