require "csv"
require_relative '../classes/transaction'

class TransactionParser
  def create_transactions(repository, filename = "../../data/transaction.csv")
    if filename == "/Users/kalahmac/Turing/sales_engine_spec_harness/csvs"
      filename += "/transactions.csv"
    end

    CSV.open(filename, headers: true, header_converters: :symbol).map do |row|
      Transaction.new(row, repository)
    end
  end
end
