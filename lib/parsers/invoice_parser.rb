require "csv"
require_relative '../classes/invoice'

class InvoiceParser
  def create_invoices(repository, filename = "../../data/invoice.csv")
    if filename == "/Users/kalahmac/Turing/sales_engine_spec_harness/csvs"
      filename += "/invoices.csv"
    end

    CSV.open(filename, headers: true, header_converters: :symbol).map do |row|
      Invoice.new(row, repository)
    end
  end
end
