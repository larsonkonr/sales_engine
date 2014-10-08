require "csv"
require_relative '../classes/transaction'

class TransactionParser
  def create_transactions(repository, filename = "../../data/transaction.csv")
    CSV.open(filename, headers: true, header_converters: :symbol).map do |row|
      Transaction.new(row, repository)
    end
  end
end
